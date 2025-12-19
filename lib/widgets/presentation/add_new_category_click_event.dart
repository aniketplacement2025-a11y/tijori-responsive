import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/gradient_button.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';

import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../material/positioned_header_back_icon.dart';

class AddNewCategoryClickEvent extends StatelessWidget {

  TextEditingController controller = TextEditingController();

   AddNewCategoryClickEvent({
     super.key
   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBackground(
          child: Stack(
            children: [

              // Header Fixed at top
              PositionedHeaderBackIcon(
                context: context,
                top: 20,
                left: 4,
                right: 0,
                onBackPressed: () {
                  print('Custom back action');
                  Navigator.pop(context);
                },
                onReminderPressed: () {
                  print('Custom reminder action');
                  // Show reminder dialog
                },
              ),

        // Title + SubTitle Box
        Positioned(
            top: 72,
            left: 10,
            right: 10,
            child: Container(
              alignment: .center,
              padding: EdgeInsets.only(
                top: 20,
                right: 10,
                bottom: 20,
                left: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: .circular(16),
                border: Border.all(color: CustomColors.black87, width: 1),
              ),
              child: SizedBox(
                height: 22,
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    SizedBox(width: Constants.spacingMedium),

                    // Icon/Image
                    Container(
                      width: Constants.fontMedium,
                      height: Constants.fontMedium,
                      child: Image.asset(
                        Images.new_category,
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(width: Constants.spacingSmall),

                    // Bucket Text
                    SizedBox(
                      width: 240,
                      height: Constants.fontSmall,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'New Category :',
                              style: TextStyle(
                                fontFamily: Constants.primaryfont,
                                fontSize: Constants.fontSmall,
                                color: CustomColors.black87,
                              ),
                            ),
                            TextSpan(
                              text: ' Medicine use',
                              style: TextStyle(
                                fontFamily: Constants.primaryfont,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ),

              // "Create the form" Text
              Positioned(
                top: 156,
                 right: 5,
                  left: 5,
                  bottom: 10,
                  child: Container(
                    width: double.infinity,
                   margin: EdgeInsets.only(bottom: 2),
                   padding: EdgeInsets.all(2),
                   decoration: BoxDecoration(
                     color: Colors.transparent,
                     borderRadius: .circular(8),
                   ),
                   child: Column(
                     crossAxisAlignment: .start,
                     children: [

                       // Left: Title
                       Flexible(
                         // Use Flexible instead of fixed width
                           child: Container(
                             constraints: BoxConstraints(maxWidth: 148),
                             child: Text(
                               'Create the form',
                               style: TextStyle(
                                 fontFamily: Constants.primaryfont,
                                 fontSize: 18,
                                 fontWeight: .bold,
                                 color: CustomColors.black87,
                               ),
                             ),
                           ),
                       ),

                       SizedBox(height: Constants.spacingLittle),

                       // "To use in this category and create new Bucket" text
                       Container(
                         width: double.infinity,
                         child: Text(
                           'To use in this category and create new Bucket',
                           style: TextStyle(
                             fontFamily: Constants.primaryfont,
                             fontSize: Constants.fontLittle,
                             fontWeight: .w500,
                             color: CustomColors.littleWhite,
                           ),
                         ),
                       ),

                       SizedBox(height: Constants.spacingLittle),

                       // Create Field
                       Row(
                         crossAxisAlignment:
                         CrossAxisAlignment.center,
                         mainAxisAlignment:
                         .center,
                         children: [

                           Material(
                             color: Colors.transparent,
                             child: GestureDetector(
                               onTap: () {
                                 print("Clicked on Add New Bucket");
                               },
                               child: Container(
                                 height: 36,
                                 constraints: BoxConstraints(
                                   maxWidth: 150,
                                 ),
                                 padding: EdgeInsets.symmetric(
                                   horizontal: Constants.fontLittle,
                                   vertical: Constants.spacingLittle,
                                 ),
                                 decoration: BoxDecoration(
                                   color: CustomColors.blackBS1,
                                   borderRadius:
                                   BorderRadius.circular(
                                     Constants.spacingMedium,
                                   ),
                                   boxShadow: [
                                     BoxShadow(
                                       color: CustomColors.blackBS1,
                                       blurRadius: 4,
                                       offset: Offset(0, 2),
                                     ),
                                   ],
                                 ),
                                 child: Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.center,
                                   mainAxisSize: MainAxisSize.min,
                                   children: [
                                     Container(
                                       width: Constants.fontLittle,
                                       height: Constants.fontLittle,
                                       child: Image.asset(
                                         Images.plusIcon,
                                         fit: BoxFit.contain,
                                       ),
                                     ),
                                     SizedBox(
                                       width:
                                       Constants.spacingLittle,
                                     ),
                                     Text(
                                       'Create Field',
                                       style: TextStyle(
                                         fontFamily:
                                         Constants.primaryfont,
                                         fontSize:
                                         Constants.spacingSmall,
                                         fontWeight: FontWeight.bold,
                                         color: CustomColors.black87,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),

                       SizedBox(height: Constants.spacingMedium),

                       CustomFormField(
                         label: 'Name of the medicine',
                         hintText: 'Enter the name of the medicine',
                         controller: controller,
                       ),

                       SizedBox(height: Constants.spacingLittle),

                       GradientButton(
                           text: 'Add My Appointments',
                           onPressed: (){
                             print('CLICKED ON Add My Appointments');
                           },
                           width: 400,
                       ),

                     ],
                   ),
                  ),
              ),

            ],
          )
      ),
    );
  }
}
