import 'package:flutter/material.dart';
import '../components/chatListCard.dart';

class TestFai extends StatelessWidget {
  const TestFai({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fai's View"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ChatListCard(),
            ChatListCard(),
        ]),
      ),
    );
  }
}

