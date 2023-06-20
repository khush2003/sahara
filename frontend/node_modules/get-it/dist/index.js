import { processOptions, validateOptions } from './_chunks/defaultOptionsValidator-4ba94809.js';
import http from 'node:http';
import https from 'node:https';
import url from 'node:url';
import decompressResponse from 'decompress-response';
import follow from 'follow-redirects';
import toStream from 'into-stream';
import isStream from 'is-stream';
import progressStream from 'progress-stream';
import qs from 'querystring';
import * as tunnel from 'tunnel-agent';
var middlewareReducer = middleware => {
  const applyMiddleware = function (hook, defaultValue) {
    const bailEarly = hook === "onError";
    let value = defaultValue;
    for (var _len = arguments.length, args = new Array(_len > 2 ? _len - 2 : 0), _key = 2; _key < _len; _key++) {
      args[_key - 2] = arguments[_key];
    }
    for (let i = 0; i < middleware[hook].length; i++) {
      const handler = middleware[hook][i];
      value = handler(value, ...args);
      if (bailEarly && !value) {
        break;
      }
    }
    return value;
  };
  return applyMiddleware;
};
function createPubSub() {
  const subscribers = /* @__PURE__ */Object.create(null);
  let nextId = 0;
  function subscribe(subscriber) {
    const id = nextId++;
    subscribers[id] = subscriber;
    return function unsubscribe() {
      delete subscribers[id];
    };
  }
  function publish(event) {
    for (const id in subscribers) {
      subscribers[id](event);
    }
  }
  return {
    publish,
    subscribe
  };
}
const channelNames = ["request", "response", "progress", "error", "abort"];
const middlehooks = ["processOptions", "validateOptions", "interceptRequest", "finalizeOptions", "onRequest", "onResponse", "onError", "onReturn", "onHeaders"];
function createRequester(initMiddleware, httpRequest) {
  const loadedMiddleware = [];
  const middleware = middlehooks.reduce((ware, name) => {
    ware[name] = ware[name] || [];
    return ware;
  }, {
    processOptions: [processOptions],
    validateOptions: [validateOptions]
  });
  function request(opts) {
    const channels = channelNames.reduce((target, name) => {
      target[name] = createPubSub();
      return target;
    }, {});
    const applyMiddleware = middlewareReducer(middleware);
    const options = applyMiddleware("processOptions", opts);
    applyMiddleware("validateOptions", options);
    const context = {
      options,
      channels,
      applyMiddleware
    };
    let ongoingRequest = null;
    const unsubscribe = channels.request.subscribe(ctx => {
      ongoingRequest = httpRequest(ctx, (err, res) => onResponse(err, res, ctx));
    });
    channels.abort.subscribe(() => {
      unsubscribe();
      if (ongoingRequest) {
        ongoingRequest.abort();
      }
    });
    const returnValue = applyMiddleware("onReturn", channels, context);
    if (returnValue === channels) {
      channels.request.publish(context);
    }
    return returnValue;
    function onResponse(reqErr, res, ctx) {
      let error = reqErr;
      let response = res;
      if (!error) {
        try {
          response = applyMiddleware("onResponse", res, ctx);
        } catch (err) {
          response = null;
          error = err;
        }
      }
      error = error && applyMiddleware("onError", error, ctx);
      if (error) {
        channels.error.publish(error);
      } else if (response) {
        channels.response.publish(response);
      }
    }
  }
  request.use = function use(newMiddleware) {
    if (!newMiddleware) {
      throw new Error("Tried to add middleware that resolved to falsey value");
    }
    if (typeof newMiddleware === "function") {
      throw new Error("Tried to add middleware that was a function. It probably expects you to pass options to it.");
    }
    if (newMiddleware.onReturn && middleware.onReturn.length > 0) {
      throw new Error("Tried to add new middleware with `onReturn` handler, but another handler has already been registered for this event");
    }
    middlehooks.forEach(key => {
      if (newMiddleware[key]) {
        middleware[key].push(newMiddleware[key]);
      }
    });
    loadedMiddleware.push(newMiddleware);
    return request;
  };
  request.clone = function clone() {
    return createRequester(loadedMiddleware, httpRequest);
  };
  initMiddleware.forEach(request.use);
  return request;
}
function formatHostname(hostname) {
  return hostname.replace(/^\.*/, ".").toLowerCase();
}
function parseNoProxyZone(zoneStr) {
  const zone = zoneStr.trim().toLowerCase();
  const zoneParts = zone.split(":", 2);
  const zoneHost = formatHostname(zoneParts[0]);
  const zonePort = zoneParts[1];
  const hasPort = zone.indexOf(":") > -1;
  return {
    hostname: zoneHost,
    port: zonePort,
    hasPort
  };
}
function uriInNoProxy(uri, noProxy) {
  const port = uri.port || (uri.protocol === "https:" ? "443" : "80");
  const hostname = formatHostname(uri.hostname);
  const noProxyList = noProxy.split(",");
  return noProxyList.map(parseNoProxyZone).some(noProxyZone => {
    const isMatchedAt = hostname.indexOf(noProxyZone.hostname);
    const hostnameMatched = isMatchedAt > -1 && isMatchedAt === hostname.length - noProxyZone.hostname.length;
    if (noProxyZone.hasPort) {
      return port === noProxyZone.port && hostnameMatched;
    }
    return hostnameMatched;
  });
}
function getProxyFromUri(uri) {
  const noProxy = process.env.NO_PROXY || process.env.no_proxy || "";
  if (noProxy === "*") {
    return null;
  }
  if (noProxy !== "" && uriInNoProxy(uri, noProxy)) {
    return null;
  }
  if (uri.protocol === "http:") {
    return process.env.HTTP_PROXY || process.env.http_proxy || null;
  }
  if (uri.protocol === "https:") {
    return process.env.HTTPS_PROXY || process.env.https_proxy || process.env.HTTP_PROXY || process.env.http_proxy || null;
  }
  return null;
}
function getHostFromUri(uri) {
  let host = uri.host;
  if (uri.port) {
    if (uri.port === "80" && uri.protocol === "http:" || uri.port === "443" && uri.protocol === "https:") {
      host = uri.hostname;
    }
  }
  return host;
}
function getHostHeaderWithPort(uri) {
  const port = uri.port || (uri.protocol === "https:" ? "443" : "80");
  return "".concat(uri.hostname, ":").concat(port);
}
function rewriteUriForProxy(reqOpts, uri, proxy) {
  const headers = reqOpts.headers || {};
  const options = Object.assign({}, reqOpts, {
    headers
  });
  headers.host = headers.host || getHostHeaderWithPort(uri);
  options.protocol = proxy.protocol || options.protocol;
  options.hostname = proxy.host.replace(/:\d+/, "");
  options.port = proxy.port;
  options.host = getHostFromUri(Object.assign({}, uri, proxy));
  options.href = "".concat(options.protocol, "//").concat(options.host).concat(options.path);
  options.path = url.format(uri);
  return options;
}
function getProxyOptions(options) {
  let proxy;
  if (options.hasOwnProperty("proxy")) {
    proxy = options.proxy;
  } else {
    const uri = url.parse(options.url);
    proxy = getProxyFromUri(uri);
  }
  return typeof proxy === "string" ? url.parse(proxy) : proxy;
}

