import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  filterItems.addAll(filterOptions.map((e) => FilterItem(option: e)).toList());

  Get.dialog(SimpleDialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      children: filterItems));
}

class FilterItem extends StatelessWidget {
  final String option;
  const FilterItem({
    super.key,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            minimumSize: const Size.fromHeight(50)),
        onPressed: () {},
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
              groupValue: filterOptions[0],
              onChanged: null,
            ),
          ],
        ));
  }
}
