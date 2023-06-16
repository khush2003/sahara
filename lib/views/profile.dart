import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

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
    return Container(
      child: Column(
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
              // Add the desired action for the button here
            },
          ),
          const SizedBox(height: 10),
          _buildStyledButton(
            icon: Icons.settings,
            iconColor: Colors.black,
            label: 'Setting',
            labelColor: Colors.black,
            backgroundColor: Colors.white,
            onPress: () {
              // Add the desired action for the button here
            },
          ),
          const SizedBox(height: 10),
          _buildStyledButton(
            icon: Icons.logout,
            iconColor: Colors.red,
            label: 'Log Out',
            labelColor: Colors.red,
            backgroundColor: Colors.white,
            onPress: () {
              // Add the desired action for the button here
            },
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

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
                      borderRadius: BorderRadius.circular(10),
                      //color: Color(0xFFBEEF00),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'data:image/jpeg;base64,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'))),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.profileView);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Gorgeous Girl',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                        decoration: TextDecoration.none, // Remove the underline
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
