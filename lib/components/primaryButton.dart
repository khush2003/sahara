import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;

  const PrimaryButton({
    super.key,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: const Text("Hello"));
  }
}
