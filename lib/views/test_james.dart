import 'package:flutter/material.dart';

import '../components/DeliveryPage/deliveryAppBar.dart';
import '../components/DeliveryPage/deliveryCard.dart';


bool showInTransit = true;
bool showToDeliver = false;
bool showPickUp = false;
bool showDelivered = false;

// class TestJames extends StatelessWidget {
//   const TestJames({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: deliveryAppBar(),
//       body: Center(
//         child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             deliveryAppBar(),
//             if(showInTransit)
//              inTransitCard('James', '1 Day', 85,5000,'Supasek Dhanabordeephat','0885728260',200,'123/456 Soi Sukhumvit, Khwaeng Khlong Toei, Khet Khlong Toei, Bangkok 10110, Thailand'
// ,DateTime.now())

//             else if(showToDeliver)
//             toDeliverCard('James', '1 Day', 85,5000,'Supasek Dhanabordeephat','0885728260',200,'123/456 Soi Sukhumvit, Khwaeng Khlong Toei, Khet Khlong Toei, Bangkok 10110, Thailand'
// ,DateTime.now())

//             else if(showPickUp)
//             toReceiveCard('James', '1 Day', 85,5000,'Supasek Dhanabordeephat','0885728260',200,'123/456 Soi Sukhumvit, Khwaeng Khlong Toei, Khet Khlong Toei, Bangkok 10110, Thailand'
// ,DateTime.now())
            
//             // else if(showDelivered)



//           ],
//         ),
//       ),
//     );
//   }
// }


class TestJames extends StatefulWidget {
  const TestJames({super.key});

  

  @override
  State<TestJames> createState() => _TestJamesState();
}

class _TestJamesState extends State<TestJames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: newAppBar(),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            deliveryAppBar(),
//              inTransitCard('James', '1 Day', 85,5000,'Supasek Dhanabordeephat','0885728260',200,'123/456 Soi Sukhumvit, Khwaeng Khlong Toei, Khet Khlong Toei, Bangkok 10110, Thailand'
// ,DateTime.now()),
              deliveredCard('James', '1 Day', 85,5000,'Supasek Dhanabordeephat','0885728260',200,'123/456 Soi Sukhumvit, Khwaeng Khlong Toei, Khet Khlong Toei, Bangkok 10110, Thailand'
,DateTime.now())





          ],
        ),
      ),
    );
  }
}

