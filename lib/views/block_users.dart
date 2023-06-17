import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import 'package:sahara/theme/app_theme.dart';

import 'package:flutter/material.dart';

class BlockUsers extends StatelessWidget {
  const BlockUsers({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Block Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
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
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              UserProfile(
                picturePath:
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                username: 'Gorgeous Girl',
              ),
              Spacer(),
              CrossIcon(),
              SizedBox(width: 8)
            ],
          ),
        ),
      ),
    );
  }
}

class CrossIcon extends StatelessWidget {
  const CrossIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 91,
      child: Center(
        child: Expanded(
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    //title: const Text('Confirm'),
                    title: Text('Are you sure you want to unblock this user?',
                        style: headTextBold()),
                    actions: [
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFFffC736),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Unblock',
                                  style: headText(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                // Perform unblock logic here
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 164, 164, 164)),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Cancel',
                                  style: headText(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.clear,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  final String picturePath;
  final String username;

  const UserProfile({
    required this.picturePath,
    required this.username,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFBEEF00)),
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: NetworkImage(picturePath),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
