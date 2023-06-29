import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/controllers/donation_item_controller.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/rest_api.dart';

import '../utils/app_utils.dart';

class PaymentController extends GetxController {
  final Rx<DonationItem> item = DonationItem.test().obs;
  final auth = AuthController.instance;
  final _restApi = RestAPI.instance;
  final _itemController = DonationItemController.instance;
  final imageUrl = ''.obs;
  final _imagePicker = ImagePicker();
  final _firebaseStorage = FirebaseStorage.instance;

  @override
  void onInit() {
    final donationId = Get.parameters['id'] ?? '';
    item(DonationItem.getFromId(donationId, _itemController.donationItems));
    super.onInit();
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
      print(imageUrl.value);
      log(imageUrl.value);
    } else {
      warningSnackBar('Warning: No Image Selected');
      return;
    }
  }
}
