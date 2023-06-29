import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'package:sahara/models/chat_room.dart';
import 'package:sahara/models/coupon.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/models/message.dart';
import 'package:sahara/models/review.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'models/user.dart';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';

class RestAPI extends GetConnect {
  final connect = Get.find<GetConnect>();
  static RestAPI get instance => Get.find<RestAPI>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final backendPort = 5000;
  final wsPort = 8080;
  late String host,
      backendUrl,
      getBackendUrl,
      postBackendUrl,
      putBackendUrl,
      deleteBackendUrl;

  @override
  void onInit() {
    const backendPort = 5000;
    try {
      host = (Platform.isAndroid) ? '10.0.2.2' : 'localhost';
    } catch (e) {
      host = 'localhost';
    }
    backendUrl = 'http://$host:$backendPort';
    getBackendUrl = '$backendUrl/get';
    postBackendUrl = '$backendUrl/post';
    putBackendUrl = '$backendUrl/put';
    deleteBackendUrl = '$backendUrl/delete';
    super.onInit();
  }

  //GET all donation items
  Future<dynamic> getDonationItems() async {
    Response response = await connect.get('$getBackendUrl/donationItems');
    if (response.statusCode == 200) {
      final List<DonationItem> donationItems = [];
      response.body.forEach((element) {
        donationItems.add(DonationItem.fromJson(element));
      });
      return donationItems;
    } else {
      return null;
    }
  }

  Future<dynamic> postUserInfo(UserSahara user, String uid) async {
    final Map<String, dynamic> userData = user.toJson();
    Response response =
        await connect.post('$postBackendUrl/users/$uid', userData);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to post user info');
    }
  }

  Future<dynamic> putUserInfo(UserSahara user) async {
    final uid = auth.currentUser!.uid;
    final Map<String, dynamic> userData = user.toJson();

    Response response =
        await connect.put('$putBackendUrl/users/$uid', userData);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to put user info');
    }
  }

  Future<dynamic> putUserName(UserSahara user) async {
    final uid = auth.currentUser!.uid;
    Response response = await connect
        .put('$putBackendUrl/allUserName/$uid', {"userName": user.userName});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to put user info');
    }
  }

  Future<dynamic> getCurrentUserInfo() async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    try {
      Response response = await connect.get('$getBackendUrl/users/$uid');
      if (response.statusCode == 200) {
        dynamic userData = response.body;
        return UserSahara.fromjson(userData, uid);
      } else {
        throw Exception('Failed to retrieve user info');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<UserSahara?> getUserById(String userId) async {
    Response response = await connect.get('$getBackendUrl/users/$userId');
    if (response.statusCode == 200) {
      dynamic userData = response.body;
      return UserSahara.fromjson(userData, userId);
    } else {
      return null;
    }
  }

  Future<dynamic> postChatRoom(ChatRoom chatRoom) async {
    Response response =
        await connect.post('$postBackendUrl/chatRoom', chatRoom.toJson());
    if (response.statusCode == 200) {
      final chatRoomId = response.body['_path']['segments'].last as String;
      return chatRoomId;
    } else {
      throw Exception('Failed to post chat room info');
    }
  }

  Future<List<ChatRoom>?> getChatRooms() async {
    final uid = auth.currentUser!.uid;
    Response response = await connect.get('$getBackendUrl/chatRooms/$uid');
    if (response.statusCode == 200) {
      List<ChatRoom> chatRooms = [];
      response.body.forEach((element) {
        chatRooms.add(ChatRoom.fromjson(element, element['chatRoomId']));
      });
      return chatRooms;
    } else {
      return null;
    }
  }

  Future<dynamic> postMessage(Message message) async {
    Response response =
        await connect.post('$postBackendUrl/message', message.toJson());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to post message info');
    }
  }

  WebSocketChannel getMessageStream(
      String chatRoomId, void Function(List<Message>) updateMessages) {
    WebSocketChannel channel = IOWebSocketChannel.connect('ws://$host:$wsPort');
    channel.sink.add('{"chatRoomId": "$chatRoomId"}');
    channel.stream.listen((message) {
      log(message.toString());
      final List<dynamic> jsonList = json.decode(message);
      final List<Message> receivedMessages =
          jsonList.map((json) => Message.fromjson(json)).toList();
      updateMessages(receivedMessages);
    });
    return channel;
  }

  WebSocketChannel startMessageStream(
      void Function(List<Message>) updateMessages) {
    WebSocketChannel channel = IOWebSocketChannel.connect('ws://$host:$wsPort');
    channel.stream.listen((message) {
      log(message.toString());
      final List<dynamic> jsonList = json.decode(message);
      final List<Message> receivedMessages =
          jsonList.map((json) => Message.fromjson(json)).toList();
      updateMessages(receivedMessages);
    });
    return channel;
  }

  Future<dynamic> postReview(Review review) async {
    final Map<String, dynamic> reviewData = review.toJson();
    Response response =
        await connect.post('$postBackendUrl/review', reviewData);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to post review info');
    }
  }

  Future<dynamic> postDonationItem(DonationItem item) async {
    final Map<String, dynamic> itemData = item.toJson();
    Response response =
        await connect.post('$postBackendUrl/donationItem', itemData);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to post donation info');
    }
  }

  Future<List<Review>?> getReviews() async {
    Response response = await connect.get('$getBackendUrl/reviews');
    if (response.statusCode == 200) {
      final List<Review> reviews = [];
      response.body.forEach((element) {
        reviews.add(Review.fromJson(element));
      });
      return reviews;
    } else {
      return null;
    }
  }

  Future<List<UserSahara>?> getBlockedUsers(List<String> userIds) async {
    final List<UserSahara> users = [];
    for (String userId in userIds) {
      final UserSahara? user = await getUserById(userId);
      if (user != null) {
        users.add(user);
      }
    }
    return users;
  }

  Future<dynamic> unblockUserById(String userId, List<String> userIds) async {
    final uid = auth.currentUser!.uid;
    final blockedUserIds = userIds;

    if (blockedUserIds.contains(userId)) {
      blockedUserIds.remove(userId);
      final Map<String, dynamic> userData = {'blockedUser': blockedUserIds};

      try {
        Response response =
            await connect.put('$putBackendUrl/users/$uid', userData);
        if (response.statusCode == 200) {
          return response.body;
        } else {
          throw Exception('Failed to unblock user');
        }
      } catch (e) {
        throw Exception('Error: $e');
      }
    } else {
      throw Exception('User ID not found in the blockedUser list');
    }
  }

  Future<List<String>?> getBlockedUserIds(String userId) async {
    Response response = await connect.get('$getBackendUrl/users/$userId');
    if (response.statusCode == 200) {
      dynamic userData = response.body;
      List<String> blockedUserIds =
          List<String>.from(userData['blockedUser'] ?? []);
      return blockedUserIds;
    } else {
      return null;
    }
  }

