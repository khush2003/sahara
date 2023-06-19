import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahara/models/donation_post.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/theme/app_theme.dart';

import '../components/DeliveryPage/delivery_card.dart';

class DeliveryView extends StatelessWidget {
  DeliveryView({super.key});
  final DonationItem item = DonationItem.test();
  final UserSahara user = UserSahara.test();
  final arrDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TabBarJames(myitem: item, myuser: user, myarrDate: arrDate);

    // Scaffold(
    //   appBar: AppBar(title: const Text('James View'),),
    //   body: Center(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         // InTransitCard(user: user, item: item, arrDate: arrDate)
    //         DeliveredCard(user: user, item: item, arrDate: arrDate)
    //       ],
    //     ),
    //   ),
    // );
  }
}

class TabBarJames extends StatelessWidget {
  final DonationItem myitem;
  final UserSahara myuser;
  final DateTime myarrDate;

  const TabBarJames(
      {super.key,
      required this.myitem,
      required this.myuser,
      required this.myarrDate});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: titleBackground,
            // title: Text('Delivery Page'),
            bottom: const TabBar(tabs: <Widget>[
              Tab(text: 'In Transit'),
              Tab(text: 'To Deliver'),
              Tab(text: 'To Receive'),
              Tab(text: 'Delivered'),
            ]),
          ),
          body: SizedBox(
            height: 500,
            child: TabBarView(
              children: [
                InTransitCard(user: myuser, item: myitem, arrDate: myarrDate),
                ToDeliverCard(user: myuser, item: myitem, arrDate: myarrDate),
                ToReceiveCard(item: myitem, user: myuser, arrDate: myarrDate),
                DeliveredCard(item: myitem, user: myuser, arrDate: myarrDate)
              ],
            ),
          ),
        ));
  }
}
