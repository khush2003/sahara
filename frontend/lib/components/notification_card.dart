// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sahara/theme/app_theme.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Color.fromRGBO(120, 120, 120, 1),
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TODO: Use image from database if exists
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: const Color(0xffFF0E58),
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your post has reached 100 likes!',
                            style: regularTextBold(),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Congratulations!',
                            style: smallText(color: Colors.grey, height: 0.5),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      // TODO: Delete notification
                    },
                    icon: const Icon(
                      Icons.delete_forever_outlined,
                      size: 32,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
