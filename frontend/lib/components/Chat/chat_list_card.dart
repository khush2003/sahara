import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/image_thumbnail.dart';
import 'package:sahara/models/chat_room.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/routes/routes.dart';

class ChatListCard extends StatelessWidget {
  final ChatRoom room;
  final DonationItem item;
  final UserSahara user;
  const ChatListCard({super.key, required this.room, required this.item, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.chat, parameters: {'id': room.chatRoomId!});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color.fromRGBO(120, 120, 120, 1),
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      ImageThumbnail(imageUrl: item.imageUrl, size: 50),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                          width: 230,
                          child: Text(
                            item.name,
                            style: const TextStyle(fontSize: 20, height: 1),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )),
                      IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  // title: const Text('AlertDialog Title'),
                                  content: const Text(
                                      'Do you want to block this user?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Yes'),
                                      //TODO: Block user
                                      child: const Text('Yes'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'No'),
                                      child: const Text('No'),
                                    ),
                                  ],
                                ),
                              ),
                          icon: const Icon(
                            Icons.no_accounts,
                            size: 40,
                          ))
                    ],
                  ),
                  const Divider(
                    thickness: 1.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      ImageThumbnail(
                        imageUrl: user.profilePicture,
                        isCircular: true,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      SizedBox(
                          width: 230,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.userName,
                                style: const TextStyle(fontSize: 20, height: 1),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              const Text(
                                'Him : Give me your bottle', //TODO: Fetch latest message
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 1,
                                    color: Color.fromRGBO(150, 150, 150, 1)),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            )
            //       child: InkWell(
            //         splashColor: Colors.blue.withAlpha(30),
            //         onTap: () {
            //           debugPrint('Card tapped.');
            //         },
            //         child: const SizedBox(
            //           width: 360,
            // height: 145.08,
            //           child: Text('A card that can be tapped'),
            //         ),
            //       ),
            ),
      ),
    );
  }
}