/*! simple-concat. MIT License. Feross Aboukhadijeh <https://feross.org/opensource> */
function concat(stream, cb) {
  const chunks = [];
  stream.on("data", function (chunk) {
    chunks.push(chunk);
  });
  stream.once("end", function () {
    if (cb) cb(null, Buffer.concat(chunks));
    cb = null;
  });
  stream.once("error", function (err) {
    if (cb) cb(err);
    cb = null;
  });
}
function timedOut(req, time) {
  if (req.timeoutTimer) {
    return req;
  }
  const delays = isNaN(time) ? time : {
    socket: time,
    connect: time
  };
  const hostHeader = req.getHeader("host");
  const host = hostHeader ? " to " + hostHeader : "";
  if (delays.connect !== void 0) {
    req.timeoutTimer = setTimeout(function timeoutHandler() {
      req.abort();
      const e = new Error("Connection timed out on request" + host);
      e.code = "ETIMEDOUT";
      req.emit("error", e);
    }, delays.connect);
  }
  req.on("socket", function assign(socket) {
    if (!(socket.connecting || socket._connecting)) {
      connect();
      return;
    }
    socket.once("connect", connect);
  });
  function clear() {
    if (req.timeoutTimer) {
      clearTimeout(req.timeoutTimer);
      req.timeoutTimer = null;
    }
  }
  function connect() {
    clear();
    if (delays.socket !== void 0) {
      req.setTimeout(delays.socket, function socketTimeoutHandler() {
        req.abort();
        const e = new Error("Socket timed out on request" + host);
        e.code = "ESOCKETTIMEDOUT";
        req.emit("error", e);
      });
    }
  }
  return req.on("error", clear);
}
const uriParts = ["protocol", "slashes", "auth", "host", "port", "hostname", "hash", "search", "query", "pathname", "path", "href"];
const defaultProxyHeaderWhiteList = ["accept", "accept-charset", "accept-encoding", "accept-language", "accept-ranges", "cache-control", "content-encoding", "content-language", "content-location", "content-md5", "content-range", "content-type", "connection", "date", "expect", "max-forwards", "pragma", "referer", "te", "user-agent", "via"];
const defaultProxyHeaderExclusiveList = ["proxy-authorization"];
function shouldEnable(options) {
  if (typeof options.tunnel !== "undefined") {
    return Boolean(options.tunnel);
  }
  const uri = url.parse(options.url);
  if (uri.protocol === "https:") {
    return true;
  }
  return false;
}
function applyAgent() {
  let opts = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
  let proxy = arguments.length > 1 ? arguments[1] : undefined;
  const options = Object.assign({}, opts);
  const proxyHeaderWhiteList = defaultProxyHeaderWhiteList.concat(options.proxyHeaderWhiteList || []).map(header => header.toLowerCase());
  const proxyHeaderExclusiveList = defaultProxyHeaderExclusiveList.concat(options.proxyHeaderExclusiveList || []).map(header => header.toLowerCase());
  const proxyHeaders = getAllowedProxyHeaders(options.headers, proxyHeaderWhiteList);
  proxyHeaders.host = constructProxyHost(options);
  options.headers = Object.keys(options.headers || {}).reduce((headers, header) => {
    const isAllowed = proxyHeaderExclusiveList.indexOf(header.toLowerCase()) === -1;
    if (isAllowed) {
      headers[header] = options.headers[header];
    }
    return headers;
  }, {});
  const tunnelFn = getTunnelFn(options, proxy);
  const tunnelOptions = constructTunnelOptions(options, proxy, proxyHeaders);
  options.agent = tunnelFn(tunnelOptions);
  return options;
}
function getTunnelFn(options, proxy) {
  const uri = getUriParts(options);
  const tunnelFnName = constructTunnelFnName(uri, proxy);
  return tunnel[tunnelFnName];
}
function getUriParts(options) {
  return uriParts.reduce((uri, part) => {
    uri[part] = options[part];
    return uri;
  }, {});
}
function constructTunnelFnName(uri, proxy) {
  const uriProtocol = uri.protocol === "https:" ? "https" : "http";
  const proxyProtocol = proxy.protocol === "https:" ? "Https" : "Http";
  return "".concat(uriProtocol, "Over").concat(proxyProtocol);
}
function constructProxyHost(uri) {
  const port = uri.port;
  const protocol = uri.protocol;
  let proxyHost = "".concat(uri.hostname, ":");
  if (port) {
    proxyHost += port;
  } else if (protocol === "https:") {
    proxyHost += "443";
  } else {
    proxyHost += "80";
  }
  return proxyHost;
}
function getAllowedProxyHeaders(headers, whiteList) {
  return Object.keys(headers).filter(header => whiteList.indexOf(header.toLowerCase()) !== -1).reduce((set, header) => {
    set[header] = headers[header];
    return set;
  }, {});
}
function constructTunnelOptions(options, proxy, proxyHeaders) {
  return {
    proxy: {
      host: proxy.hostname,
      port: +proxy.port,
      proxyAuth: proxy.auth,
      headers: proxyHeaders
    },
    headers: options.headers,
    ca: options.ca,
    cert: options.cert,
    key: options.key,
    passphrase: options.passphrase,
    pfx: options.pfx,
    ciphers: options.ciphers,
    rejectUnauthorized: options.rejectUnauthorized,
    secureOptions: options.secureOptions,
    secureProtocol: options.secureProtocol
  };
}
const adapter = "node";
const reduceResponse = (res, reqUrl, method, body) => ({
  body,
  url: reqUrl,
  method,
  headers: res.headers,
  statusCode: res.statusCode,
  statusMessage: res.statusMessage
});
var httpRequester = (context, cb) => {
  const options = context.options;
  const uri = Object.assign({}, url.parse(options.url));
  const bodyType = isStream(options.body) ? "stream" : typeof options.body;
  if (bodyType !== "undefined" && bodyType !== "stream" && bodyType !== "string" && !Buffer.isBuffer(options.body)) {
    throw new Error("Request body must be a string, buffer or stream, got ".concat(bodyType));
  }
  const lengthHeader = {};
  if (options.bodySize) {
    lengthHeader["content-length"] = options.bodySize;
  } else if (options.body && bodyType !== "stream") {
    lengthHeader["content-length"] = Buffer.byteLength(options.body);
  }
  let aborted = false;
  const callback = (err, res) => !aborted && cb(err, res);
  context.channels.abort.subscribe(() => {
    aborted = true;
  });
  let reqOpts = Object.assign({}, uri, {
    method: options.method,
    headers: Object.assign({}, lowerCaseHeaders(options.headers), lengthHeader),
    maxRedirects: options.maxRedirects
  });
  const proxy = getProxyOptions(options);
  const tunnel = proxy && shouldEnable(options);
  const injectedResponse = context.applyMiddleware("interceptRequest", void 0, {
    adapter,
    context
  });
  if (injectedResponse) {
    const cbTimer = setImmediate(callback, null, injectedResponse);
    const abort = () => clearImmediate(cbTimer);
    return {
      abort
    };
  }
  if (options.maxRedirects !== 0) {
    reqOpts.maxRedirects = options.maxRedirects || 5;
  }
  if (proxy && tunnel) {
    reqOpts = applyAgent(reqOpts, proxy);
  } else if (proxy && !tunnel) {
    reqOpts = rewriteUriForProxy(reqOpts, uri, proxy);
  }
  if (!tunnel && proxy && proxy.auth && !reqOpts.headers["proxy-authorization"]) {
    const [username, password] = proxy.auth.username ? [proxy.auth.username, proxy.auth.password] : proxy.auth.split(":").map(item => qs.unescape(item));
    const auth = Buffer.from("".concat(username, ":").concat(password), "utf8");
    const authBase64 = auth.toString("base64");
    reqOpts.headers["proxy-authorization"] = "Basic ".concat(authBase64);
  }
  const transport = getRequestTransport(reqOpts, proxy, tunnel);
  if (typeof options.debug === "function" && proxy) {
    options.debug("Proxying using %s", reqOpts.agent ? "tunnel agent" : "".concat(reqOpts.host, ":").concat(reqOpts.port));
  }
  const tryCompressed = reqOpts.method !== "HEAD";
  if (tryCompressed && !reqOpts.headers["accept-encoding"] && options.compress !== false) {
    reqOpts.headers["accept-encoding"] = "br, gzip, deflate";
  }
  const finalOptions = context.applyMiddleware("finalizeOptions", reqOpts);
  const request = transport.request(finalOptions, response => {
    const res = tryCompressed ? decompressResponse(response) : response;
    const resStream = context.applyMiddleware("onHeaders", res, {
      headers: response.headers,
      adapter,
      context
    });
    const reqUrl = response.responseUrl || options.url;
    if (options.stream) {
      callback(null, reduceResponse(res, reqUrl, reqOpts.method, resStream));
      return;
    }
    concat(resStream, (err, data) => {
      if (err) {
        return callback(err);
      }
      const body = options.rawBody ? data : data.toString();
      const reduced = reduceResponse(res, reqUrl, reqOpts.method, body);
      return callback(null, reduced);
    });
  });
  if (options.timeout) {
    timedOut(request, options.timeout);
  }
  request.once("error", callback);
  const {
    bodyStream,
    progress
  } = getProgressStream(options);
  context.applyMiddleware("onRequest", {
    options,
    adapter,
    request,
    context,
    progress
  });
  if (bodyStream) {
    bodyStream.pipe(request);
  } else {
    request.end(options.body);
  }
  return {
    abort: () => request.abort()
  };
};
function getProgressStream(options) {
  if (!options.body) {
    return {};
  }
  const bodyIsStream = isStream(options.body);
  const length = options.bodySize || (bodyIsStream ? null : Buffer.byteLength(options.body));
  if (!length) {
    return bodyIsStream ? {
      bodyStream: options.body
    } : {};
  }
  const progress = progressStream({
    time: 16,
    length
  });
  const bodyStream = bodyIsStream ? options.body : toStream(options.body);
  return {
    bodyStream: bodyStream.pipe(progress),
    progress
  };
}
function getRequestTransport(reqOpts, proxy, tunnel) {
  const isHttpsRequest = reqOpts.protocol === "https:";
  const transports = reqOpts.maxRedirects === 0 ? {
    http,
    https
  } : {
    http: follow.http,
    https: follow.https
  };
  if (!proxy || tunnel) {
    return isHttpsRequest ? transports.https : transports.http;
  }
  let isHttpsProxy = proxy.port === 443;
  if (proxy.protocol) {
    isHttpsProxy = /^https:?/.test(proxy.protocol);
  }
  return isHttpsProxy ? transports.https : transports.http;
}
function lowerCaseHeaders(headers) {
  return Object.keys(headers || {}).reduce((acc, header) => {
    acc[header.toLowerCase()] = headers[header];
    return acc;
  }, {});
}
const getIt = function () {
  let initMiddleware = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : [];
  let httpRequest = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : httpRequester;
  return createRequester(initMiddleware, httpRequest);
};
const environment = "node";
export { adapter, environment, getIt };
//# sourceMappingURL=index.js.map
