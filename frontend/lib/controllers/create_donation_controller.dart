import 'dart:io';

import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sahara/models/author.dart';
import 'package:sahara/models/donation_item.dart';

import 'package:sahara/routes/routes.dart';
import 'package:sahara/utils/app_utils.dart';

class CreateDonationController extends GetxController {
  final imageUrl = ''.obs;
  final tags = <String>[].obs;
  final selectedCategory = 'Electronic'.obs;
  final duration = 1.obs;
  final durationType = 'Week'.obs;
  final usability = ''.obs;
  final paidBy = 'Donor (you)'.obs;

  final isOn = false.obs;
  final isLoading = true.obs;

  final _firebaseStorage = FirebaseStorage.instance;
  final _imagePicker = ImagePicker();

  //final _auth = AuthController.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();

  late List<String> categoryOptions;
  late List<String> durationOptions;
  late List<String> durationTypeOptions;
  late List<String> paidByOptions;

  @override
  void onInit() async {
    isLoading(true);
    // categoryOptions = await FirebaseService().getCategories() ??
    //     [
    //       'Electronic',
    //       'Clothing',
    //       'Cosmetic',
    //       'Furniture',
    //       'Accessaries',
    //     ];
    // durationOptions = await FirebaseService().getDuration() ??
    //     ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
    // durationTypeOptions =
    //     await FirebaseService().getDurationTypes() ?? ['Week', 'Month'];
    // paidByOptions = await FirebaseService().getPaidBy() ??
        ['Donor (you)', '50/50', 'Receiver'];
    isLoading(false);
    super.onInit();
  }

  void setSelectedCategory(String? value) {
    selectedCategory(value ?? '');
  }

  void setDuration(String value) {
    int intVal = int.parse(value);
    duration(intVal);
  }

  void setDurationType(String? value) {
    durationType(value ?? '');
  }

  void setPaidBy(String? value) {
    paidBy(value ?? '');
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
          donationId: '12',
          imageUrl: imageUrl.value,
          name: nameController.text,
          category: selectedCategory.value,
          usedDuration: durationType.value == 'Week'
              ? Duration(days: duration.value * 7)
              : Duration(days: duration.value * 30),
          useability: double.parse(usability.value),
          price: double.parse(priceController.text),
          itemWidth: double.parse(widthController.text),
          itemLength: double.parse(lengthController.text),
          itemHeight: double.parse(heightController.text),
          weight: double.parse(weightController.text),
          deliveryFees: 100.00,
          deliveryPaidBy: DeliveryPaidBy.donor,
          description: descriptionController.text,
          tags: tags,
          author: Author(
            authorId: '12',
            name: 'James',
            imageUrl: '',
          ),
        );
        // await FirebaseService().addItem(item /* _auth.user!*/);
        successSnackBar('Success: Donation Item was created successfully');
        Get.offAllNamed(Routes.feed);
      } catch (e) {
        errorSnackBar('Error: There is an error in creating donation $e');
      }
    } else {
      errorSnackBar('Error: Fill all the fields to create a donation');
    }
  }
}
