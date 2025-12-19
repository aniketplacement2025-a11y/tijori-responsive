import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/dart_pink_button.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/responsive_media_query.dart';

class PreSubscriptionDialog extends StatelessWidget {
  final String planName;
  final String planPrice;
  final VoidCallback onClose;
  final VoidCallback onConfirm;

  PreSubscriptionDialog({
    Key? key,
    required this.onClose,
    required this.planName,
    required this.planPrice,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants
    Constants.updateFromContext(context);

    // Responsive dimensions
    final double dialogWidth = Responsive.value<double>(
      context,
      mobile: 400,
      tablet: 450,
      desktop: 500,
    );

    final double dialogHeight = Responsive.screenHeight(context) * 0.42;

    final double topPadding = Responsive.value<double>(
      context,
      mobile: 220,
      tablet: 240,
      desktop: 260,
    );

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Container(
        height: dialogHeight,
        decoration: BoxDecoration(
          color: CustomColors.ghostWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              Responsive.value<double>(
                context,
                mobile: 30,
                tablet: 32,
                desktop: 34,
              ),
            ),
            topRight: Radius.circular(
              Responsive.value<double>(
                context,
                mobile: 30,
                tablet: 32,
                desktop: 34,
              ),
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: CustomColors.blackBS1,
              blurRadius: Responsive.value<double>(
                context,
                mobile: 20,
                tablet: 22,
                desktop: 24,
              ),
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background overlay
            Container(
              color: CustomColors.blackBS1,
            ),

            // Main Content
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Responsive.value<double>(
                        context,
                        mobile: 16,
                        tablet: 18,
                        desktop: 20,
                      ),
                    ),
                    topRight: Radius.circular(
                      Responsive.value<double>(
                        context,
                        mobile: 16,
                        tablet: 18,
                        desktop: 20,
                      ),
                    ),
                  ),
                ),
                padding: EdgeInsets.all(
                  Responsive.value<double>(
                    context,
                    mobile: Constants.getSpacingSmall(context),
                    tablet: Constants.getSpacingMedium(context),
                    desktop: Constants.getSpacingHigh(context),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Container
                      Container(
                        width: dialogWidth,
                        height: Responsive.value<double>(
                          context,
                          mobile: 28,
                          tablet: 30,
                          desktop: 32,
                        ),
                        margin: EdgeInsets.only(
                          bottom: Constants.getSpacingSmall(context),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // "Payment details" text
                            Container(
                              width: Responsive.value<double>(
                                context,
                                mobile: 194,
                                tablet: 204,
                                desktop: 214,
                              ),
                              height: Responsive.value<double>(
                                context,
                                mobile: 28,
                                tablet: 30,
                                desktop: 32,
                              ),
                              child: Text(
                                'Payment details',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.getFontMedium(context),
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.black87,
                                ),
                              ),
                            ),

                            // Close icon
                            IconButton(
                              onPressed: onClose,
                              icon: Icon(
                                Icons.close,
                                size: Constants.getFontMedium(context),
                                color: CustomColors.black87,
                              ),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(
                                minWidth: Responsive.value<double>(
                                  context,
                                  mobile: 32,
                                  tablet: 36,
                                  desktop: 40,
                                ),
                                minHeight: Responsive.value<double>(
                                  context,
                                  mobile: 32,
                                  tablet: 36,
                                  desktop: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Horizontal line
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: CustomColors.littleWhite,
                      ),

                      SizedBox(height: Constants.getSpacingLittle(context)),

                      // 2. Order Details Container
                      Container(
                        width: dialogWidth,
                        margin: EdgeInsets.only(bottom: Constants.getSpacingLittle(context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // "Order" title
                            Container(
                              width: dialogWidth - 65,
                              height: Responsive.value<double>(
                                context,
                                mobile: 20,
                                tablet: 22,
                                desktop: 24,
                              ),
                              margin: EdgeInsets.only(bottom: Constants.getSpacingSmall(context)),
                              child: Text(
                                'Order',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.getFontSmall(context),
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.darkPink,
                                ),
                              ),
                            ),

                            // Plan details row - Dynamic based on selected plan
                            Container(
                              width: dialogWidth,
                              height: Responsive.value<double>(
                                context,
                                mobile: 20,
                                tablet: 22,
                                desktop: 24,
                              ),
                              margin: EdgeInsets.only(bottom: Constants.getSpacingSmall(context)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Responsive.value<double>(
                                      context,
                                      mobile: 272,
                                      tablet: 292,
                                      desktop: 312,
                                    ),
                                    height: Responsive.value<double>(
                                      context,
                                      mobile: 20,
                                      tablet: 22,
                                      desktop: 24,
                                    ),
                                    child: Row(
                                      children: [
                                        // Plan name Text - DYNAMIC
                                        Container(
                                          width: Responsive.value<double>(
                                            context,
                                            mobile: 104,
                                            tablet: 110,
                                            desktop: 116,
                                          ),
                                          height: Constants.getFontLarge(context),
                                          child: Text(
                                            'PLAN $planName',
                                            style: TextStyle(
                                              fontFamily: Constants.primaryfont,
                                              fontSize: Constants.getFontSmall(context),
                                              color: CustomColors.black87,
                                            ),
                                          ),
                                        ),

                                        // "Paid annually" text
                                        Container(
                                          width: Responsive.value<double>(
                                            context,
                                            mobile: 84,
                                            tablet: 88,
                                            desktop: 92,
                                          ),
                                          height: Constants.getFontSmall(context),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Paid annually',
                                            style: TextStyle(
                                              fontFamily: Constants.primaryfont,
                                              fontSize: Constants.getFontLittle(context),
                                              color: CustomColors.littleWhite,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Price text with Kd span - DYNAMIC
                                  Container(
                                    width: Responsive.value<double>(
                                      context,
                                      mobile: 60,
                                      tablet: 65,
                                      desktop: 70,
                                    ),
                                    height: Responsive.value<double>(
                                      context,
                                      mobile: 20,
                                      tablet: 22,
                                      desktop: 24,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '$planPrice ', // Use dynamic planPrice
                                            style: TextStyle(
                                              fontFamily: Constants.primaryfont,
                                              fontSize: Constants.getFontSmall(context),
                                              fontWeight: FontWeight.bold,
                                              color: CustomColors.black87,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Kd',
                                            style: TextStyle(
                                              fontFamily: Constants.primaryfont,
                                              fontSize: Constants.getFontLittle(context),
                                              fontWeight: FontWeight.bold,
                                              color: CustomColors.littleWhite,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // ID Order row
                            Container(
                              width: dialogWidth,
                              height: Constants.getFontMedium(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Responsive.value<double>(
                                      context,
                                      mobile: 232,
                                      tablet: 242,
                                      desktop: 252,
                                    ),
                                    height: Constants.getFontMedium(context),
                                    child: Row(
                                      children: [
                                        // "ID Order" Text
                                        Container(
                                          width: Responsive.value<double>(
                                            context,
                                            mobile: 76,
                                            tablet: 80,
                                            desktop: 84,
                                          ),
                                          height: Responsive.value<double>(
                                            context,
                                            mobile: 32,
                                            tablet: 34,
                                            desktop: 36,
                                          ),
                                          child: Text(
                                            'ID ORDER',
                                            style: TextStyle(
                                              fontFamily: Constants.primaryfont,
                                              fontSize: Constants.getFontSmall(context),
                                              height: 1.0,
                                              letterSpacing: 0,
                                              color: const Color(0xFF34362D),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // "12345" text
                                  Container(
                                    width: Responsive.value<double>(
                                      context,
                                      mobile: 50,
                                      tablet: 55,
                                      desktop: 60,
                                    ),
                                    height: Constants.getFontLarge(context),
                                    child: Text(
                                      '12345',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontSize: Constants.getFontSmall(context),
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Horizontal line
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: CustomColors.littleWhite,
                      ),

                      SizedBox(height: Constants.getSpacingLittle(context)),

                      Container(
                        width: dialogWidth,
                        margin: EdgeInsets.only(bottom: Constants.getSpacingMedium(context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // "Detail Order" title
                            Container(
                              width: dialogWidth - 65,
                              height: Responsive.value<double>(
                                context,
                                mobile: 20,
                                tablet: 22,
                                desktop: 24,
                              ),
                              margin: EdgeInsets.only(bottom: Constants.getSpacingLittle(context)),
                              child: Text(
                                'Detail Order',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.getFontSmall(context),
                                  color: CustomColors.darkPink,
                                ),
                              ),
                            ),

                            // Reusable detail rows - DYNAMIC based on plan
                            _buildDetailRow(
                              context: context,
                              label: planName, // Use dynamic planName
                              value: '$planPrice Kd', // Use dynamic planPrice
                              isLast: false,
                            ),

                            _buildDetailRow(
                              context: context,
                              label: 'Tax',
                              value: '45 Kd',
                              isLast: false,
                            ),

                            _buildDetailRow(
                              context: context,
                              label: 'Total',
                              value: '${int.parse(planPrice) + 45} Kd', // Calculate total
                              isLast: true,
                            ),
                          ],
                        ),
                      ),

                      // Horizontal line
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: CustomColors.littleWhite,
                      ),

                      SizedBox(height: Constants.getSpacingLittle(context)),

                      // Payment Method Container
                      Container(
                        width: dialogWidth,
                        margin: EdgeInsets.only(bottom: Constants.getSpacingSmall(context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // "Payment Method Title"
                            Container(
                              width: dialogWidth - 65,
                              height: Constants.getFontMedium(context),
                              margin: EdgeInsets.only(bottom: Constants.getSpacingSmall(context)),
                              child: Text(
                                'Payment Method',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.getFontSmall(context),
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.darkPink,
                                ),
                              ),
                            ),

                            // Payment Images row
                            Container(
                              width: dialogWidth,
                              height: Constants.getFontMedium(context),
                              margin: EdgeInsets.only(bottom: Constants.getSpacingSmall(context)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Responsive.value<double>(
                                      context,
                                      mobile: 232,
                                      tablet: 242,
                                      desktop: 252,
                                    ),
                                    height: Constants.getFontMedium(context),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          height: Constants.getFontMedium(context),
                                          width: Responsive.value<double>(
                                            context,
                                            mobile: 120,
                                            tablet: 130,
                                            desktop: 140,
                                          ),
                                          Images.payment,
                                          fit: BoxFit.contain,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Check icon
                                  Container(
                                    width: Constants.getFontMedium(context),
                                    height: Constants.getFontMedium(context),
                                    child: Icon(
                                      Icons.check_circle,
                                      size: Constants.getFontMedium(context),
                                      color: CustomColors.darkPink,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Card details row
                            Container(
                              width: dialogWidth,
                              height: Constants.getFontMedium(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Responsive.value<double>(
                                      context,
                                      mobile: 220,
                                      tablet: 230,
                                      desktop: 240,
                                    ),
                                    height: Constants.getFontMedium(context),
                                    child: Row(
                                      children: [
                                        // Card icon
                                        Container(
                                          width: Constants.getFontMedium(context),
                                          height: Constants.getFontMedium(context),
                                          child: Icon(
                                            Icons.credit_card,
                                            size: Constants.getFontMedium(context),
                                            color: CustomColors.black87,
                                          ),
                                        ),

                                        SizedBox(width: Constants.getSpacingLittle(context)),

                                        // "Visa / Master" text
                                        Container(
                                          width: Responsive.value<double>(
                                            context,
                                            mobile: 136,
                                            tablet: 146,
                                            desktop: 156,
                                          ),
                                          height: Constants.getFontLarge(context),
                                          child: Text(
                                            'Visa / Master',
                                            style: TextStyle(
                                              fontFamily: Constants.primaryfont,
                                              fontSize: Responsive.value<double>(
                                                context,
                                                mobile: 20,
                                                tablet: 21,
                                                desktop: 22,
                                              ),
                                              color: CustomColors.black87,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Radio Button
                                  Container(
                                    width: Constants.getFontMedium(context),
                                    height: Constants.getFontMedium(context),
                                    decoration: BoxDecoration(
                                      color: CustomColors.littleWhite,
                                      borderRadius: BorderRadius.circular(
                                        Responsive.value<double>(
                                          context,
                                          mobile: 11.5,
                                          tablet: 12.5,
                                          desktop: 13.5,
                                        ),
                                      ),
                                      border: Border.all(
                                        color: CustomColors.blackBS1,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: Responsive.value<double>(
                                          context,
                                          mobile: 13,
                                          tablet: 14,
                                          desktop: 15,
                                        ),
                                        height: Responsive.value<double>(
                                          context,
                                          mobile: 13,
                                          tablet: 14,
                                          desktop: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          color: CustomColors.littleWhite,
                                          shape: BoxShape.circle,
                                        ),
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

                      DarKPinkButton(
                        text: 'CONFIRM PAYMENT',
                        onPressed: onConfirm,
                        width: dialogWidth,
                        height: Constants.getFontLarge(context),
                      ),

                      // Extra spacing for larger screens
                      if (isTablet || isDesktop)
                        SizedBox(height: Constants.getSpacingMedium(context)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable method for detail rows
Widget _buildDetailRow({
  required BuildContext context,
  required String label,
  required String value,
  bool isLast = false,
}) {
  final double rowWidth = Responsive.value<double>(
    context,
    mobile: 400,
    tablet: 450,
    desktop: 500,
  );

  return Container(
    width: rowWidth,
    height: Responsive.value<double>(
      context,
      mobile: 20,
      tablet: 22,
      desktop: 24,
    ),
    margin: EdgeInsets.only(bottom: isLast ? 0 : Constants.getSpacingLittle(context)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: Responsive.value<double>(
            context,
            mobile: 236.5,
            tablet: 256.5,
            desktop: 276.5,
          ),
          height: Responsive.value<double>(
            context,
            mobile: 20,
            tablet: 22,
            desktop: 24,
          ),
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: Responsive.value<double>(
                    context,
                    mobile: 120,
                    tablet: 130,
                    desktop: 140,
                  ),
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    fontFamily: Constants.primaryfont,
                    fontSize: Constants.getFontSmall(context),
                    color: CustomColors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),

        Container(
          constraints: BoxConstraints(
            maxWidth: Responsive.value<double>(
              context,
              mobile: 60,
              tablet: 65,
              desktop: 70,
            ),
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value.contains(' ')
                      ? value.split(' ')[0] + ' '
                      : value + ' ',
                  style: TextStyle(
                    fontFamily: Constants.primaryfont,
                    fontSize: Constants.getFontSmall(context),
                    fontWeight: FontWeight.bold,
                    color: CustomColors.black87,
                  ),
                ),
                if (value.contains('Kd'))
                  TextSpan(
                    text: 'Kd',
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.getFontLittle(context),
                      fontWeight: FontWeight.w600,
                      color: CustomColors.littleWhite,
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}