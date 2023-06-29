import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/Feed/donation_details_section.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/controllers/create_review_controller.dart';
import 'package:sahara/models/review.dart';
import '../models/donation_item.dart';

class ReviewPage extends StatelessWidget {
  ReviewPage({super.key});
  final CreateReviewController reviewControler =
      Get.put(CreateReviewController());
  final _auth = AuthController.instance;
  // final controller = Get.put

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              ReviewCard(
                item: reviewControler.item.value,
                controllerFunction: reviewControler.reviewContentController,
              ),
              Center(child: PostButton(
                onPressed: () {
                  reviewControler.createReview(Review(
                    donationId: reviewControler.item.value.donationId!,
                    reviewerId: _auth.userSahara.value.uid!,
                    reviewText: reviewControler.reviewContentController.text,
                    reviewerName: _auth.userSahara.value.userName,
                    reviewerImageURL: _auth.userSahara.value.profilePicture ?? '',
                    rating: reviewControler.sliderValue.value.round(),
                  ));
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final CreateReviewController reviewControler =
      Get.find<CreateReviewController>();
  final DonationItem item;
  final TextEditingController? controllerFunction;

  ReviewCard({
    super.key,
    required this.item,
    this.controllerFunction,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DonationDetailSection(
                    item: item,
                    showDescription: false,
                    showTags: false,
                    showOverPricedWarning: false)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: reviewControler.validateReviewContent,
                controller: controllerFunction,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your experience with the item',
                ),
              ),
            ),
            // Black line seperating top inf and bottom info
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            PointSlider()
          ],
        ),
      ),
    );
  }
}

class PostButton extends StatelessWidget {
  final Function()? onPressed;
  final CreateReviewController reviewControler =
      Get.put(CreateReviewController());
  PostButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
          child: Text(
            'Post',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ));
  }
}

class PointSlider extends StatelessWidget {
  final reviewController = Get.find<CreateReviewController>();

  PointSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Please rate the item'),
                Obx(() => Text(
                    '${reviewController.sliderValue.value.round()} / 2500'))
              ],
            ),
          ),
          Obx(
            () => Slider(
              value: reviewController.sliderValue.value,
              min: 0,
              max: 2500,
              divisions: 100,
              onChanged: reviewController.updateSliderValue,
            ),
          ),
        ],
      ),
    );
  }
}
