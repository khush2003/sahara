import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sahara/controllers/create_review_controller.dart';

import '../components/DeliveryPage/delivery_card.dart';
import '../models/donation_item.dart';
import '../models/user.dart';

class ReviewPage extends StatelessWidget {
  ReviewPage({super.key});

  final DonationItem item = DonationItem.test();
  final UserSahara user = UserSahara.test();
  final arrDate = DateTime.now();
  final CreateReviewController reviewControler =
      Get.put(CreateReviewController());

  // final controller = Get.put

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
      ),
      body: Column(
        children: [
          ReviewCard(
            user: user,
            item: item,
            arrDate: arrDate,
            controllerFunction: reviewControler.reviewContentController,
            controllerFunctionSlider: reviewControler.reviewSliderController,
          ),
          Center(child: PostButton(
            onPressed: () {
              reviewControler.createReview(
                item.name,
                item.usedDuration,
                item.usability,
                item.price,
                "donationIdtest",
                item.description,
                item.imageUrl,
                item.name,
                0
              );
            },
          ))
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final DonationItem item;
  final UserSahara user;
  final DateTime arrDate;
  final TextEditingController? controllerFunction;
  final ValueNotifier<int>? controllerFunctionSlider;

  const ReviewCard(
      {super.key,
      required this.user,
      required this.item,
      required this.arrDate,
      this.controllerFunction,
      this.controllerFunctionSlider});
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
                child: ItemInfo(item: item)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controllerFunction,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            // Black line seperating top inf and bottom info
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            PointSlider(
              controller: controllerFunctionSlider,
            )
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

class PointSlider extends StatefulWidget {
  final ValueNotifier<int>? controller;

  const PointSlider({Key? key, this.controller}) : super(key: key);

  @override
  State<PointSlider> createState() => _PointSliderState();
}

class _PointSliderState extends State<PointSlider> {
  late ValueNotifier<int> sliderController;
  int currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      // Use the provided controller
      sliderController = widget.controller!;
      currentSliderValue = sliderController.value;
    } else {
      // Create a new controller
      sliderController = ValueNotifier<int>(currentSliderValue);
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      sliderController.dispose();
    }
    super.dispose();
  }

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
                Text('$currentSliderValue / 2500')
              ],
            ),
          ),
          Slider(
            value: currentSliderValue.toDouble(),
            min: 0,
            max: 2500,
            divisions: 100,
            onChanged: (double value) {
              setState(() {
                currentSliderValue = value.round();
                if (widget.controller == null) {
                  sliderController.value =
                      currentSliderValue; // Update the controller's value
                }
              });
            },
            onChangeEnd: (double value) {
              setState(() {
                currentSliderValue = value.round();
              });
            },
            onChangeStart: (double value) {
              setState(() {
                currentSliderValue = value.round();
              });
            },
          ),
          if (widget.controller == null)
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: currentSliderValue.toString(),
              onChanged: (value) {
                setState(() {
                  final intValue = int.tryParse(value) ?? 0;
                  sliderController.value = intValue.clamp(0, 100);
                  currentSliderValue = intValue;
                });
              },
            ),
        ],
      ),
    );
  }
}
