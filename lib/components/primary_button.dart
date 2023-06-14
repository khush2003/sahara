import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
  });

  Color mainColor = const Color(0xff141D3A);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        child: Text(text, style: titleText(color: Colors.black, height: 1.3)),
      ),
    );
  }
}
