import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/routes.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Container(
            width: 30,
            height: 30,
            color: Colors.pink,
          ),
            Container(width: 200,child: const Text('WaterMelon Sugar', style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis, maxLines: 1,)),
          ]),
        actions: [
          Container(
            color: const Color.fromRGBO(190, 239, 0, 1),
            
            child: TextButton(
  style: TextButton.styleFrom(
    foregroundColor: Colors.black,
    disabledForegroundColor: Colors.white,
  ),
  onPressed: () {
    Get.toNamed(Routes.payment);
  },
  child: const Text('Give', style: TextStyle(fontSize: 20)),
),
          )

        ],
        ),

        body: const Center(child: Text('hi')),

    );
  }
}