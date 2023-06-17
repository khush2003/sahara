import 'package:flutter/material.dart';
import 'package:sahara/theme/app_theme.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key});
  Widget buildBulletPoint() {
    return const Padding(
      padding: EdgeInsets.only(right: 10.0, top: 5),
      child: Icon(
        Icons.brightness_1,
        size: 8,
      ),
    );
  }

  Widget buildTitle(String title) {
    return Text(title, style: headTextBold());
  }

  Widget buildText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildBulletPoint(),
        Expanded(
          child: Text(text),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  '../../assets/images/new_hd_logo.png',
                  width: 200,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle('Our Phone Numbers'),
                const SizedBox(height: 5),
                buildText('+669-887-332-137'),
                buildText('+669-739-643-234'),
                buildText('+669-932-248-242'),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle('Our Email'),
                const SizedBox(height: 5),
                buildText('sahara.customerservice@sah.com'),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle('Our Address'),
                const SizedBox(height: 5),
                buildText(
                    'No.442, Pracha Uthit 45, Bangmod, Thung Khru, Bangkok, 10140'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
