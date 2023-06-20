
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../models/author.dart';
import '../../utils/uni_icon.dart';
import '../image_thumbnail.dart';

class AutherDetailSection extends StatelessWidget {
  final Author author;
  final bool showChatButton;
  const AutherDetailSection(
      {super.key, required this.author, this.showChatButton = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageThumbnail(imageUrl: author.imageUrl, isCircular: true, size: 45),
        const SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 7),
            Text(
              author.name,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 32),
            ),
          ],
        ),
        const Spacer(),
        if (showChatButton)
          IconButton(onPressed: () {}, icon: const UnIcon(UniconsLine.comment))
      ],
    );
  }
}