
import 'package:flutter/material.dart';
import 'package:sahara/controllers/create_donation_controller.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:get/get.dart';
class DurationDropDown extends StatelessWidget {
  final CreateDonationController createDonationController =
      CreateDonationController.instance;

  DurationDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Flex(direction: Axis.horizontal, children: [
            Expanded(
              child: Obx(
                () => DropdownButtonFormField<String>(
                  value: createDonationController.duration.value,
                  items: createDonationController.durationOptions.map(
                    (duration) {
                      return DropdownMenuItem(
                        value: duration,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Center(
                            child: Text(
                              duration,
                              style: regularText(height: 1.25),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: createDonationController.setDuration,
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
          ]),
        ),
        const SizedBox(width: 10.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Flex(direction: Axis.horizontal, children: [
            Expanded(
              child: Obx(
                () => DropdownButtonFormField<String>(
                  value: createDonationController.durationType.value,
                  items: createDonationController.durationTypeOptions.map(
                    (durationType) {
                      return DropdownMenuItem(
                        value: durationType,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Center(
                            child: Text(
                              durationType,
                              style: regularText(height: 1.25),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: createDonationController.setDurationType,
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
          ]),
        ),
      ],
    );
  }
}
