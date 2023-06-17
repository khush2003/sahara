import 'package:flutter/material.dart';
import 'package:sahara/theme/app_theme.dart';

class Tag extends StatelessWidget {
  final String tag;
  const Tag(this.tag, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        decoration: BoxDecoration(
          border: Border.all(color: primary, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            '#$tag',
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
          ),
        ]));
  }
}
