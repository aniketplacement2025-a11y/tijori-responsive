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
    return Padding(
        padding: const EdgeInsets.only(top: 220),
        child: Container(
          height: Responsive.screenHeight(context)*0.7,
          // Takes half screen from center to bottom

          decoration: BoxDecoration(
            color: CustomColors.ghostWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: CustomColors.blackBS1,
                blurRadius: 20,
                offset: Offset(0,-5),
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
                       topLeft: Radius.circular(16),
                       topRight: Radius.circular(16),
                     ),
                   ),
                   padding: EdgeInsets.all(Constants.spacingSmall),
                   child: Column(
                     crossAxisAlignment: .start,
                     children: [
                       // Header Container
                       Container(
                        width: 400,
                         height: 28,
                         margin: EdgeInsets.only(
                           bottom: Constants.spacingSmall
                         ),
                         child: Row(
                           mainAxisAlignment: .spaceBetween,
                           children: [

                             // "Payment details" text
                             Container(
                               width: 194,
                               height: 28,
                                child: Text(
                                  'Payment details',
                                  style: TextStyle(
                                    fontFamily: Constants.primaryfont,
                                    fontSize: Constants.fontMedium,
                                    fontWeight: .bold,
                                    color: CustomColors.black87,
                                  ),
                                ),
                             ),

                             // Close icon
                             IconButton(
                                 onPressed: onClose,
                                 icon: Icon(
                                   Icons.close,
                                   size: Constants.fontMedium,
                                   color: CustomColors.black87,
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

                       SizedBox(height: Constants.spacingLittle),


                       // 2. Order Details Container
                       Container(
                         width: 400,
                         margin: EdgeInsets.only(bottom: Constants.spacingLittle),
                         child: Column(
                           crossAxisAlignment: .start,
                           children: [
                             // "Order" title
                             Container(
                               width: 335,
                               height: 20,
                               margin: EdgeInsets.only(bottom: Constants.spacingSmall),
                               child: Text(
                                 'Order',
                                 style: TextStyle(
                                   fontFamily: Constants.primaryfont,
                                   fontSize: Constants.fontSmall,
                                   fontWeight: .bold,
                                   color: CustomColors.darkPink,
                                 ),
                               ),
                             ),

                            // Plan details row - Dynamic based on selected plan
                             Container(
                               width: 400,
                               height: 20,
                               margin:  EdgeInsets.only(bottom: Constants.spacingSmall),
                               child: Row(
                                 mainAxisAlignment: .spaceBetween,
                                 children: [
                                   Container(
                                     width: 272,
                                     height: 20,
                                     child: Row(
                                       children: [
                                         // Plan name Text -  DYNAMIC
                                         Container(
                                           width: 104,
                                           height: Constants.fontLarge,
                                           child: Text(
                                             'PLAN $planName',
                                             style: TextStyle(
                                               fontFamily: Constants.primaryfont,
                                               fontSize: Constants.fontSmall,
                                               color: CustomColors.black87,
                                             ),
                                           ),
                                         ),

                                         // "Paid annually" text
                                         Container(
                                           width: 84,
                                           height: Constants.fontSmall,
                                           alignment: .bottomLeft,
                                           child: Text(
                                             'Paid annually',
                                             style: TextStyle(
                                               fontFamily: Constants.primaryfont,
                                               fontSize: Constants.fontLittle,
                                               color: CustomColors.littleWhite,
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),


                                   // Pprice text with Kd span - DYNAMIC
                                   Container(
                                     width: 60,
                                     height: 20,
                                     child: RichText(
                                         text: TextSpan(
                                           children: [
                                             TextSpan(
                                               text: '$planPrice ', // Use dynamic planPrice
                                               style: TextStyle(
                                                 fontFamily: Constants.primaryfont,
                                                 fontSize: Constants.fontSmall,
                                                 fontWeight: FontWeight.bold,
                                                 color: CustomColors.black87,
                                               ),
                                             ),
                                             TextSpan(
                                               text: 'Kd',
                                               style: TextStyle(
                                                 fontFamily: Constants.primaryfont,
                                                 fontSize: Constants.fontLittle,
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
                               width: 400,
                               height: Constants.fontMedium,
                               child: Row(
                                 mainAxisAlignment: .spaceBetween,
                                 children: [
                                   Container(
                                     width: 232,
                                       height: Constants.fontMedium,
                                     child: Row(
                                       children: [
                                         // "ID Order" Text
                                         Container(
                                           width: 76,
                                           height: 32,
                                           child: Text(
                                             'ID ORDER',
                                             style: TextStyle(
                                               fontFamily: Constants.primaryfont,
                                               fontSize: Constants.fontSmall,
                                               height: 1.0,
                                               letterSpacing: 0,
                                               color: Color(0xFF34362D),
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),

                                   // "12345" text
                                   Container(
                                     width: 50,
                                     height: Constants.fontLarge,
                                     child: Text(
                                       '12345',
                                       style: TextStyle(
                                         fontFamily: Constants.primaryfont,
                                         fontSize: Constants.fontSmall,
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

                       SizedBox(height: Constants.spacingLittle),

                       Container(
                         width: 400,
                         margin: EdgeInsets.only(bottom: Constants.spacingMedium),
                         child: Column(
                           crossAxisAlignment: .start,
                           children: [
                             // "Detail Order" title
                             Container(
                               width: 335,
                               height: 20,
                               margin: EdgeInsets.only(bottom: Constants.spacingLittle),
                               child: Text(
                                 'Detail Order',
                                 style: TextStyle(
                                   fontFamily: Constants.primaryfont,
                                   fontWeight: .bold,
                                   fontSize: Constants.fontSmall,
                                   color: CustomColors.darkPink,
                                 ),
                               ),
                             ),

                             // Reusable detail rows - DYNAMIC based on plan
                             _buildDetailRow(
                               label: planName, // Use dynamic planName
                               value: '$planPrice Kd', // Use dynamic planPrice
                               isLast: false,
                             ),

                             _buildDetailRow(
                               label: 'Tax',
                               value: '45 Kd',
                               isLast: false,
                             ),

                             _buildDetailRow(
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

                       SizedBox(height: Constants.spacingLittle),

                       // Payment Method Container
                       Container(
                         width: 400,
                         margin: EdgeInsets.only(bottom: Constants.spacingSmall),
                         child: Column(
                           crossAxisAlignment: .start,
                           children: [

                             // "Payment Method Title"
                             Container(
                               width: 335,
                               height: Constants.fontMedium,
                               margin: EdgeInsets.only(bottom: Constants.spacingSmall),
                               child: Text(
                                 'Payment Method',
                                 style: TextStyle(
                                   fontFamily: Constants.primaryfont,
                                   fontSize: Constants.fontSmall,
                                   fontWeight: FontWeight.bold,
                                   color: CustomColors.darkPink,
                                 ),
                               ),
                             ),


                             // Payment Images row
                             Container(
                               width: 400,
                               height: Constants.fontMedium,
                               margin: EdgeInsets.only(bottom: Constants.spacingSmall),
                               child: Row(
                                 mainAxisAlignment: .spaceBetween,
                                 children: [
                                   Container(
                                     width: 232,
                                     height: Constants.fontMedium,
                                     child: Row(
                                       children: [

                                         Image.asset(
                                           height: Constants.fontMedium,
                                           width: 120,
                                           Images.payment,
                                           fit: BoxFit.contain,
                                         ),
                                       ],
                                     ),
                                   ),

                                   // Check icon
                                   Container(
                                     width: Constants.fontMedium,
                                     height: Constants.fontMedium,
                                     child: Icon(
                                       Icons.check_circle,
                                       size: Constants.fontMedium,
                                       color: CustomColors.darkPink,
                                     ),
                                   ),
                                 ],
                               ),
                             ),

                             // Card details row
                             Container(
                               width: 400,
                               height: Constants.fontMedium,
                               child: Row(
                                 mainAxisAlignment: .spaceBetween,
                                 children: [

                                   Container(
                                    width: 220,
                                    height: Constants.fontMedium,
                                     child: Row(
                                       children: [
                                         // Card icon
                                         Container(
                                           width: Constants.fontMedium,
                                           height: Constants.fontMedium,
                                            child: Icon(
                                              Icons.credit_card,
                                              size: Constants.fontMedium,
                                              color: CustomColors.black87,
                                            ),
                                         ),

                                         SizedBox(width: Constants.spacingLittle),

                                         // "Visa / Master" text
                                         Container(
                                           width: 136,
                                           height: Constants.fontLarge,
                                           child: Text(
                                             'Visa / Master',
                                             style: TextStyle(
                                               fontFamily: Constants.primaryfont,
                                               fontSize: 20,
                                               color: CustomColors.black87,
                                             ),
                                           ),
                                         ),
                                       ],
                                    ),
                                   ),


                                   // Radio Button
                                   Container(
                                     width: Constants.fontMedium,
                                     height: Constants.fontMedium,
                                     decoration: BoxDecoration(
                                       color: CustomColors.littleWhite,
                                       borderRadius: BorderRadius.circular(11.5),
                                       border: Border.all(
                                         color: CustomColors.blackBS1,
                                         width: 1,
                                       ),
                                     ),
                                     child: Center(
                                       child: Container(
                                         width: 13,
                                         height: 13,
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

                       SizedBox(height: Constants.spacingSmall),

                       DarKPinkButton(
                         text: 'CONFIRM PAYMENT',
                         onPressed: onConfirm,
                         width: 400,
                         height: Constants.fontLarge,
                       ),

                     ],
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
 required String label,
 required String value,
 bool isLast = false,
}){
  return Container(
    width: 400,
    height: 20,
    margin: EdgeInsets.only(bottom: isLast ? 0 : Constants.spacingLittle),
    child: Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Container(
          width: 236.5,
          height: 20,
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 120),
                child: Text(
                  label,
                  style: TextStyle(
                    fontFamily: Constants.primaryfont,
                    fontSize: Constants.fontSmall,
                    color: CustomColors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),

        Container(
          constraints: BoxConstraints(maxWidth: 60),
          child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                   text: value.contains(' ')
                    ? value.split(' ')[0] + ' '
                    : value + ' ',
                  style: TextStyle(
                   fontFamily: Constants.primaryfont,
                   fontSize: Constants.fontSmall,
                   fontWeight: FontWeight.bold,
                   color: CustomColors.black87,
                  ),
                ),
                  if (value.contains('Kd'))
                    TextSpan(
                      text: 'Kd',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.fontLittle,
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