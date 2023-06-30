import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/rest_api.dart';
import 'package:sahara/utils/app_utils.dart';
import '../models/donation_item.dart';
import '../models/review.dart';
import 'auth/auth_controller.dart';
import 'package:sahara/controllers/donation_item_controller.dart';

class CustomTabController extends GetxController {
  static CustomTabController get instance => Get.find<CustomTabController>();

  final connect = Get.find<GetConnect>();
  final restApi = RestAPI.instance;
  final profileImageUrl = ''.obs;
  final coverImageUrl = ''.obs;
  final isGiveSelected = true.obs;
  final isReceiveSelected = false.obs;
  final isNewSelected = true.obs;
  final isHistorySelected = false.obs;
  final _firebaseStorage = FirebaseStorage.instance;
  final _imagePicker = ImagePicker();
  final DonationItemController _itemController =
      Get.put(DonationItemController());

  final auth = AuthController.instance;
  //List<UserSahara> blockedUsers = <UserSahara>[].obs;
  final RxList<DonationItem> donationItems = <DonationItem>[].obs;
  final RxList<UserSahara> blockedUsers = <UserSahara>[].obs;
  final RxList<Review> reviewList = <Review>[].obs;
  final RxList<Review> userReviewList = <Review>[].obs;

  @override
  void onInit() {
    setupLists();
    setImages();
    super.onInit();
  }

  void setImages() {
    profileImageUrl(auth.userSahara.value.profilePicture);
    coverImageUrl(auth.userSahara.value.coverPicture);
  }

  uploadImage(String type) async {
    //Select Image
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var file = File(image.path);
      //Upload to Firebase
      final randomString = randomAlphaNumeric(30);
      var snapshot = await _firebaseStorage
          .ref()
          .child('images/$randomString')
          .putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      type == 'Profile'
          ? profileImageUrl(downloadUrl)
          : coverImageUrl(downloadUrl);
    } else {
      warningSnackBar('Warning: No Image Selected');
      return;
    }
  }

  void setImage(String type) async {
    if (type == 'Profile') {
      await restApi.putProfilePicture(profileImageUrl.value);
      Get.back();
      successSnackBar("Profile Picture Updated");
      auth.updateUser();
      setImages();
    } else {
      await restApi.putCoverPicture(coverImageUrl.value);
      Get.back();
      successSnackBar("Cover Photo Updated");
      auth.updateUser();
      setImages();
    }
  }

  unblockUserById(userId) async {
    await restApi.unblockUserById(userId, auth.userSahara.value.blockedUser!);
    setupLists();
  }

  void selectNew() {
    isNewSelected(true);
    isHistorySelected(false);
  }

  void selectHistory() {
    isHistorySelected(true);
    isNewSelected(false);
  }

  void selectGive() {
    isGiveSelected(true);
    isReceiveSelected(false);
  }

  void selectReceive() {
    isGiveSelected(false);
    isReceiveSelected(true);
  }

  Future<void> setupLists() async {
    _itemController.donationItems.listen((donationResult) {
      final filteredDonationItems = donationResult
          .where((item) => item.author.authorId == auth.userSahara.value.uid!)
          .toList();
      donationItems(filteredDonationItems);
    });

    _itemController.reviewList.listen((reviews) {
      final filteredReviews = reviews
          .where((review) =>
              donationItems.any((item) => item.donationId == review.donationId))
          .toList();
      final filteredUserReviews = reviews
          .where((review) => review.reviewerId == auth.userSahara.value.uid!)
          .toList();
      reviewList(filteredReviews);
      userReviewList(filteredUserReviews);
    });

    final List<UserSahara>? allUsers =
        await restApi.getBlockedUsers(auth.userSahara.value.blockedUser ?? []);
    if (allUsers == null) {
    } else {
      blockedUsers(allUsers);
    }
  }
}
