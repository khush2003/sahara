import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class BoardingView extends StatelessWidget {
  const BoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => Get.toNamed(Routes.delivery),
              child: const Text('Test James')),
          ElevatedButton(
              onPressed: () => Get.toNamed(Routes.app),
              child: const Text('Main Application')),
          ElevatedButton(
              onPressed: () => Get.toNamed(Routes.profile),
              child: const Text('Profile')),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.onboarding),
                  child: const Text('Test Note_Onboarding')),
              ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.coupon),
                  child: const Text('Test Note_Coupon')),
              ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.profileSetting),
                  child: const Text('Test Note_Setting'))
            ],
          ),
          ElevatedButton(
              onPressed: () => Get.toNamed(Routes.notifications),
              child: const Text('Test Poln')),
          ElevatedButton(
              onPressed: () => Get.toNamed(Routes.chat),
              child: const Text('Test Fai')),
        ],
      ),
    );
  }
}
