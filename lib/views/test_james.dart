import 'package:flutter/material.dart';

import '../components/deliveryCard.dart';

class TestJames extends StatelessWidget {
  const TestJames({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('James View'),),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            inTransitCard('James', '1 Day', 85,5000,'Supasek Dhanabordeephat','0885728260',200,'123/456 Soi Sukhumvit, Khwaeng Khlong Toei, Khet Khlong Toei, Bangkok 10110, Thailand'
,DateTime.now())
          ],
        ),
      ),
    );
  }
}

