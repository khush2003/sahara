import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

// ignore: must_be_immutable
class TextfieldAPP extends StatelessWidget {
  late String? pretext;
  final String hintText;
  final TextStyle textStyle;
  final Color borderColor;
  late bool? secureText;
  late TextEditingController? controllerFunction;
  late FormFieldValidator<String?>? validator;
  

  TextfieldAPP({
    super.key,
    required this.hintText,
    this.pretext,
    required this.textStyle,
    required this.borderColor,
    this.secureText,
    this.controllerFunction,
    this.validator,
  });

  Color mainColor = lonely;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secureText ?? false,
      initialValue: pretext,
      style: textStyle,
      decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          hintText: hintText,
          hintStyle: textStyle.copyWith(color: lonely)),
          controller: controllerFunction,
          validator: validator,
    );
  }
}
