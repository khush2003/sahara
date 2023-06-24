// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../components/Feed/donation_card.dart';
import '../components/Feed/review_card.dart';
import '../models/donation_item.dart';
import '../models/review.dart';
import '../models/user.dart';
import '../theme/app_theme.dart';
import 'package:get/get.dart';

import '../controllers/profile_view_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final CustomTabController _tabController = Get.put(CustomTabController());
  // CustomTabController _tabController = Get.find<CustomTabController>();

  @override
  Widget build(BuildContext context) {
    final UserSahara? user = _tabController.user;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 215,
                    child: FutureBuilder<UserSahara?>(
                      future:
                          _tabController.getUserById('cZIHOdL8GxrleOT9uUYL'),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final user = snapshot.data!;
                          return TopSection(
                            profile:
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            cover:
                                'https://images.unsplash.com/photo-1494500764479-0c8f2919a3d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bGFuZHNjYXBlfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60',
                            username: user.userName ?? '',
                            email: 'johndoe@example.com',
                          );
                        } else {
                          return Text('Error: ${snapshot.error}');
                        }
                      },
                    ),
                  ),
                  SocialIcons(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 0.5,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 161, 158, 158),
                      ),
                    ),
                  ),
                  TabSection(),
                  const SizedBox(height: 10),
                  Obx(() {
                    if (_tabController.isGiveSelected.value) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            NewAndHistory(),
                            const SizedBox(height: 10),
                            _tabController.isNewSelected.value
                                ? DonatingItem()
                                : ReceivedItem(),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ReceivedItem(),
                      );
                    }
                  }),
                ],
              ),
            ),
            Positioned(
                top: 16,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 96, 94, 94),
                    ),
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 10,
                      bottom: 10,
                      left: 15,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  final String profile;
  final String cover;
  final String username;
  final String email;

  const TopSection({
    required this.profile,
    required this.cover,
    required this.username,
    required this.email,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.network(
          cover,
          height: 150,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          top: 75,
          left: 16,
          child: Row(
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFBEEF00),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    profile,
                    height: 130,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 160,
          left: 150,
          child: Text(username, style: headTextBold()),
        ),
        Positioned(
          top: 185,
          left: 150,
          child: Text(email, style: regularText()),
        ),
      ],
    );
  }
}

class SocialIcons extends StatelessWidget {
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white, // Set text color to black
    elevation: 3, // Set the desired box shadow elevation
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Set the desired border radius
      side: const BorderSide(
          color: Color(0xfff0eeee)), // Set the desired border color
    ),
    fixedSize: const Size(105, 35),
  );

  SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              // Handle button press
            },
            style: buttonStyle,
            icon: Image.asset(
              '../../assets/images/social_icons/facebook.png',
              height: 20,
            ),
            label: const Text('Facebook', style: TextStyle(fontSize: 10)),
          ),
          SizedBox(width: 10),
          ElevatedButton.icon(
            onPressed: () {
              // Handle button press
            },
            style: buttonStyle,
            icon: Image.asset(
              '../../assets/images/social_icons/instagram.png',
              height: 20,
            ),
            label: const Text('Instagram', style: TextStyle(fontSize: 10)),
          ),
          SizedBox(width: 10),
          ElevatedButton.icon(
            onPressed: () {
              // Handle button press
            },
            style: buttonStyle,
            icon: Image.asset(
              '../../assets/images/social_icons/twitter.png',
              height: 17,
            ),
            label: const Text('Twitter', style: TextStyle(fontSize: 10)),
          ),
        ],
      ),
    );
  }
}

class TabSection extends StatelessWidget {
  final CustomTabController _tabController = Get.put(CustomTabController());

  TabSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: _tabController.selectGive,
          child: Obx(() => Column(
                children: [
                  SizedBox(
                      width: 120,
                      child: Text('Give',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _tabController.isGiveSelected.value
                                ? Colors.black
                                : const Color(0xff848484),
                          ),
                          textAlign: TextAlign.center)),
                  Visibility(
                    visible: _tabController.isGiveSelected.value,
                    child: Container(
                      height: 1,
                      width: 120,
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
        ),
        GestureDetector(
          onTap: _tabController.selectReceive,
          child: Obx(() => Column(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text('Receive',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _tabController.isReceiveSelected.value
                              ? Colors.black
                              : const Color(0xff848484),
                        ),
                        textAlign: TextAlign.center),
                  ),
                  Visibility(
                    visible: _tabController.isReceiveSelected.value,
                    child: Container(
                      height: 1,
                      width: 120,
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

class NewAndHistory extends StatelessWidget {
  final CustomTabController _tabController = Get.put(CustomTabController());

  NewAndHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Obx(() => ElevatedButton(
              onPressed: _tabController.selectNew,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: _tabController.isNewSelected.value
                    ? Colors.black
                    : const Color(0xff848484),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: _tabController.isNewSelected.value
                          ? Colors.black
                          : const Color(0xff848484)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const SizedBox(
                width: 120,
                child: Text(
                  'New',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
        Obx(() => ElevatedButton(
              onPressed: _tabController.selectHistory,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: _tabController.isHistorySelected.value
                    ? Colors.black
                    : const Color(0xff848484),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: _tabController.isHistorySelected.value
                          ? Colors.black
                          : const Color(0xff848484)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const SizedBox(
                width: 120,
                child: Text(
                  'History',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
      ],
    );
  }
}

// For New Tab
class DonatingItem extends StatelessWidget {
  final DonationItem donationPost = DonationItem.test();

  DonatingItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DonationCard(donationPost: donationPost),
        DonationCard(donationPost: donationPost),
        DonationCard(donationPost: donationPost),
        // Add more DonationCard widgets here as needed
      ],
    );
  }
}

// For History Tab
// class DonatedItem extends StatelessWidget {
//   final DonationItem donationPost = DonationItem.test();

//   DonatedItem({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DonationCard(donationPost: donationPost),
//         DonationCard(donationPost: donationPost),
//         DonationCard(donationPost: donationPost),
//         // Add more DonationCard widgets here as needed
//       ],
//     );
//   }
// }

// For History and Receive Tabs

class ReceivedItem extends StatelessWidget {
  final DonationItem donationPost = DonationItem.test();
  final Review review = Review.test();

  ReceivedItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReviewCard(
          donationPost: donationPost,
          review: review,
        ),
        ReviewCard(
          donationPost: donationPost,
          review: review,
        ),
        ReviewCard(
          donationPost: donationPost,
          review: review,
        ),
      ],
    );
  }
}
