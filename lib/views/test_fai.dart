import 'package:flutter/material.dart';
import '../components/chat_list_card.dart';

class TestFai extends StatelessWidget {
  const TestFai({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fai's View"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ChatListCard(),
            ChatListCard(),
        ]),
      ),
    );
  }
}

