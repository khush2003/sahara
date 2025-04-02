import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/donation_item_controller.dart';

var filterOptions = [
  'All',
  'Electronic',
  'Clothing',
  'Cosmetics',
  'Furniture',
  'Accessories'
];

void openFilterDialog() {
  final List<Widget> filterItems = [
    const Center(
      child: Text(
        'Filter By',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    ),
    const Divider()
  ];
  var index = -1;
  filterItems.addAll(filterOptions.map((e) {
    index++;
    return FilterItem(option: e, index: index);
  }).toList());

  Get.dialog(SimpleDialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      children: filterItems));
}

class FilterItem extends StatelessWidget {
  final donationController = DonationItemController.instance;
  final String option;
  final int index;
  FilterItem({
    super.key,
    required this.option,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            minimumSize: const Size.fromHeight(50)),
        onPressed: () {
          donationController.selectedCategoryIndex(index);
          donationController.filterDonationItems(option);
          Get.back();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option,
                style: const TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Radio(
              value: option,
              groupValue:
                  filterOptions[donationController.selectedCategoryIndex.value],
              onChanged: null,
            ),
          ],
        ));
  }
}
