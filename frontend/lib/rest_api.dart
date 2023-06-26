import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/models/review.dart';

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
    //body data
    final uid = auth.currentUser!.uid;
    final Map<String, dynamic> userData = user.toJson();

    Response response =
        await connect.put('$putBackendUrl/users/$uid', userData);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to post user info');
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

   Future<dynamic> postReview(Review review) async {
    //body data
    final Map<String, dynamic> reviewData = review.toJson();

    Response response = await connect.post('$postBackendUrl/reviews', reviewData);
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
}
