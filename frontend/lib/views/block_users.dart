import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth/auth_controller.dart';
import '../controllers/profile_view_controller.dart';
import '../theme/app_theme.dart';

class BlockUsers extends StatelessWidget {
  BlockUsers({Key? key}) : super(key: key);

  final CustomTabController controller = Get.put(CustomTabController());
  final auth = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Block Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: controller.blockedUsers.length,
              itemBuilder: (context, index) {
                final blockedUser = controller.blockedUsers[index];
                return UserProfile(
                  picturePath: blockedUser.profilePicture ??
                      'https://t4.ftcdn.net/jpg/04/83/90/95/360_F_483909569_OI4LKNeFgHwvvVju60fejLd9gj43dIcd.jpg',
                  username: blockedUser.userName,
                  blockedUserId: auth.userSahara.value.blockedUser![index],
                );
              });
        }),
      ),
    );
  }
}

class CrossIcon extends StatelessWidget {
  final String blockedUserId;
  CrossIcon({super.key, required this.blockedUserId});
  final CustomTabController controller = Get.put(CustomTabController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 91,
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
                            controller.unblockUserById(blockedUserId);
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
                                  color: Color.fromARGB(255, 164, 164, 164)),
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
    );
  }
}

class UserProfile extends StatelessWidget {
  final String picturePath;
  final String username;
  final String blockedUserId;

  const UserProfile({
    required this.picturePath,
    required this.username,
    required this.blockedUserId,
    Key? key,
  }) : super(key: key);

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
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
          ),
          const Spacer(),
          CrossIcon(blockedUserId: blockedUserId),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
