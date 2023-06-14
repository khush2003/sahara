import 'package:flutter/material.dart';

class CardSahara extends StatelessWidget {
  final Widget child;
  const CardSahara({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            )
          ],
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }
}
