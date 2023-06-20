import 'package:flutter/material.dart';

class HowToMeasureYourItem extends StatelessWidget {
  const HowToMeasureYourItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measure Your Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'How To Measure Your Item',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Before donating your item, it\'s important to provide accurate measurements to help estimate the delivery fee. Here\'s a guide to help you measure your item properly:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            MeasurementStepWidget(
              stepNumber: 'Step 1',
              stepDescription:
                  'For length, measure the longest horizontal distance of the item from one end to the other.',
            ),
            SizedBox(height: 10),
            MeasurementStepWidget(
              stepNumber: 'Step 2',
              stepDescription:
                  'For width, measure the widest horizontal distance of the item from side to side.',
            ),
            SizedBox(height: 10),
            MeasurementStepWidget(
              stepNumber: 'Step 3',
              stepDescription:
                  'For height, measure the vertical distance from the bottom to the highest point of the item.',
            ),
            SizedBox(height: 10),
            MeasurementStepWidget(
              stepNumber: 'Step 4',
              stepDescription:
                  'For weight, use a scale to measure the item\'s mass in kilograms.',
            ),
            SizedBox(height: 10),
            Text(
              'Make sure to record these measurements accurately to provide the necessary information for calculating the delivery fee. If you have any doubts or questions, feel free to reach out to our support team for assistance.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MeasurementStepWidget extends StatelessWidget {
  final String stepNumber;
  final String stepDescription;

  const MeasurementStepWidget({super.key, 
    required this.stepNumber,
    required this.stepDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stepNumber,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            stepDescription,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
