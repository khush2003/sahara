import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ImageThumbnail extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final bool isCircular, isFlat;
  final double? fixedHeight;
  const ImageThumbnail(
      {super.key,
      this.imageUrl,
      this.size = 125,
      this.isCircular = false,
      this.isFlat = false,
      this.fixedHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: fixedHeight ?? size,
        decoration: BoxDecoration(
            border: Border.all(color: isCircular ? sucess : Colors.black),
            borderRadius: isCircular
                ? BorderRadius.circular(5000)
                : isFlat
                    ? BorderRadius.circular(0)
                    : BorderRadius.circular(10),
            color: Colors.amberAccent,
            image: imageUrl == null || imageUrl!.trim() == ''
                ? null
                : DecorationImage(
                    image: NetworkImage(imageUrl!), fit: BoxFit.cover)));
  }
}
