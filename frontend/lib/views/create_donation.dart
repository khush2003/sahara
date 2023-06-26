// ignore_for_file: unnecessary_import, unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sahara/components/CreateDonation/category_drop_down.dart';
import 'package:sahara/components/CreateDonation/duration_drop_down.dart';
import 'package:sahara/components/CreateDonation/estimated_item_value.dart';
import 'package:sahara/components/Feed/donation_details_section.dart';

import 'package:sahara/components/Feed/upload_address_popup.dart';

import 'package:sahara/controllers/create_donation_controller.dart';

import 'package:sahara/theme/app_theme.dart';
import 'package:sahara/theme/global_widget.dart';
import 'package:sahara/utils/app_utils.dart';

class CreateDonationView extends StatelessWidget {
  final createDonationController = Get.put(CreateDonationController());
  CreateDonationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Donation Post'),
      ),
      /*
      body: const Center(
        child: ElevatedButton(
          onPressed: showUploadAddressDialog,
          child: Text('Upload Address'),
      */
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 18.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Obx(
                      () => OutlinedButton.icon(
                        icon: createDonationController.imageUrl.value == ''
                            ? const Icon(
                                Icons.image_outlined,
                                color: Colors.grey,
                                size: 100,
                              )
                            : Expanded(
                                child: Image.network(
                                  createDonationController.imageUrl.value,
                                  fit: BoxFit.fill,
                                ),
                              ),
                        onPressed: () => createDonationController.uploadImage(),
                        label: const Text(''),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Item Name',
                      style: regularTextBold(),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: TextFormFieldThemed(
                              hintText: 'Enter Item Name',
                              validator: createDonationController.textValidator,
                              controller:
                                  createDonationController.nameController,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: CategoryDropDown(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Used Duration',
                      style: regularTextBold(),
                    ),
                    Row(
                      children: [
                        DurationDropDown(),
                      ],
                    ),
                  ],
                ),
              ),
              EstimatedItemValue(),
              DeliveryFeeValue(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee Paid By',
                      style: regularTextBold(),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: PaidByDropDown(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0),
                child: Text(
                  'Item Description',
                  style: regularTextBold(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 8.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: AreaTextFormFieldThemed(
                          hintText: 'Describe your item',
                          controller:
                              createDonationController.descriptionController),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: TextFormFieldThemed(
                        hintText: 'Add tags',
                        controller: createDonationController.tagsController,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            createDonationController.addTag();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Obx(() => createTags(createDonationController)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => [
                      createDonationController.createDonation(),
                    ],
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Post',
                      style: headTextBold(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget createTags(CreateDonationController controller) {
  final tagsWidgets = <Widget>[];
  for (int i = 0; i < controller.tags.length; i++) {
    tagsWidgets.add(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        decoration: BoxDecoration(
          border: Border.all(color: primary, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  controller.tags[i],
                  style: regularTextBold(),
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 15,
                  ),
                  onPressed: () {
                    controller.removeTag(i);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  return Wrap(
    direction: Axis.horizontal,
    spacing: 10,
    runSpacing: 10,
    children: tagsWidgets,
  );
}

class DeliveryFeeValue extends StatelessWidget {
  final createDonationController = CreateDonationController.instance;

  DeliveryFeeValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0),
          child: Text(
            'Item Size',
            style: regularTextBold(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Row(
                  children: [
                    Expanded(
                      child: NumberTextFormFieldThemed(
                        hintText: 'Width',
                        validator: createDonationController.numberValidator,
                        controller: createDonationController.widthController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        onChanged: (String value) {
                          createDonationController.calculateDelivery();
                        },
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'In',
                      style: regularTextBold(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Row(
                  children: [
                    Expanded(
                      child: NumberTextFormFieldThemed(
                        hintText: 'Length',
                        validator: createDonationController.numberValidator,
                        controller: createDonationController.lengthController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        onChanged: (String value) {
                          createDonationController.calculateDelivery();
                        },
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'In',
                      style: regularTextBold(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Row(
                  children: [
                    Expanded(
                      child: NumberTextFormFieldThemed(
                        hintText: 'Height',
                        validator: createDonationController.numberValidator,
                        controller: createDonationController.heightController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        onChanged: (String value) {
                          createDonationController.calculateDelivery();
                        },
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'In',
                      style: regularTextBold(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Item Weight',
                style: regularTextBold(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  children: [
                    Expanded(
                      child: NumberTextFormFieldThemed(
                        hintText: 'Weight',
                        validator: createDonationController.numberValidator,
                        controller: createDonationController.weightController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        onChanged: (String value) {
                          createDonationController.calculateDelivery();
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Kg',
                      style: regularTextBold(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Fee',
                style: regularTextBold(color: Colors.green),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '฿',
                    style: smallTextBold(color: Colors.green),
                  ),
                  const SizedBox(width: 5),
                  createDonationController.isFieldZero()
                      ? Obx(
                          () => Text(
                            createDonationController.deliveryFee
                                .toStringAsFixed(2),
                            style: regularTextBold(color: Colors.green),
                          ),
                        )
                      : Text(
                          '--',
                          style: regularTextBold(color: Colors.green),
                        ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PaidByDropDown extends StatelessWidget {
  final CreateDonationController createDonationController =
      CreateDonationController.instance;

  PaidByDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: DropdownButtonFormField<String>(
          value: createDonationController.getPaidBy(),
          items: createDonationController.paidByOptions.map(
            (paidBy) {
              return DropdownMenuItem(
                value: paidBy,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Center(
                    child: Text(
                      paidBy,
                      style: regularText(height: 1.25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
          onChanged: createDonationController.setPaidBy,
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
    ]);
  }
}
