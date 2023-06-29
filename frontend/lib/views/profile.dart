import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/image_thumbnail.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';

import '../controllers/profile_view_controller.dart';
import '../routes/routes.dart';
import '../theme/app_theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ProfileCard(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 0.5,
                decoration: const BoxDecoration(
                  color: Color(0xFFb8b6b6),
                ),
              ),
            ),
            const ButtonSection()
          ],
        ),
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  Widget _buildStyledButton({
    required IconData icon,
    required Color iconColor,
    required String label,
    required Color labelColor,
    required Color backgroundColor,
    required VoidCallback onPress,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onPress,
        icon: Icon(icon, color: iconColor),
        label: Text(
          label,
          style: TextStyle(color: labelColor, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(60)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: Color(0xFFedebeb)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStyledButton(
                icon: Icons.help_outline,
                iconColor: Colors.black,
                label: 'Help',
                labelColor: Colors.black,
                backgroundColor: Colors.white,
                onPress: () {
                  Get.toNamed(Routes.help);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildStyledButton(
                icon: Icons.block,
                iconColor: Colors.black,
                label: 'Block',
                labelColor: Colors.black,
                backgroundColor: Colors.white,
                onPress: () {
                  Get.toNamed(Routes.blockUsers);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildStyledButton(
          icon: Icons.discount_outlined,
          iconColor: Colors.green,
          label: 'Discount Coupon',
          labelColor: Colors.green,
          backgroundColor: Colors.white,
          onPress: () {
            Get.toNamed(Routes.coupon);
          },
        ),
        const SizedBox(height: 10),
        _buildStyledButton(
          icon: Icons.settings,
          iconColor: Colors.black,
          label: 'Setting',
          labelColor: Colors.black,
          backgroundColor: Colors.white,
          onPress: () => Get.toNamed(Routes.profileSetting),
        ),
        const SizedBox(height: 10),
        _buildStyledButton(
          icon: Icons.logout,
          iconColor: Colors.red,
          label: 'Log Out',
          labelColor: Colors.red,
          backgroundColor: Colors.white,
          onPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  //title: const Text('Confirm'),
                  title: Text(
                      'Are you sure you want to log out from this account?',
                      style: headTextBold()),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              AuthController.instance.signOut();
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
                                'Log Out',
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
        ),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  ProfileCard({super.key});
  final CustomTabController _tabController = Get.put(CustomTabController());

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
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.profileView);
                    },
                    child: Obx(() => ImageThumbnail(
                          imageUrl: _tabController
                                  .auth.userSahara.value.profilePicture ??
                              'https://t4.ftcdn.net/jpg/04/83/90/95/360_F_483909569_OI4LKNeFgHwvvVju60fejLd9gj43dIcd.jpg',
                          isCircular: true,
                          size: 75,
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.profileView);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => Text(
                          _tabController.auth.userSahara.value.userName,
                          style: headTextBold(),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
