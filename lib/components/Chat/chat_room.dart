import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/routes.dart';
import 'chatMessage.dart';




class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController _messageController = TextEditingController();

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                ),
                SizedBox(width: 2,),
                CircleAvatar(
                  backgroundImage: NetworkImage("<https://randomuser.me/api/portraits/men/5.jpg>"),
                  maxRadius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Kriss Benwat",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Text("Drinking Water",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
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
                  child: const Text('Give', style: TextStyle(fontSize: 20)),),
                )
              ],
            ),
          ),
        ),
      ),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
// iconTheme: IconThemeData(
//     color: Colors.black
//   ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//              Container(
//             width: 30,
//             height: 30,
//             color: Colors.pink,
//           ),
//             Container(width: 200,child: const Text('WaterMelon Sugar', style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis, maxLines: 1,)),
//           ]),
//         actions: [
//           Container(
//             color: const Color.fromRGBO(190, 239, 0, 1),
            
//             child: TextButton(
//   style: TextButton.styleFrom(
//     foregroundColor: Colors.black,
//     disabledForegroundColor: Colors.white,
//   ),
//   onPressed: () {
//     Get.toNamed(Routes.payment);
//   },
//   child: const Text('Give', style: TextStyle(fontSize: 20)),
// ),
//           )

//         ],
//         ),

        body: Stack(
        children: <Widget>[
           ListView.builder(
  itemCount: messages.length,
  shrinkWrap: true,
  padding: EdgeInsets.only(top: 10,bottom: 10),
  physics: NeverScrollableScrollPhysics(),
  itemBuilder: (context, index){
    return Container(
      padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
      child: Align(
        alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
          ),
          padding: EdgeInsets.all(16),
          child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
        ),
      ),
    );
  },
),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                     
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                     
                    },
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
                
              ),
            ),
          ),
        ],
      ),

    );
  }
}