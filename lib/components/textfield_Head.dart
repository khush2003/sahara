import 'package:flutter/material.dart';
import 'package:sahara/theme/app_theme.dart';

// ignore: must_be_immutable
class TextfieldWithHead extends StatelessWidget {
  late String? pretext;
  final String hintText;
  final TextStyle textStyle;
  final Color borderColor;

  TextfieldWithHead({
    super.key,
    required this.hintText,
    this.pretext,
    required this.textStyle,
    required this.borderColor,
  });

  Color mainColor = lonely;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextField(
        style: formFieldText(height: 1.5, color: primary),
        obscureText: false,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
            labelText: hintText,
            labelStyle: textStyle.copyWith(color: lonely),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
      ),
    );
  }
}
