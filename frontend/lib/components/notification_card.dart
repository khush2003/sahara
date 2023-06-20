import 'package:flutter/material.dart';

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TODO: Use image from database if exists
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: const Color(0xffFF0E58),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: const [
                      SizedBox(
                        width: 230,
                        child: Text(
                          'Your post has reached 100 likes!',
                          style: TextStyle(
                            fontSize: 22,
                            height: 1,
                            fontWeight: FontWeight.bold
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 230,
                        child: Text(
                          'Congratulations!',
                          style: TextStyle(
                            fontSize: 20,
                            height: 0.5,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      // TODO: Delete notification
                    },
                    icon: const Icon(
                      Icons.delete_forever_outlined,
                      size: 40,
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
