'use strict';

const isReactNative = typeof navigator === "undefined" ? false : navigator.product === "ReactNative";
const defaultOptions = {
  timeout: isReactNative ? 6e4 : 12e4
};
function processOptions(opts) {
  const options = typeof opts === "string" ? Object.assign({
    url: opts
  }, defaultOptions) : Object.assign({}, defaultOptions, opts);
  const url = new URL(options.url, "http://localhost");
  options.timeout = normalizeTimeout(options.timeout);
  if (options.query) {
    for (const [key, value] of Object.entries(options.query)) {
      if (value !== void 0) {
        if (Array.isArray(value)) {
          for (const v of value) {
            url.searchParams.append(key, v);
          }
        } else {
          url.searchParams.append(key, value);
        }
      }
    }
  }
  options.method = options.body && !options.method ? "POST" : (options.method || "GET").toUpperCase();
  options.url = url.origin === "http://localhost" ? "".concat(url.pathname, "?").concat(url.searchParams) : url.toString();
  return options;
}
function normalizeTimeout(time) {
  if (time === false || time === 0) {
    return false;
  }
  if (time.connect || time.socket) {
    return time;
  }
  const delay = Number(time);
  if (isNaN(delay)) {
    return normalizeTimeout(defaultOptions.timeout);
  }
  return {
    connect: delay,
    socket: delay
  };
}
const validUrl = /^https?:\/\//i;
function validateOptions(options) {
  if (!validUrl.test(options.url)) {
    throw new Error("\"".concat(options.url, "\" is not a valid URL"));
  }
}
exports.processOptions = processOptions;
exports.validateOptions = validateOptions;
//# sourceMappingURL=defaultOptionsValidator-6e254980.cjs.map
