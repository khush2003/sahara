import 'package:flutter/material.dart';
import 'package:sahara/theme/app_theme.dart';

// ignore: must_be_immutable
class TextfieldWithHead extends StatelessWidget {
  late String? pretext;
  final String hintText;
  final TextStyle textStyle;
  final Color borderColor;
  final String headText;
  late bool? secureText;

  TextfieldWithHead({
    super.key,
    required this.hintText,
    this.pretext,
    required this.textStyle,
    required this.borderColor,
    required this.headText,
    this.secureText,
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
          child: TextField(
            style: formFieldText(
              height: 1.5,
            ),
            obscureText: secureText ?? false,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: hintText,
                labelStyle: textStyle.copyWith(color: lonely),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
          ),
        ),
      ],
    );
  }
}
