import 'package:flutter/material.dart';

class CardSahara extends StatelessWidget {
  const CardSahara({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Text("Test123"));
  }
}
