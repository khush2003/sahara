import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/create_donation_controller.dart';
import 'package:sahara/theme/app_theme.dart';
import 'package:sahara/theme/global_widget.dart';

class EstimatedItemValue extends StatelessWidget {
  final createDonationController = CreateDonationController.instance;

  EstimatedItemValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: UseabilityInput(
              createDonationController: createDonationController),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: PriceInput(createDonationController: createDonationController),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: EstimatedPriceField(
              createDonationController: createDonationController),
        ),
      ],
    );
  }
}

class EstimatedPriceField extends StatelessWidget {
  const EstimatedPriceField({
    super.key,
    required this.createDonationController,
  });

  final CreateDonationController createDonationController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Estimated Current Price',
          style: regularTextBold(color: Colors.red),
        ),
        Obx(
          () => Row(
            children: [
              Text(
                '฿',
                style: smallTextBold(color: Colors.red),
              ),
              const SizedBox(width: 5),
              createDonationController.estimatedValue.value != 0
                  ? Text(
                      createDonationController.estimatedValue
                          .toStringAsFixed(2),
                      style: regularTextBold(color: Colors.red),
                    )
                  : Text(
                      '--',
                      style: regularTextBold(color: Colors.red),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

class PriceInput extends StatelessWidget {
  const PriceInput({
    super.key,
    required this.createDonationController,
  });

  final CreateDonationController createDonationController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Price',
          style: regularTextBold(),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Row(
            children: [
              Text(
                '฿',
                style: smallTextBold(),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: NumberTextFormFieldThemed(
                  hintText: 'Enter Item Price',
                  validator: createDonationController.numberValidator,
                  controller: createDonationController.priceController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) =>
                      createDonationController.setEstimatedDuration(),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UseabilityInput extends StatelessWidget {
  const UseabilityInput({
    super.key,
    required this.createDonationController,
  });

  final CreateDonationController createDonationController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Usability',
          style: regularTextBold(),
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Obx(
                      () => Slider(
                        value: createDonationController.usability.value,
                        min: 0.3,
                        max: 1.0,
                        onChanged: createDonationController.setUseability,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Text(
                '${(createDonationController.usability * 100).round()}%',
                style: regularTextBold(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
