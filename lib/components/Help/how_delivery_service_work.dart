import 'package:flutter/material.dart';

class HowDeliveryServiceWorks extends StatelessWidget {
  const HowDeliveryServiceWorks({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Services',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Our application is a donation app that aims to make the process of donating and delivering items convenient and efficient. When a user donates something, our reliable delivery service is dispatched to pick up the donated item from the donor\'s house and deliver it to the receiver\'s house.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'We understand the importance of transparency and keeping our users informed. That\'s why we provide a tracking system that allows users to monitor the status of their deliveries. From "to-deliver" to "in-transit," "to-receive," and finally "delivered," you can stay updated on the progress of your donation.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'In addition to our core services, we offer various features to enhance the delivery experience. These include real-time notifications, estimated delivery times, and personalized customer support. Our dedicated team is always ready to assist you with any questions or concerns.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Thank you for choosing our donation app and trusting us with your contributions. Together, we can make a positive impact and bring smiles to those in need.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
