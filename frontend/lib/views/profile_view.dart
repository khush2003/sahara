// ignore_for_file: prefer_const_constructors
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
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
  ProfileView({Key? key}) : super(key: key);
  final CustomTabController _tabController = Get.put(CustomTabController());

  @override
  Widget build(BuildContext context) {
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
                    child: Obx(() {
                      final user = _tabController.user.value;
                      if (user != null) {
                        return TopSection(
                          profile: user.profilePicture == ''
                              ? ''
                              : user.profilePicture,
                          cover: user.coverPicture,
                          username: user.userName,
                          email: FirebaseAuth.instance.currentUser!.email ?? '',
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                  ),
                  //SocialIcons(),
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
                                : History(),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  final String? profile;
  final String? cover;
  final String username;
  final String email;
  final CustomTabController _tabController = Get.put(CustomTabController());

  TopSection({
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
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ChangeProfileAndCoverPhotoDialog(
                    photo: cover!, type: 'Cover');
              },
            );
          },
          child: Container(
            height: 150,
            width: double.infinity,
            color: cover != '' ? null : Colors.white,
            child: cover != ''
                ? Image.network(
                    cover!,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  )
                : Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12, right: 5, bottom: 5, left: 5),
                        child: Text(
                          'Add Cover Photo',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
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
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color(0xFFBEEF00),
                    width: 2,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ChangeProfileAndCoverPhotoDialog(
                            photo: profile!, type: 'Profile');
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      profile == ''
                          ? 'https://t4.ftcdn.net/jpg/04/83/90/95/360_F_483909569_OI4LKNeFgHwvvVju60fejLd9gj43dIcd.jpg'
                          : profile!,
                      height: 130,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 160,
          left: 155,
          child: Text(username, style: headTextBold()),
        ),
        Positioned(
          top: 185,
          left: 155,
          child: Text(email, style: regularText()),
        ),
      ],
    );
  }
}

class ChangeProfileAndCoverPhotoDialog extends StatelessWidget {
  final String photo;
  final String type;
  final CustomTabController _tabController = Get.put(CustomTabController());

  ChangeProfileAndCoverPhotoDialog({required this.photo, required this.type});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          type == 'Profile' ? 'Change Profile Picture' : 'Change Cover Photo',
          style: headTextBold(),
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 220,
        child: Column(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                icon: photo == ''
                    ? Expanded(
                        child: type == 'Profile'
                            ? Image.network(
                                'https://t4.ftcdn.net/jpg/04/83/90/95/360_F_483909569_OI4LKNeFgHwvvVju60fejLd9gj43dIcd.jpg',
                                fit: BoxFit.fill,
                              )
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, right: 5, bottom: 5, left: 5),
                                  child: Text(
                                    'No Cover Photo',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                      )
                    : Expanded(
                        child: Image.network(
                          photo,
                          fit: BoxFit.fill,
                        ),
                      ),
                onPressed: () => {},
                label: const Text(''),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => _tabController.uploadImage(context),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFffC736),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Select Photo',
                        style: headText(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      // Perform cancel logic here
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 164, 164, 164),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Cancel',
                        style: headText(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
  //final DonationItem donationPost = DonationItem.test();
  final CustomTabController controller = Get.put(CustomTabController());

  DonatingItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: Obx(
            () => ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: controller.donationItems.length,
                itemBuilder: (context, index) {
                  return DonationCard(
                      donationPost: controller.donationItems[index]);
                }),
          ),
        )
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
  final CustomTabController controller = Get.put(CustomTabController());
  ReceivedItem({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
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
      ),
    );
  }
}

class History extends StatelessWidget {
  final CustomTabController controller = Get.put(CustomTabController());
  History({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: Obx(() => ListView.separated(
              itemBuilder: (context, index) {
                return ReviewCard(
                    donationPost: DonationItem.getFromId(
                        controller.reviewList[index].donationId,
                        controller.donationItems),
                    review: controller.reviewList[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: controller.reviewList.length)),
        )
      ],
    );
  }
}
