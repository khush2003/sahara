import 'package:flutter/material.dart';
import 'package:sahara/theme/app_theme.dart';

class TextfieldAPP extends StatelessWidget {
  late String? pretext;
  final String hintText;
  final TextStyle textStyle;

  TextfieldAPP(
      {super.key,
      required this.hintText,
      this.pretext,
      required this.textStyle,});

Color mainColor = lonely;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: pretext,
        style: textStyle,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: textStyle.color ?? Colors.black)),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          hintText: hintText,
          hintStyle: textStyle.copyWith(color: textStyle.color),
        ));
  }
}
