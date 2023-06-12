import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
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
            Container(width: 200,child: Text('WaterMelon Sugar', style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis, maxLines: 1,)),
          ]),
        actions: [
          Container(
            color: Color.fromRGBO(190, 239, 0, 1),

            child: TextButton(
  style: TextButton.styleFrom(
    primary: Colors.black,
    onSurface: Colors.white,
  ),
  onPressed: () {

  },
  child: Text('Give', style: TextStyle(fontSize: 20)),
),
          )

        ],
        ),

    );
  }
}