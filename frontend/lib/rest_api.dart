import 'dart:convert';

import 'package:get/get.dart';
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

  //GET all donation items
  Future<dynamic> getDonationItems() async {
    Response response = await connect.get('$getBackendUrl/donationItems');
    if (response.statusCode == 200) {
      final List<DonationItem> donationItems = [];
      response.body.forEach((element) {
        donationItems.add(DonationItem.fromJson(element));
      });
      print(donationItems);
      return donationItems;
    } else {
      print("No status code");
      return null;
    }
  }

   Future<dynamic> postUserInfo(UserSahara user) async {

   //body data
   final Map<String, dynamic> userData = user.toJson();

   Response response = await connect.post('$postBackendUrl/users', userData);
   if(response.statusCode == 200) {
     return response.body;
   }else{
     return null;
   }
 }
}


