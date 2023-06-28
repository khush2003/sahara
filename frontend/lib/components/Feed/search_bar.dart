import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/donation_item_controller.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:sahara/theme/global_widget.dart';

void showSearchDialog() {
  final dialogContent = Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SearchBox(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClearButton(),
              const SizedBox(width: 10),
              SearchButton(),
            ],
          )
        ],
      ));
  Get.dialog(SimpleDialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      children: [dialogContent]));
}

class SearchBox extends StatelessWidget {
  SearchBox({super.key});
  final controller = DonationItemController.instance;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldThemed(
      hintText: "Search",
      controller: controller.searchController,
    );
  }
}

class SearchButton extends StatelessWidget {
  SearchButton({super.key});
  final controller = DonationItemController.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          controller.searchEvents();
          Get.back();
        },
        child: const Text("Search"));
  }
}

class ClearButton extends StatelessWidget {
  ClearButton({super.key});
  final controller = DonationItemController.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.clearEvents();
        Get.back();
      },
      style: ElevatedButton.styleFrom(backgroundColor: neutral),
      child: const Text("Clear"),
    );
  }
}
