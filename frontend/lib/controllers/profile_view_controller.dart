import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/rest_api.dart';

class CustomTabController extends GetxController {
  static CustomTabController get instance => Get.find<CustomTabController>();
  final connect = Get.find<GetConnect>();
  final restApi = RestAPI.instance;
  final imageUrl = ''.obs;
  final isGiveSelected = true.obs;
  final isReceiveSelected = false.obs;
  final isNewSelected = true.obs;
  final isHistorySelected = false.obs;
  final _firebaseStorage = FirebaseStorage.instance;
  final _imagePicker = ImagePicker();

  Rx<UserSahara?> user = Rx<UserSahara?>(null);

  @override
  void onInit() {
    super.onInit();
    getUserById();
  }

  void getUserById() async {
    UserSahara? fetchedUser =
        await restApi.getUserById(FirebaseAuth.instance.currentUser!.uid);
    if (fetchedUser != null) {
      user.value = fetchedUser;
      print(user.value!.userName);
    } else {
      print("User not found");
    }
  }

  uploadImage() async {
    //Select Image
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var file = File(image.path);
      //Upload to Firebase
      var snapshot = await _firebaseStorage
          .ref()
          .child('images/${image.name}')
          .putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      imageUrl(downloadUrl);
    }
  }

  void selectNew() {
    isNewSelected.value = true;
    isHistorySelected.value = false;
  }

  void selectHistory() {
    isHistorySelected.value = true;
    isNewSelected.value = false;
  }

  void selectGive() {
    isGiveSelected.value = true;
    isReceiveSelected.value = false;
  }

  void selectReceive() {
    isGiveSelected.value = false;
    isReceiveSelected.value = true;
  }
}
