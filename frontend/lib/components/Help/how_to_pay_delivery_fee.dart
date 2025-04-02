import 'package:flutter/material.dart';

class HowToPayDeliveryFee extends StatelessWidget {
  const HowToPayDeliveryFee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Delivery Fee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'How To Pay Delivery Fee',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'When it comes to paying the delivery fee, there are two options based on the donor\'s preference:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            PaymentOptionWidget(
              optionTitle: 'Donor Pays',
              optionDescription:
                  'If the donor has selected to pay the delivery fee, the following steps will be followed:',
              steps: [
                '1. After clicking the "Give" button on the chat page with the receiver, the donor will be directed to the payment page.',
                '2. On the payment page, the donor can make the delivery fee payment using the preferred payment method.',
                '3. After making the payment, the donor should upload the payment slip or confirmation on the payment page as proof of payment.',
                '4. The delivery service will verify the authenticity of the payment.',
                '5. If the payment is confirmed as successful, the chat will display the "Successfully Gave" status, indicating that the donor can proceed with the item pickup process at their location.',
              ],
            ),
            SizedBox(height: 20),
            PaymentOptionWidget(
              optionTitle: 'Receiver Pays',
              optionDescription:
                  'If the receiver is responsible for paying the delivery fee, the process is as follows:',
              steps: [
                '1. After clicking the "Give" button on the chat page with the receiver, the donor will not be directed to the payment page.',
                '2. Instead, a "Make Payment" button will appear on the receiver\'s side of the chat.',
                '3. The receiver should click the "Make Payment" button to proceed with the delivery fee payment.',
                '4. The receiver can choose their preferred payment method and complete the payment process.',
                '5. Once the payment is successful, the chat will display the "Successfully Received" status, indicating that the receiver can now await the item delivery.',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOptionWidget extends StatelessWidget {
  final String optionTitle;
  final String optionDescription;
  final List<String> steps;

  const PaymentOptionWidget({super.key, 
    required this.optionTitle,
    required this.optionDescription,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          optionTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          optionDescription,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: steps.map((step) => buildStepWidget(step)).toList(),
        ),
      ],
    );
  }

  Widget buildStepWidget(String step) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                step,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
