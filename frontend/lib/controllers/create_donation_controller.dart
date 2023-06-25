import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/models/author.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/rest_api.dart';
import 'package:sahara/views/create_donation.dart';
import 'package:sahara/routes/routes.dart';
import 'package:sahara/utils/app_utils.dart';

class CreateDonationController extends GetxController {
  final imageUrl = ''.obs;
  final tags = <String>[].obs;
  final selectedCategory = 'Electronic'.obs;
  final duration = 1.obs;
  final durationType = 'Week'.obs;
  final durationTotal = const Duration(days: 1).obs;
  final paidBy = 'Donor (you)'.obs;

  final usability = 0.0.obs;
  final estimatedValue = 0.0.obs;
  final deliveryFee = 0.0.obs;

  final isOn = false.obs;
  final isLoading = true.obs;

  final _firebaseStorage = FirebaseStorage.instance;
  final _firebaseAuth = FirebaseAuth.instance;
  final _imagePicker = ImagePicker();

  final restAPI = RestAPI.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();

  /*
  List<String>? categoryOptions;
  List<String>? durationOptions;
  List<String>? durationTypeOptions;
  List<String>? paidByOptions;
  */

  @override
  void onInit() async {
    isLoading(true);
    /*
    categoryOptions = await FirebaseService().getCategories() ??
         [
           'Electronic',
           'Clothing',
           'Cosmetic',
           'Furniture',
           'Accessaries',
         ];
    durationOptions = await FirebaseService().getDuration() ??
         ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
    durationTypeOptions = await FirebaseService().getDurationTypes() ?? 
         ['Week', 'Month'];
    paidByOptions = await FirebaseService().getPaidBy() ??
      ['Donor (you)', '50/50', 'Receiver'];
    */
    isLoading(false);
    super.onInit();
  }

  String getCategories(){
    selectedCategory.value = CategoryDropDownState().getSelectedCategory();
    return selectedCategory.value;
  }

  int getDuration(){
    duration.value = int.parse(DurationDropDownState().getSelectedDuration());
    return duration.value;
  }

  String getDurationType(){
    durationType.value = DurationDropDownState().getSelectedDurationType();
    return durationType.value;
  }

  Duration getDurationTotal(){
    if(getDurationType() == 'Week'){
      durationTotal.value = Duration(
        days: getDuration() * 7,
      );
      return durationTotal.value;
    }
    else if(getDurationType() == 'Month'){
      durationTotal.value = Duration(
        days: getDuration() * 30,
      );
      return durationTotal.value;
    }
    return durationTotal.value;
  }

  double getUsabilityValue() {
    usability.value = EstimatedItemValueState().getUsabilityValue();
    return usability.value;
  }

  double getPriceValue() {
    estimatedValue.value = EstimatedItemValueState().getEstimatedValue();
    return estimatedValue.value;
  }

  double getDeliveryFeeValue() {
    deliveryFee.value = DeliveryFeeValueState().getDeliveryFee();
    return deliveryFee.value;
  }

  String getPaidByValue() {
    paidBy.value = PaidByDropDownState().getSelectedPaidBy();
    return paidBy.value;
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
          donationId: '',
          imageUrl: imageUrl.value,
          name: nameController.text,
          category: getCategories(),
          usedDuration: getDuration(),
          usedDurationType: getDurationType(),
          usedDurationTotal: getDurationTotal(),
          usability: getUsabilityValue(),
          price: double.parse(priceController.text),
          estimatedItemValue: getPriceValue(),
          itemWidth: double.parse(widthController.text),
          itemLength: double.parse(lengthController.text),
          itemHeight: double.parse(heightController.text),
          weight: double.parse(weightController.text),
          deliveryFees: getDeliveryFeeValue(),
          deliveryPaidBy: getPaidByValue(),
          description: descriptionController.text,
          tags: tags,
          author: Author(
            authorId: _firebaseAuth.currentUser!.uid,
            name: _firebaseAuth.currentUser!.displayName!,
            imageUrl: _firebaseAuth.currentUser!.photoURL!,
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
