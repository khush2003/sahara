import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/boardingPageTemplate.png",
            fit: BoxFit.fill,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Column(
          //     children: const [
          //       Padding(
          //         padding: EdgeInsets.fromLTRB(0, 310, 0, 0),
          //         child: Center(
          //           child: Text("TRANSFORM\nWASTE\nINTO\nWISH",
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                   fontFamily: 'Dongle',
          //                   color: Colors.white,
          //                   fontSize: 36,
          //                   height: 1,
          //                   fontWeight: FontWeight.w400)),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
