import 'package:flutter/material.dart';

class CardSahara extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const CardSahara({super.key, required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
          child: child),
    );
  }
}
