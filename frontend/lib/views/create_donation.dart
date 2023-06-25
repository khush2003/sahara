// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables

//import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

//import 'package:sahara/components/Feed/upload_address_popup.dart';

import 'package:sahara/controllers/create_donation_controller.dart';

import 'package:sahara/theme/app_theme.dart';
import 'package:sahara/theme/global_widget.dart';

class CreateDonation extends StatefulWidget {
  const CreateDonation({Key? key}) : super(key: key);

  @override
  State<CreateDonation> createState() => CreateDonationView();
}

class CreateDonationView extends State<CreateDonation> {
  //final user = UserSahara( userName: '', userPhoneNumber: '');
  final createDonationController = Get.put(CreateDonationController());

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
      body: Obx(
        () => createDonationController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Form(
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
                                icon: createDonationController.imageUrl.value ==
                                        ''
                                    ? const Icon(
                                        Icons.image_outlined,
                                        color: Colors.grey,
                                        size: 100,
                                      )
                                    : Expanded(
                                        child: Image.network(
                                          createDonationController
                                              .imageUrl.value,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                onPressed: () =>
                                    createDonationController.uploadImage(),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
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
                                      validator: createDonationController
                                          .textValidator,
                                      controller: createDonationController
                                          .nameController,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: CategoryDropDown(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
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
                        padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0),
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
                                  hintText: 'Share your experience'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: TextFormFieldThemed(
                                hintText: 'Add tags',
                                controller:
                                    createDonationController.tagsController,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Obx(() => createTags(createDonationController)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
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
      ),
    );
  }
}

Widget createTags(CreateDonationController controller) {
  final tagsWidgets = <Widget>[];
  for (int i = 0; i < controller.tags.length; i++) {
    tagsWidgets.add(
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: primary, width: 0),
            borderRadius: BorderRadius.circular(25),
            color: secondary),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    controller.tags[i],
                    style: regularTextBold(),
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    icon: Icon(
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

class EstimatedItemValue extends StatefulWidget {
  const EstimatedItemValue({super.key});

  @override
  State<EstimatedItemValue> createState() => EstimatedItemValueState();
}

class EstimatedItemValueState extends State<EstimatedItemValue> {
  final createDonationController = Get.put(CreateDonationController());

  double price = 0;
  double usability = 0.5;
  double estimatedValue = 0;

  updatePrice(String value) {
    setState(
      () {
        price = double.parse(value);
      },
    );
  }

  estimatedCalculated() {
    setState(
      () {
        estimatedValue = price * usability;
      },
    );
  }

  getUsabilityValue() {
    return usability;
  }

  getEstimatedValue() {
    return estimatedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Usability',
                style: regularTextBold(),
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Slider(
                            value: usability,
                            min: 0.5,
                            max: 1.0,
                            onChanged: (double value) {
                              setState(
                                () {
                                  usability = value;
                                  estimatedCalculated();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${(usability * 100).round()}%',
                    style: regularTextBold(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Price',
                style: regularTextBold(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  children: [
                    Text(
                      '฿',
                      style: smallTextBold(),
                    ),
                    SizedBox(width: 5),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: NumberTextFormFieldThemed(
                            hintText: 'Enter Item Price',
                            validator: createDonationController.numberValidator,
                            controller: createDonationController.priceController,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}')),
                            ],
                            onChanged: (String value) {
                              updatePrice(value);
                              estimatedCalculated();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Estimated Current Price',
                style: regularTextBold(color: Colors.red),
              ),
              Row(
                children: [
                  Text(
                    '฿',
                    style: smallTextBold(color: Colors.red),
                  ),
                  SizedBox(width: 5),
                  price != 0
                      ? Text(
                          estimatedValue.toStringAsFixed(2),
                          style: regularTextBold(color: Colors.red),
                        )
                      : Text(
                          '--',
                          style: regularTextBold(color: Colors.red),
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

class DeliveryFeeValue extends StatefulWidget {
  const DeliveryFeeValue({super.key});

  @override
  State<DeliveryFeeValue> createState() => DeliveryFeeValueState();
}

class DeliveryFeeValueState extends State<DeliveryFeeValue> {
  final createDonationController = Get.put(CreateDonationController());

  double width = 0;
  double length = 0;
  double height = 0;
  double weight = 0;
  double deliveryFees = 0;

  updateWidth(String value) {
    setState(
      () {
        width = double.parse(value);
      },
    );
  }

  updateLength(String value) {
    setState(
      () {
        length = double.parse(value);
      },
    );
  }

  updateHeight(String value) {
    setState(
      () {
        height = double.parse(value);
      },
    );
  }

  updateWeight(String value) {
    setState(
      () {
        weight = double.parse(value);
      },
    );
  }

  deliveryCalculated() {
    setState(
      () {
        deliveryFees =
            (0.75 * (width + length)) + (height * 1) + (1.5 * weight);
      },
    );
  }

  getDeliveryFee() {
    return deliveryFees;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0),
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
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        onChanged: (String value) {
                          updateWidth(value);
                          deliveryCalculated();
                        },
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'In',
                      style: regularTextBold(),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Row(
                  children: [
                    Expanded(
                      child: NumberTextFormFieldThemed(
                        hintText: 'Length',
                        validator: createDonationController.numberValidator,
                        controller: createDonationController.lengthController,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        onChanged: (String value) {
                          updateLength(value);
                          deliveryCalculated();
                        },
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'In',
                      style: regularTextBold(),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Row(
                  children: [
                    Expanded(
                      child: NumberTextFormFieldThemed(
                        hintText: 'Height',
                        validator: createDonationController.numberValidator,
                        controller: createDonationController.heightController,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        onChanged: (String value) {
                          updateHeight(value);
                          deliveryCalculated();
                        },
                      ),
                    ),
                    SizedBox(width: 5),
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
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        onChanged: (String value) {
                          updateWeight(value);
                          deliveryCalculated();
                        },
                      ),
                    ),
                    SizedBox(width: 10),
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
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
                  SizedBox(width: 5),
                  width != 0 && length != 0 && height != 0 && weight != 0
                      ? Text(
                          deliveryFees.toStringAsFixed(2),
                          style: regularTextBold(color: Colors.green),
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

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({super.key});

  @override
  State<CategoryDropDown> createState() => CategoryDropDownState();
}

class CategoryDropDownState extends State<CategoryDropDown> {
  final categoryList = [
    'Electronic',
    'Clothing',
    'Cosmetic',
    'Furniture',
    'Accessaries',
  ];
  String selectedCategory = 'Electronic';

  getSelectedCategory() {
    return selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: DropdownButtonFormField<String>(
          value: selectedCategory,
          items: categoryList.map(
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
          onChanged: (value) {
            setState(
              () {
                selectedCategory = value!;
              },
            );
          },
          style: regularTextBold(),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: primary),
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

class DurationDropDown extends StatefulWidget {
  const DurationDropDown({super.key});

  @override
  State<DurationDropDown> createState() => DurationDropDownState();
}

class DurationDropDownState extends State<DurationDropDown>{
  final durationList = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
                        '11', '12'];
  String selectedDuration = '1';

  final durationTypeList = ['Week', 'Month'];
  String selectedDurationType = 'Week';

  getSelectedDuration() {
    return selectedDuration;
  }

  getSelectedDurationType() {
    return selectedDurationType;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Flex(direction: Axis.horizontal, children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: selectedDuration,
                items: durationList.map(
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
                onChanged: (value) {
                  setState(
                    () {
                      selectedDuration = value!;
                    },
                  );
                },
                style: regularTextBold(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: primary),
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
          ]),
        ),
        SizedBox(width: 10.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Flex(direction: Axis.horizontal, children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: selectedDurationType,
                items: durationTypeList.map(
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
                onChanged: (value) {
                  setState(
                    () {
                      selectedDurationType = value!;
                    },
                  );
                },
                style: regularTextBold(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: primary),
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
          ]),
        ),
      ],
    );
  }
}

class PaidByDropDown extends StatefulWidget {
  const PaidByDropDown({super.key});

  @override
  State<PaidByDropDown> createState() => PaidByDropDownState();
}

class PaidByDropDownState extends State<PaidByDropDown>{
  final paidByList = ['Donor (you)', '50/50', 'Receiver'];
  String selectedPaidBy = 'Donor (you)';

  getSelectedPaidBy() {
    return selectedPaidBy;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: DropdownButtonFormField<String>(
          value: selectedPaidBy,
          items: paidByList.map(
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
          onChanged: (value) {
            setState(
              () {
                selectedPaidBy = value!;
              },
            );
          },
          style: regularTextBold(),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: primary),
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