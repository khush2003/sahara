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
              onPressed: () => Get.toNamed(Routes.testJames),
              child: const Text('Test James')),
          
          ElevatedButton(
              onPressed: () => Get.toNamed(Routes.testKhush),
              child: const Text('Test Khush')),
          ElevatedButton(
              onPressed: () => Get.toNamed(Routes.profile),
              child: const Text('Profile')),
          ElevatedButton(
              onPressed: () => Get.toNamed(Routes.onboarding),
              child: const Text('Test Note')),
          ElevatedButton(
              onPressed: () => Get.toNamed(Routes.testPoln),
              child: const Text('Test Poln')),
          ElevatedButton(
              onPressed: () => Get.toNamed(Routes.testFai),
              child: const Text('Test Fai')),
        ],
      ),
    );
  }
}
