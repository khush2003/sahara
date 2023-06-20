import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  late Color? backgroundColor;

  PrimaryButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: Text(text, style: titleText(color: Colors.black, height: 1.3)),
      ),
    );
  }
}
