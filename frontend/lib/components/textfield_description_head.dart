import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

// ignore: must_be_immutable
class TextfieldDescriptionWithHead extends StatelessWidget {
  late String? pretext;
  final String hintText;
  final TextStyle textStyle;
  final Color borderColor;
  final String headText;
  late bool? secureText;
  late TextEditingController? controllerFunction;

  TextfieldDescriptionWithHead({
    super.key,
    required this.hintText,
    this.pretext,
    required this.textStyle,
    required this.borderColor,
    required this.headText,
    this.secureText,
    this.controllerFunction
  });

  Color mainColor = lonely;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headText,
          style: headTextBold(),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: 150, // Set a maximum height for the TextField
            ),
            child: TextField(
              style: regularText(
                height: 1.5,
              ),
              textAlignVertical: TextAlignVertical.top, // Align text at the top
              maxLines: null, // Allow multiple lines
              expands: true, // Expand to available space
              obscureText: secureText ?? false,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: hintText,
                  hintStyle: textStyle.copyWith(color: lonely),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
                      controller: controllerFunction,
            ),
          ),
        ),
      ],
    );
  }
}
