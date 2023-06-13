import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  late String? pretext;
  final String hintText;
  final double fontsize;
  final FontWeight fontWeight;
  late Color? color;

  Textfield(
      {super.key,
      required this.hintText,
      required this.fontWeight,
      required this.fontsize,
      this.pretext,
      this.color});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: pretext,
        style: TextStyle(
            fontFamily: "Dongle",
            fontSize: fontsize,
            fontWeight: fontWeight,
            color: color),
        decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            hintText: hintText));
  }
}
