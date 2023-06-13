import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 215,
              child: TopSection(
                profile:
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                cover:
                    'https://images.unsplash.com/photo-1494500764479-0c8f2919a3d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bGFuZHNjYXBlfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60',
                username: 'Gorgeous Owl',
                email: 'johndoe@example.com',
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
    return Container(
      child: Stack(
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
                      color: Color(0xFFBEEF00),
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
            top: 145,
            left: 150,
            child: Text(username, style: headTextBold()),
          ),
          Positioned(
            top: 170,
            left: 150,
            child: Text(email, style: regularText()),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 96, 94, 94),
                ),
                padding: EdgeInsets.only(
                  top: 10,
                  right: 10,
                  bottom: 10,
                  left: 15,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialIcons extends StatelessWidget {
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    primary: Colors.white, // Set background color to white
    onPrimary: Colors.black, // Set text color to black
    elevation: 3, // Set the desired box shadow elevation
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Set the desired border radius
      side:
          BorderSide(color: Color(0xfff0eeee)), // Set the desired border color
    ),
    fixedSize: Size(100, 38),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          label: Text('Facebook', style: TextStyle(fontSize: 10)),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Handle button press
          },
          style: buttonStyle,
          icon: Image.asset(
            '../../assets/images/social_icons/instagram.png',
            height: 20,
          ),
          label: Text('Instagram', style: TextStyle(fontSize: 9)),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Handle button press
          },
          style: buttonStyle,
          icon: Image.asset(
            '../../assets/images/social_icons/twitter.png',
            height: 17,
          ),
          label: Text('Twitter', style: TextStyle(fontSize: 10)),
        ),
      ],
    );
  }
}
