

import 'package:flutter/material.dart';

import '../components/DeliveryPage/delivery_card.dart';
import '../models/donation_post.dart';
import '../models/user.dart';

class ReviewPage extends StatelessWidget {
  

  ReviewPage({super.key});

  final DonationItem item = DonationItem.test();
  final UserSahara user = UserSahara.test();
  final arrDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
      ),
      body: Column(
        children: [
          ReviewCard(user: user, item: item, arrDate: arrDate),
          const Center(
            child: PostButton()
          )
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final DonationItem item;
  final UserSahara user;
  final DateTime arrDate;

  const ReviewCard(
      {super.key,
      required this.user,
      required this.item,
      required this.arrDate});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ItemInfo(item: item)
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
                
              ),
            ),
            // Black line seperating top inf and bottom info
            Container(
              height: 0.5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            const PointSlider()
            
          ],
        ),
      ),
    );
  }
}

class PostButton extends StatelessWidget {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: (){
              showDialog(context: context, builder: (BuildContext context){
                return const AlertDialog(
                  title: Text('Successfully Post Review'),
                  content: Padding(padding: EdgeInsets.all(16.0), child: Text('Your Review will be shown in the Feed Page.'),),
                );
              });
          }, child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            child: Text('Post', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          )
          );
  }
}


class PointSlider extends StatefulWidget {
  const PointSlider({super.key});

  @override
  State<PointSlider> createState() => _PointSliderState();
}

class _PointSliderState extends State<PointSlider> {

  double currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Please rate the item'),
                Text('${(currentSliderValue*2500).round()} /2500')
              ],
            ),
          ),
          Slider(value: currentSliderValue,
           onChanged: (double value){
            setState(() {
              currentSliderValue = value;
            });
           }
           
           ),
        ],
      ),
    );
  }
}

