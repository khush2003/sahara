import 'package:flutter/material.dart';
import 'chat_room.dart';
class ChatListCard extends StatelessWidget {
  const ChatListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChatRoom()));
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
            // clipBehavior is necessary because, without it, the InkWell's animation
            // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
            // This comes with a small performance cost, and you should not set [clipBehavior]
            // unless you need it.
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
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(10.0), //or 15.0
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: const Color(0xffFF0E58),
                          // child: Icon(Icons.volume_up, color: Colors.white, size: 50.0),
                          // Image.asset("Assets/Images/music_default.png",
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                          width: 230,
                          child: const Text(
                            'Drinking bottle (Donor POV)',
                            style: TextStyle(fontSize: 20, height: 1),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )),
                      IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          // title: const Text('AlertDialog Title'),
          content: const Text('Do you want to block this user?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Yes'),
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'No'),
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
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(30.0), //or 15.0
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: Colors.amberAccent,
                          // child: Icon(Icons.volume_up, color: Colors.white, size: 50.0),
                          // Image.asset("Assets/Images/music_default.png",
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                          width: 230,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'WaterMelon Sugar',
                                style: TextStyle(fontSize: 20, height: 1),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                'Him : Give me your bottle',
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 1,
                                    color:
                                        Color.fromRGBO(150, 150, 150, 1)),
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

