
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/create_donation_controller.dart';

import '../../theme/app_theme.dart';

class CategoryDropDown extends StatelessWidget {
  final CreateDonationController createDonationController =
      CreateDonationController.instance;

  CategoryDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: Obx(
          () => DropdownButtonFormField<String>(
            value: createDonationController.selectedCategory.value,
            items: createDonationController.categoryOptions.map(
              (category) {
                return DropdownMenuItem(
                  value: category,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Center(
                      child: Text(
                        category,
                        style: regularText(height: 1.25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
            onChanged: createDonationController.setSelectedCatagory,
            style: regularTextBold(),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: primary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
            dropdownColor: Colors.white,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: primary,
            ),
            iconSize: 32,
            elevation: 2,
            isExpanded: true,
          ),
        ),
      ),
    ]);
  }
}
