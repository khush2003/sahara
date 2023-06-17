

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/DeliveryPage/delivery_card.dart';
import 'package:sahara/models/donation_post.dart';
import 'package:sahara/views/review_page.dart';

class PaymentPage extends StatelessWidget {

  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: ListView(
        children: [
          CardItemInfo(),
          QRCard(),
          const ImageInput(),
          const Padding(padding: EdgeInsets.all(16)),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: GiveButton(),
          )
        ],
      ),
    );
  }
}


class CardItemInfo extends StatelessWidget {
  
  CardItemInfo({super.key});
  final DonationItem item = DonationItem.test();

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
        child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ItemInfo(item: item),
              ),
      ),
    );
  }
}

class QRCard extends StatelessWidget {
  QRCard({super.key});
  final DonationItem item = DonationItem.test();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          // color: Colors.amberAccent,
          image: DecorationImage(
                            image: NetworkImage(
                                item.imageUrl))),
        ),
      );
    
  }
}


class ImageInput extends StatelessWidget {
  
  const ImageInput({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 200,
        child: OutlinedButton.icon(
                                    icon: const Icon(Icons.image),
                                 
                                    onPressed: () {},
                                    label: const Text('Add Image'),
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                        color: Colors.black, //Set border color
                                        width: 1, //Set border width
                                      ),
                                    ),
                                  ),
                                
      ),
    );
  }
}

class GiveButton extends StatelessWidget {
  const GiveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: (){
              showDialog(context: context, builder: (BuildContext context){
                return const AlertDialog(
                  title: Text('Successfully Donate Item'),
                  content: Padding(padding: EdgeInsets.all(16.0), child: Text('Your Item will be delivered soon.'),),
                );
              });
          }, child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            child: Text('Give', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          )
          );
  }
}
