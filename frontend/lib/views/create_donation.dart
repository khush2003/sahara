// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/Feed/upload_address_popup.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/routes/routes.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:sahara/theme/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../routes/routes.dart';
import '../theme/app_theme.dart';

class CreateDonation extends StatefulWidget {
  const CreateDonation({Key? key}) : super(key: key);

  @override
  State<CreateDonation> createState() => CreateDonationView();
}

class CreateDonationView extends State<CreateDonation> {
  final user = UserSahara(name: 'H');

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
      body: SingleChildScrollView(
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
                  child: OutlinedButton.icon(
                    icon: const Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                      size: 100,
                    ),
                    onPressed: () {},
                    label: const Text(''),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
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
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Expanded(
                        child: TextFormFieldThemed(
                          hintText: 'Enter Item Name',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Expanded(
                    child: DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(
                          value: 'Item Category',
                          child: Text('Item Category 1'),
                        ),
                        DropdownMenuItem(
                          value: 'Item Category',
                          child: Text('Item Category 2'),
                        ),
                        DropdownMenuItem(
                          value: 'Item Category',
                          child: Text('Item Category 3'),
                        ),
                      ],
                      onChanged: (String? value) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        filled: true,
                        fillColor: primary,
                        hintText: 'Item Category',
                        hintStyle: Theme.of(context).textTheme.displayLarge,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      iconSize: 32,
                      elevation: 2,
                      isExpanded: true,
                    ),
                  ),
                ),
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Expanded(
                            child: DropdownButtonFormField(
                              items: const [
                                DropdownMenuItem(
                                  value: 'Duration Number',
                                  child: Text('1'),
                                ),
                                DropdownMenuItem(
                                  value: 'Duration Number',
                                  child: Text('2'),
                                ),
                                DropdownMenuItem(
                                  value: 'Duration Number',
                                  child: Text('3'),
                                ),
                                DropdownMenuItem(
                                  value: 'Duration Number',
                                  child: Text('4'),
                                ),
                                DropdownMenuItem(
                                  value: 'Duration Number',
                                  child: Text('5'),
                                ),
                                DropdownMenuItem(
                                  value: 'Duration Number',
                                  child: Text('6'),
                                ),
                                DropdownMenuItem(
                                  value: 'Duration Number',
                                  child: Text('7'),
                                ),
                                DropdownMenuItem(
                                  value: 'Duration Number',
                                  child: Text('8'),
                                ),
                                DropdownMenuItem(
                                  value: 'Duration Number',
                                  child: Text('9'),
                                ),
                                DropdownMenuItem(
                                  value: 'Duration Number',
                                  child: Text('10'),
                                ),
                                DropdownMenuItem(
                                  value: 'Duration Number',
                                  child: Text('11'),
                                ),
                                DropdownMenuItem(
                                  value: 'Duration Number',
                                  child: Text('12'),
                                ),
                              ],
                              onChanged: (String? value) {},
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 8.0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '1',
                                hintStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                              ),
                              dropdownColor: Colors.white,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              iconSize: 24,
                              elevation: 2,
                              isExpanded: true,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Expanded(
                            child: DropdownButtonFormField(
                              items: const [
                                DropdownMenuItem(
                                  value: 'Used Duration',
                                  child: Text('Week'),
                                ),
                                DropdownMenuItem(
                                  value: 'Used Duration',
                                  child: Text('Month'),
                                ),
                              ],
                              onChanged: (String? value) {},
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 8.0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Week',
                                hintStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                              ),
                              dropdownColor: Colors.white,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              iconSize: 24,
                              elevation: 2,
                              isExpanded: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
                            setState(() => usabilityValue = newUsabilityValue);
                          },
                          activeColor: primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
                                hintText: 'Enter Item Price'),
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
                            child: NumberTextFormFieldThemed(hintText: 'Width'),
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
                            child:
                                NumberTextFormFieldThemed(hintText: 'Length'),
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
                            child:
                                NumberTextFormFieldThemed(hintText: 'Height'),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
                      child: Expanded(
                        child: DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem(
                              value: 'Paid By',
                              child: Text('Donor (You)'),
                            ),
                            DropdownMenuItem(
                              value: 'Paid By',
                              child: Text('50/50'),
                            ),
                            DropdownMenuItem(
                              value: 'Paid By',
                              child: Text('Reciever'),
                            ),
                          ],
                          onChanged: (String? value) {},
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8.0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Select',
                            hintStyle: Theme.of(context).textTheme.displayLarge,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                          dropdownColor: Colors.white,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                          ),
                          iconSize: 24,
                          elevation: 2,
                          isExpanded: true,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Expanded(
                  child: TextFormFieldThemed(
                    hintText: 'Add tags',
                    suffixIcon: Icon(Icons.add),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
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

/*
Widget createTags(CreateDonationController controller) {
  final tagsWidgets = <Widget>[];
  for (int i = 0; i < controller.tags.length; i++) {
    tagsWidgets.add(
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: primary, width: 0),
            borderRadius: BorderRadius.circular(50),
            color: secondary),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              controller.tags[i],
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(30, 30),
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                ),
                child: const Text('x'),
                onPressed: () {
                  controller.removeTag(i);
                })
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
*/