
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tag;
  const Tag(this.tag, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        child: Text(tag));
  }
}
