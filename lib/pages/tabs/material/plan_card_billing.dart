import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/pre_subscription_controller.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';

import '../../../utils/Images.dart';
import '../../others/dart_pink_button.dart';

class PlanCardBilling extends StatelessWidget {

  final String planName;
  final String price;
  final String pricePeriod;
  final List<Map<String, String>> features;
  final VoidCallback onPressed;
  final String buttonText;

  PlanCardBilling({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.price,
    required this.features,
    required this.planName,
    required this.pricePeriod,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 294,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: CustomColors.blackBS1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Row 1: Plan Name and Price
          SizedBox(
            width: 220,
            height: 48,
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                // Plan Name
                SizedBox(
                 width: 72,
                 height: Constants.fontLarge,
                 child: Text(
                   planName,
                   style: TextStyle(
                     fontFamily: Constants.primaryfont,
                     fontWeight: FontWeight.bold,
                     fontSize: Constants.fontMedium,
                     color: CustomColors.black87,
                   ),
                 ),
                ),

                // Price Container
                Container(
                  width: 108,
                  height: 56,
                  child: Column(
                    crossAxisAlignment: .end,
                    children: [
                      // Price
                      SizedBox(
                        width: 84,
                        height: 31,
                    child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        children: [
                        TextSpan(
                        text: price,
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontWeight: FontWeight.bold,
                          fontSize: Constants.fontLarge,
                          color: CustomColors.black87,
                        ),
                      ),
                      TextSpan(
                        text: ' Kd',
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontWeight: FontWeight.bold,
                          fontSize: Constants.fontSmall,
                          color: CustomColors.black87,
                        ),
                      ),
                    ],
                   ),
                  ),
                ),


                // Price Period
                SizedBox(
                  width: 84,
                  height: 16,
                  child: Text(
                    pricePeriod,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.fontLittle,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
       ),
      ),

      SizedBox(height: Constants.spacingSmall),

          // Row 2: Horizontal Divider
          Container(
            width: 280,
            height: 0,
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomColors.black87,
                width: 1,
              ),
            ),
          ),

          SizedBox(height: Constants.spacingSmall),

      // Row 3: Key Features Title
      SizedBox(
        width: 280,
        height: 34,
        child: Text(
          'Key features',
          style: TextStyle(
            fontFamily: Constants.primaryfont,
            fontWeight: .bold,
            fontSize: Constants.fontSmall,
            color: CustomColors.black87,
          ),
        ),
      ),

          // Feature Rows
          Column(
            children: features.map((feature) {
              return _buildFeatureRow(feature: feature);
            }).toList(),
          ),

          SizedBox(height: Constants.spacingSmall),

          DarKPinkButton(
            text: buttonText,
            onPressed: () {
              print('Subscribing to $planName plan');
              onPressed();
            },
            width: 280,
            height: 52,
          ),
      ],
     ),
    );
  }
}

Widget _buildFeatureRow({required Map<String, String> feature}){
  return Container(
    width: 280,
    height: 26,
    margin: EdgeInsets.only(bottom: Constants.spacingSmall),
    child: Row(
      crossAxisAlignment: .start,
      children: [

        // Check icon
        Container(
          width: Constants.fontMedium,
          height: Constants.fontMedium,
          decoration: BoxDecoration(
            borderRadius: .circular(Constants.fontLittle),
          ),
          child: Image.asset(
            feature['icon']!,
            width: Constants.fontMedium,
            height: Constants.fontMedium,
            fit: BoxFit.contain,
          ),
        ),

        SizedBox(width: Constants.spacingSmall),

        // Feature text
        Expanded(
            child: SizedBox(
              height: Constants.fontMedium,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  feature['title']!,
                  style: TextStyle(
                    fontFamily: Constants.primaryfont,
                    fontSize: 14,
                    color: CustomColors.black87,
                  ),
                ),
              ),
            ),
        ),
      ],
    ),
  );
}
