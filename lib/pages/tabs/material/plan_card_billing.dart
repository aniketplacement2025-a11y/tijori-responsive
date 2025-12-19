import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/pre_subscription_controller.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
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
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants
    Constants.updateFromContext(context);

    // Responsive dimensions
    final double cardWidth = Responsive.value<double>(
      context,
      mobile: 320,
      tablet: 350,
      desktop: 380,
    );

    final double cardHeight = Responsive.value<double>(
      context,
      mobile: 294,
      tablet: 310,
      desktop: 326,
    );

    final double contentWidth = Responsive.value<double>(
      context,
      mobile: 280,
      tablet: 310,
      desktop: 340,
    );

    final double padding = Responsive.value<double>(
      context,
      mobile: 16,
      tablet: 18,
      desktop: 20,
    );

    return Container(
      width: cardWidth,
      height: cardHeight,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Responsive.value<double>(
            context,
            mobile: 16,
            tablet: 18,
            desktop: 20,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.blackBS1,
            blurRadius: Responsive.value<double>(
              context,
              mobile: 1,
              tablet: 1.5,
              desktop: 2,
            ),
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Plan Name and Price
          SizedBox(
            width: contentWidth,
            height: Responsive.value<double>(
              context,
              mobile: 48,
              tablet: 52,
              desktop: 56,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Plan Name
                SizedBox(
                  width: Responsive.value<double>(
                    context,
                    mobile: 72,
                    tablet: 78,
                    desktop: 84,
                  ),
                  height: Constants.getFontLarge(context),
                  child: Text(
                    planName,
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontWeight: FontWeight.bold,
                      fontSize: Constants.getFontMedium(context),
                      color: CustomColors.black87,
                    ),
                  ),
                ),

                // Price Container
                Container(
                  width: Responsive.value<double>(
                    context,
                    mobile: 108,
                    tablet: 116,
                    desktop: 124,
                  ),
                  height: Responsive.value<double>(
                    context,
                    mobile: 56,
                    tablet: 58,
                    desktop: 60,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Price
                      SizedBox(
                        width: Responsive.value<double>(
                          context,
                          mobile: 84,
                          tablet: 90,
                          desktop: 96,
                        ),
                        height: Responsive.value<double>(
                          context,
                          mobile: 31,
                          tablet: 33,
                          desktop: 35,
                        ),
                        child: RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: price,
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.getFontLarge(context),
                                  color: CustomColors.black87,
                                ),
                              ),
                              TextSpan(
                                text: ' Kd',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.getFontSmall(context),
                                  color: CustomColors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Price Period
                      SizedBox(
                        width: Responsive.value<double>(
                          context,
                          mobile: 84,
                          tablet: 90,
                          desktop: 96,
                        ),
                        height: Responsive.value<double>(
                          context,
                          mobile: 16,
                          tablet: 18,
                          desktop: 20,
                        ),
                        child: Text(
                          pricePeriod,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Constants.getFontLittle(context),
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

          SizedBox(height: Constants.getSpacingSmall(context)),

          // Row 2: Horizontal Divider
          Container(
            width: contentWidth,
            height: 0,
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomColors.black87.withOpacity(0.3),
                width: 1,
              ),
            ),
          ),

          SizedBox(height: Constants.getSpacingSmall(context)),

          // Row 3: Key Features Title
          SizedBox(
            width: contentWidth,
            height: Responsive.value<double>(
              context,
              mobile: 34,
              tablet: 36,
              desktop: 38,
            ),
            child: Text(
              'Key features',
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontWeight: FontWeight.bold,
                fontSize: Constants.getFontSmall(context),
                color: CustomColors.black87,
              ),
            ),
          ),

          // Feature Rows
          Column(
            children: features.map((feature) {
              return _buildFeatureRow(
                context: context,
                feature: feature,
                contentWidth: contentWidth,
              );
            }).toList(),
          ),

          SizedBox(height: Constants.getSpacingSmall(context)),

          DarKPinkButton(
            text: buttonText,
            onPressed: () {
              print('Subscribing to $planName plan');
              onPressed();
            },
            width: contentWidth,
            height: Responsive.value<double>(
              context,
              mobile: 52,
              tablet: 54,
              desktop: 56,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildFeatureRow({
  required BuildContext context,
  required Map<String, String> feature,
  required double contentWidth,
}) {
  return Container(
    width: contentWidth,
    height: Responsive.value<double>(
      context,
      mobile: 26,
      tablet: 28,
      desktop: 30,
    ),
    margin: EdgeInsets.only(bottom: Constants.getSpacingSmall(context)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Check icon
        Container(
          width: Constants.getFontMedium(context),
          height: Constants.getFontMedium(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Constants.getFontLittle(context),
            ),
          ),
          child: Image.asset(
            feature['icon']!,
            width: Constants.getFontMedium(context),
            height: Constants.getFontMedium(context),
            fit: BoxFit.contain,
          ),
        ),

        SizedBox(width: Constants.getSpacingSmall(context)),

        // Feature text
        Expanded(
          child: SizedBox(
            height: Constants.getFontMedium(context),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                feature['title']!,
                style: TextStyle(
                  fontFamily: Constants.primaryfont,
                  fontSize: Responsive.value<double>(
                    context,
                    mobile: 14,
                    tablet: 15,
                    desktop: 16,
                  ),
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