import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  PrimaryButton({
    super.key,
    this.onPressed,
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
        ),
        child: Text(text,
            style: const TextStyle(
                fontFamily: "Dongle",
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
