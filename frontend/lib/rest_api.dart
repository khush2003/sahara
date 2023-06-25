import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/views/profile_view.dart';

import 'models/user.dart';

const backendPort = 8000;
const backendUrl = 'http://localhost:$backendPort';
const getBackendUrl = '$backendUrl/get';
const postBackendUrl = '$backendUrl/post';
const putBackendUrl = '$backendUrl/put';
const deleteBackendUrl = '$backendUrl/delete';

class RestAPI {
  final connect = Get.find<GetConnect>();
  static RestAPI get instance => Get.find<RestAPI>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  //GET all donation items
  Future<dynamic> getDonationItems() async {
    Response response = await connect.get('$getBackendUrl/donationItems');
    if (response.statusCode == 200) {
      final List<DonationItem> donationItems = [];
      response.body.forEach((element) {
        donationItems
            .add(DonationItem.fromJson(element, element['donationId']));
      });
      print(donationItems);
      return donationItems;
    } else {
      print("No status code");
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
      return null;
    }
  }

  Future<dynamic> putUserInfo(UserSahara user) async {
    //body data
    final uid = auth.currentUser!.uid;
    final Map<String, dynamic> userData = user.toJson();

    Response response =
        await connect.put('$putBackendUrl/users/$uid', userData);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
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
      print("No user found!");
      return null;
    }
  }

  Future<dynamic> postReview(UserSahara user) async {
    //body data
    final Map<String, dynamic> userData = user.toJson();

    Response response = await connect.post('$postBackendUrl/users', userData);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> postDonationItem(DonationItem item) async {
    final Map<String, dynamic> itemData = item.toJson();
    Response response =
        await connect.post('$postBackendUrl/donationItem', itemData);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Error: Did not post donation item';
    }
  }
}