// DON'T DELETE v

  // Future<List<Coupon>?> getUserCoupons(String userId) async {
  //   Response response =
  //       await connect.get('$getBackendUrl/users/$userId/discountCoupon/');
  //   if (response.statusCode == 200) {
  //     List<dynamic> couponData = response.body;
  //     List<Coupon> userCoupons = List<Coupon>.from(couponData);
  //     return userCoupons;
  //   } else {
  //     return null;
  //   }
  // }

  Future<List<Coupon>?> getUserCoupons(String userId) async {
    Response response =
        await connect.get('$getBackendUrl/users/$userId/discountCoupon/');
    if (response.statusCode == 200) {
      final List<Coupon> coupons = [];
      response.body.forEach((element) {
        coupons.add(Coupon.fromjson(element));
      });
      return coupons;
    } else {
      return null;
    }
  }

  Future<dynamic> postCoupon() async {
    final availableCouponsResponse =
        await connect.get('$getBackendUrl/availableCoupons');
    if (availableCouponsResponse.statusCode == 200) {
      final List<dynamic> availableCoupons = availableCouponsResponse.body;
      final randomCouponIndex =
          DateTime.now().millisecondsSinceEpoch % availableCoupons.length;
      final randomCoupon = availableCoupons[randomCouponIndex];
      final discountCode = randomAlphaNumeric(8);
      final uid = auth.currentUser!.uid;

      final couponData = {
        'uid': uid,
        'couponName': randomCoupon['couponName'],
        'couponImage': randomCoupon['couponImage'],
        'discountPrice': randomCoupon['discountPrice'],
        'discountCode': discountCode,
      };
      final response = await connect.post('$postBackendUrl/coupon', couponData);

      if (response.statusCode == 200) {
        try {
          final couponDocId = response.body['_path']['segments'][1];

          await connect.put(
              '$putBackendUrl/users/$uid/discountCoupon/$couponDocId',
              {couponDocId});
        } on Exception catch (e) {
          return e;
        }
        return response.body;
      } else {
        throw Exception('Failed to post coupon');
      }
    } else {
      throw Exception('Failed to fetch available coupons');
    }
  }
}
