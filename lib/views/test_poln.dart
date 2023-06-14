import 'package:flutter/material.dart';
import 'package:sahara/components/notification_card.dart';

class TestPoln extends StatelessWidget {
  const TestPoln({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            NotificationCard(),
            NotificationCard(),
        ]),
      ),
    );
  }
}