import 'package:flutter/material.dart';
import 'package:sahara/theme/app_theme.dart';

class HowToDonateUsedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate Your Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How To Donate Used Item?',
              style: headTextBold(),
            ),
            const SizedBox(height: 20),
            const StepWidget(
              stepNumber: '1',
              stepTitle: 'Upload Item Information',
              stepDescription:
                  'To donate something on our platform, start by uploading the necessary information about the used item. Provide accurate details and include any relevant descriptions or photos.',
            ),
            const SizedBox(height: 20),
            const StepWidget(
              stepNumber: '2',
              stepTitle: 'Interact with Potential Receivers',
              stepDescription:
                  'After posting your donation, interested receivers will initiate chats with you. Engage in conversations and evaluate the suitability of each receiver for your item. Take your time to decide which receiver you want to give the item to.',
            ),
            const SizedBox(height: 20),
            const StepWidget(
              stepNumber: '3',
              stepTitle: 'Confirm Donation',
              stepDescription:
                  'Once you have chosen a receiver, click the "Give" button located at the top of the chat window with the selected receiver. This confirms your decision to donate the item to that specific receiver.',
            ),
            const SizedBox(height: 20),
            const StepWidget(
              stepNumber: '4',
              stepTitle: 'Pay Delivery Fee',
              stepDescription:
                  'There are two options for paying the delivery fee: donor pay or receiver pay. The preferred payment method must be provided when uploading the donation post. Make the necessary payment as instructed to proceed with the delivery process.',
            ),
            const SizedBox(height: 20),
            const StepWidget(
              stepNumber: '5',
              stepTitle: 'Delivery Process',
              stepDescription:
                  'After the delivery fee has been paid, our dedicated delivery service will take over. The item will be collected from your location and delivered to the receiver\'s address. You can track the delivery status and receive updates on the progress.',
            ),
          ],
        ),
      ),
    );
  }
}

class StepWidget extends StatelessWidget {
  final String stepNumber;
  final String stepTitle;
  final String stepDescription;

  const StepWidget({
    required this.stepNumber,
    required this.stepTitle,
    required this.stepDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xffffc736),
              child: Text(
                stepNumber,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              stepTitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          stepDescription,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
