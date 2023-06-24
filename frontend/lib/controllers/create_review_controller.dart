









import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sahara/models/review.dart';
import 'package:slider_controller/slider_controller.dart';

class CreateReviewController extends GetxController{
  final dateTime = DateTime.now().obs;
  final sliderValue = 0.obs;

  final TextEditingController reviewContentController = TextEditingController();
  // final TextEditingController reviewScoreController = SliderController();
  void getSliderValue(int value){
     sliderValue(value);
  }

  String? validateReviewContent(String? value){
    if(value == null || value.isEmpty){
      return 'Please enter any meaningful review';
    }
    return null;
  }

  String? validateReviewScore(int? value){
    if(value == 0){
      return 'Please give any score';
    }
    return null;
  }

  bool validateInputs(){
    String? reviewError = validateReviewContent(reviewContentController.text);
    // String? reviewScoreError = validateReviewScore(reviewScoreController.value);
    if(reviewError != null){
      return false;
    }
    return true;
  }

  // void createReview() async{
  //   if(validateInputs()){
  //     try{
  //       final review = Review(
  //         reviewId: reviewId, 
  //         reviewerId: reviewerId, 
  //         donationId: donationId, 
  //         reviewText: reviewText, 
  //         name: name, 
  //         imageUrl: imageUrl, 
  //         donationItemId: donationItemId)
  //     }
  //   }
  // }


}