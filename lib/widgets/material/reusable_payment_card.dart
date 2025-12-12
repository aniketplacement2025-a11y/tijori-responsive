import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';

class ReusablePaymentCard extends StatelessWidget {
  final String amount;
  final String dueDate;
  final String notificationTime;
  final bool showKdSuffix;
  final double? width;
  final double? height;

  const ReusablePaymentCard({
    super.key,
    required this.amount,
    required this.dueDate,
    required this.notificationTime,
    this.showKdSuffix = true,
    this.width = 350,
    this.height = 232,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(
        top: 20,
        right: 10,
        bottom: 20,
        left: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: CustomColors.blackBS1,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Amount of the payment
          _buildTextLabel(
            label: 'Amount of the payment',
            sublabel: showKdSuffix ? '$amount (in Kd)' : amount,
          ),

          // Due date of payment
          _buildTextLabel(
            label: 'Due date of payment',
            sublabel: dueDate,
          ),

          // When I get Notified
          _buildTextLabel(
            label: 'When I get notified',
            sublabel: notificationTime,
          ),
        ],
      ),
    );
  }

  Widget _buildTextLabel({
    required String label,
    required String sublabel,
  }){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: Constants.fontSmall,
                color: CustomColors.littleWhite,
              ),
            ),
          ],
        ),
        SizedBox(height: Constants.spacingLittle),

    Container(
     width: 350,
     height: 36,
     padding: const EdgeInsets.only(
      top: 5,
      right: 20,
      bottom: 5,
      left: 20,
     ),
     decoration: BoxDecoration(
      color: const Color(0xFF000000).withOpacity(0.05), // #00000005
      borderRadius: BorderRadius.circular(20),
     ),
     child: Row(
          children: [
            SizedBox(width: Constants.spacingLittle),
            Text(
              sublabel,
              style: TextStyle(
                fontSize: Constants.fontSmall,
                fontWeight: .bold,
                color: CustomColors.littleWhite,
              ),
            ),
          ],
        ),
       ),
      ],
    );
  }
}