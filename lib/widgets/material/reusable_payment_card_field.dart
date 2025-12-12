import 'package:flutter/material.dart';

import '../../auth/fields/custom_form_field.dart';
import '../../utils/custom_colors.dart';

class ReusablePaymentCardField extends StatelessWidget {
  TextEditingController controller;
  final double? width;
  final double? height;

  ReusablePaymentCardField({
    super.key,
    this.width = 350,
    this.height = 268,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(top: 20, right: 10, bottom: 20, left: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: CustomColors.blackBS1, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Amount of the Payment
          CustomFormField(
            label: 'Amount of the payment',
            hintText: 'Enter an Amount(in Kd)',
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),

          // Due Date of Payment
          CustomFormField(
            label: 'Due date of Payment',
            hintText: 'Due date',
            controller: controller,
            suffixIcon: Icon(Icons.calendar_month),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),

          //When I get notified
          CustomFormField(
            label: 'When I get notified',
            hintText: 'Get notified 1 Day before',
            controller: controller,
            suffixIcon: Icon(Icons.arrow_downward),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
