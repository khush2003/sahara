import 'dart:io';

import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:random_string/random_string.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/models/author.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/rest_api.dart';
import 'package:sahara/routes/routes.dart';
import 'package:sahara/utils/app_utils.dart';

class CreateDonationController extends GetxController {
  final imageUrl = ''.obs;
  final tags = <String>[].obs;
  final selectedCategory = 'Electronic'.obs;
  final duration = '1'.obs;
  final durationType = 'Week'.obs;
  final durationTotal = const Duration(days: 1).obs;
  final paidBy = DeliveryPaidBy.donor.obs;

  final usability = 0.5.obs;
  final estimatedValue = 0.0.obs;
  final deliveryFee = 0.0.obs;

  final isOn = false.obs;
  final isLoading = false.obs;

  final _firebaseStorage = FirebaseStorage.instance;
  final _imagePicker = ImagePicker();
  final _auth = AuthController.instance;

  static CreateDonationController get instance =>
      Get.find<CreateDonationController>();

  final restAPI = RestAPI.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();

  List<String> categoryOptions = [
    'Electronic',
    'Clothing',
    'Cosmetics',
    'Furniture',
    'Accessories'
  ];
  List<String> durationOptions = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  List<String> durationTypeOptions = ['Week', 'Month'];
  List<String> paidByOptions = ['Donor (you)', '50/50', 'Receiver'];

  void setSelectedCatagory(String? value) {
    if (value != null) {
      selectedCategory(value);
    }
  }

  void setDuration(String? value) {
    if (value != null) {
      duration(value);
      setEstimatedDuration();
    }
  }

  void setDurationType(String? value) {
    if (value != null) {
      durationType(value);
    }
  }

  void setEstimatedDuration() {
    if (priceController.text.isNotEmpty) {
      estimatedValue(double.parse(priceController.text) * usability.value);
    }
  }

  void setUseability(double value) {
    usability(value);
    setEstimatedDuration();
  }

  void calculateDelivery() {
    if (!isFieldZero()) {
      deliveryFee(0.75 *
              (double.parse(widthController.text) +
                  double.parse(lengthController.text)) +
          double.parse(heightController.text * 1) +
          (1.5 * double.parse(weightController.text)));
    }
  }

  bool isFieldZero() {
    if (widthController.text.isEmpty ||
        lengthController.text.isEmpty ||
        heightController.text.isEmpty ||
        weightController.text.isEmpty) {
      return true;
    }
    return ((double.parse(widthController.text) == 0 ||
        double.parse(lengthController.text) == 0 ||
        double.parse(heightController.text) == 0 ||
        double.parse(weightController.text) == 0));
  }

  void setPaidBy(String? value) {
    switch (value) {
      case 'Donor (you)':
        paidBy(DeliveryPaidBy.donor);
        break;
      case '50/50':
        paidBy(DeliveryPaidBy.both);
        break;
      case 'Receiver':
        paidBy(DeliveryPaidBy.receiver);
        break;
      default:
        paidBy(DeliveryPaidBy.donor);
    }
  }

  String getPaidBy() {
    final value = paidBy.value;
    switch (value) {
      case DeliveryPaidBy.donor:
        return 'Donor (you)';
      case DeliveryPaidBy.both:
        return '50/50';
      case DeliveryPaidBy.receiver:
        return 'Receiver';
      default:
        return 'Donor (you)';
    }
  }

  Duration getDurationTotal() {
    if (durationType.value == 'Week') {
      durationTotal.value = Duration(
        days: int.parse(duration.value) * 7,
      );
      return durationTotal.value;
    } else if (durationType.value == 'Month') {
      durationTotal.value = Duration(
        days: int.parse(duration.value) * 30,
      );
      return durationTotal.value;
    }
    return durationTotal.value;
  }

  uploadImage() async {
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
      imageUrl(downloadUrl);
    } else {
      warningSnackBar('Warning: No Image Selected');
      return;
    }
  }

  void addTag() {
    String? tag = tagsController.text;
    if (!tags.contains(tag)) {
      tags.add(tag);
    } else {
      warningSnackBar('Warning: Tag with same name already exists');
    }
  }

  void removeTag(int index) {
    tags.removeAt(index);
  }

  bool validateInputs() {
    String? textError = textValidator(nameController.text);
    String? numberError = numberValidator(priceController.text);

    if (textError != null || numberError != null) {
      return false;
    }
    return true;
  }

  String? textValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a text';
    }
    return null;
  }

  String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }
    double? num = double.tryParse(value);
    if (num == null || num < 0) {
      return 'Please enter a valid number';
    }
    return null;
  }

  void createDonation() async {
    if (validateInputs()) {
      try {
        final item = DonationItem(
          imageUrl: imageUrl.value,
          name: nameController.text,
          category: selectedCategory.value,
          usedDuration: getDurationTotal(),
          usability: usability.value,
          price: double.parse(priceController.text),
          itemWidth: double.parse(widthController.text),
          itemLength: double.parse(lengthController.text),
          itemHeight: double.parse(heightController.text),
          weight: double.parse(weightController.text),
          deliveryFees: deliveryFee.value,
          deliveryPaidBy: paidBy.value,
          description: descriptionController.text,
          tags: tags,
          author: Author(
            authorId: _auth.userSahara.value.uid!,
            name: _auth.userSahara.value.userName,
            imageUrl: _auth.userSahara.value.profilePicture,
          ),
        );
        await restAPI.postDonationItem(item);
        successSnackBar('Success: Donation Item was created successfully');
        Get.offAllNamed(Routes.app);
      } catch (e) {
        errorSnackBar('Error: There is an error in creating donation $e');
      }
    } else {
      errorSnackBar('Error: Fill all the fields to create a donation');
    }
  }
}
