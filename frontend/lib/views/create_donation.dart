// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:sahara/components/Feed/upload_address_popup.dart';

import 'package:sahara/controllers/create_donation_controller.dart';

import 'package:sahara/models/user.dart';

import 'package:sahara/routes/routes.dart';

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

  double usabilityValue = 50;

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
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Expanded(
                                child: TextFormFieldThemed(
                                  hintText: 'Enter Item Name',
                                  validator:
                                      createDonationController.textValidator,
                                  controller:
                                      createDonationController.nameController,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: DropDownCustomCategory(
                          controller: createDonationController,
                        ),
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
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Expanded(
                                    child: DropDownCustomDuration(
                                      controller: createDonationController,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Expanded(
                                    child: DropDownCustomDurationType(
                                      controller: createDonationController,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Usability',
                              style: regularTextBold(),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Expanded(
                                child: Slider(
                                  value: usabilityValue,
                                  min: 49.0,
                                  max: 100.0,
                                  label: '${usabilityValue.round()}%',
                                  onChanged: (newUsabilityValue) {
                                    setState(() =>
                                        usabilityValue = newUsabilityValue);
                                  },
                                  activeColor: primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                  Expanded(
                                    child: NumberTextFormFieldThemed(
                                      hintText: 'Enter Item Price',
                                      validator: createDonationController
                                          .numberValidator,
                                      controller: createDonationController
                                          .priceController,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^\d+\.?\d{0,2}')),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                Text(
                                  '--',
                                  style: regularTextBold(color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                                      validator: createDonationController
                                          .numberValidator,
                                      controller: createDonationController
                                          .widthController,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^\d+\.?\d{0,2}')),
                                      ],
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
                                      validator: createDonationController
                                          .numberValidator,
                                      controller: createDonationController
                                          .lengthController,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^\d+\.?\d{0,2}')),
                                      ],
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
                                      validator: createDonationController
                                          .numberValidator,
                                      controller: createDonationController
                                          .heightController,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^\d+\.?\d{0,2}')),
                                      ],
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
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
                                      validator: createDonationController
                                          .numberValidator,
                                      controller: createDonationController
                                          .weightController,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^\d+\.?\d{0,2}')),
                                      ],
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
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
                                Text(
                                  '--',
                                  style: regularTextBold(color: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                              child: Expanded(
                                child: DropDownCustomPaidBy(
                                  controller: createDonationController,
                                ),
                              ),
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
                        child: Expanded(
                          child: AreaTextFormFieldThemed(
                              hintText: 'Share your experience'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Expanded(
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

int deliveryFees(double width, double length, double height, double weight) {
  double totalFee = (0.3 * (width + length + height) * (0.25 * weight));
  return totalFee.round();
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

class DropDownCustomCategory extends StatelessWidget {
  const DropDownCustomCategory({
    super.key,
    required this.controller,
  });
  final CreateDonationController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DropdownButtonFormField<String>(
        value: controller.selectedCategory.value,
        items: controller.categoryOptions.map((category) {
          return dropdownMenuItemCustom(category);
        }).toList(),
        onChanged: controller.setSelectedCategory,
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
    );
  }

  DropdownMenuItem<String> dropdownMenuItemCustom(String category) {
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
  }
}

class DropDownCustomDuration extends StatelessWidget {
  const DropDownCustomDuration({
    super.key,
    required this.controller,
  });
  final CreateDonationController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DropdownButtonFormField<String>(
        value: controller.duration.value.toString(),
        items: controller.durationOptions.map((duration) {
          return dropdownMenuItemCustom(duration);
        }).toList(),
        onChanged: (value) => controller.setDuration(value!),
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
    );
  }

  DropdownMenuItem<String> dropdownMenuItemCustom(String duration) {
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
  }
}

class DropDownCustomDurationType extends StatelessWidget {
  const DropDownCustomDurationType({
    super.key,
    required this.controller,
  });
  final CreateDonationController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DropdownButtonFormField<String>(
        value: controller.durationType.value,
        items: controller.durationTypeOptions.map((durationType) {
          return dropdownMenuItemCustom(durationType);
        }).toList(),
        onChanged: controller.setDurationType,
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
    );
  }

  DropdownMenuItem<String> dropdownMenuItemCustom(String durationType) {
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
  }
}

class DropDownCustomPaidBy extends StatelessWidget {
  const DropDownCustomPaidBy({
    super.key,
    required this.controller,
  });
  final CreateDonationController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DropdownButtonFormField<String>(
        value: controller.paidBy.value,
        items: controller.paidByOptions.map((paidBy) {
          return dropdownMenuItemCustom(paidBy);
        }).toList(),
        onChanged: controller.setPaidBy,
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
    );
  }

  DropdownMenuItem<String> dropdownMenuItemCustom(String paidBy) {
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
  }
}
