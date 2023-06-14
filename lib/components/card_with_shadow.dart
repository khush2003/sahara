import 'package:flutter/material.dart';
class CardSahara extends StatelessWidget {
  const CardSahara({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
        border: Border.all(color: const Color(0xFFedebeb)),
        borderRadius: BorderRadius.circular(10),
        
      ),child: const Card(child: Text("Test"),));
  }
}