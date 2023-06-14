import 'package:flutter/material.dart';
import 'package:sahara/theme/app_theme.dart';

// ignore: must_be_immutable
class TextfieldAPP extends StatelessWidget {
  late String? pretext;
  final String hintText;
  final TextStyle textStyle;
  final Color borderColor;

  TextfieldAPP({
    super.key,
    required this.hintText,
    this.pretext,
    required this.textStyle,
    required this.borderColor,
  });

  Color mainColor = lonely;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: pretext,
      style: textStyle,
      decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          hintText: hintText,
          hintStyle: formFieldText(color: lonely)),
    );
  }
}
