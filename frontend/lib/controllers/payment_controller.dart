import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/controllers/chat/message_controller.dart';
import 'package:sahara/controllers/donation_item_controller.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/models/payment.dart';
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
  final receiverId = ''.obs;
  final messageController = Get.find<MessageController>();

  @override
  void onInit() {
    final donationId = Get.parameters['id'] ?? '';
    receiverId(Get.parameters['receiverId'] ?? '');
    item(DonationItem.getFromId(donationId, _itemController.donationItems));
    super.onInit();
  }

  uploadImage() async {
    //Select Image
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var file = File(image.path);
      log(file.path);
      //Upload to Firebase
      final randomString = randomAlphaNumeric(30);
      log(randomString);
      var snapshot = await _firebaseStorage
          .ref()
          .child('images/$randomString')
          .putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      log(downloadUrl);
      imageUrl(downloadUrl);
    } else {
      warningSnackBar('Warning: No Image Selected');
      return;
    }
  }

  void give() async {
    if (imageUrl.value.isEmpty) {
      errorSnackBar('Error: No Payment Slip Uploaded');
      return;
    } else {
      if (receiverId.value == auth.userSahara.value.uid) {
        Payment payment = await _restApi.getPaymentById(item.value.paymentId!);
        await _restApi.putReceiverPayment(payment.paymentId!, imageUrl.value);
        await _itemController.setupLists();
        messageController.initializeLists();
      } else {
        // You are the sender
        Payment payment = Payment(
            deliveryPaidBy: item.value.deliveryPaidBy,
            senderId: auth.userSahara.value.uid!,
            receiverId: receiverId.value,
            paymentImageUrlSender: imageUrl.value);
        final paymentId = await _restApi.postPayment(payment);
        await _restApi.putPaymentId(item.value.donationId!, paymentId);
        await _itemController.setupLists();
        messageController.initializeLists();
      }
      Get.back();
      Get.dialog(const SimpleDialog(
        children: [
          Center(
              child: Text(
            "Your payment is now being processed, if we did not receive the payment or we recieved wrong amount your order will be cancelled and refunded",
            style: TextStyle(fontSize: 20),
          )),
        ],
      ));
    }
  }
}
