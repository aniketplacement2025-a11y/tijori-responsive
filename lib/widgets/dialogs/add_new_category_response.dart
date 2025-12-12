import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';

import '../../pages/others/dart_pink_button.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';

class AddNewCategoryResponse extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onComplete;
  final String buttonText;
  final double? width;
  final double? height;
  final bool showCloseButton;

  const AddNewCategoryResponse({
    super.key,
    required this.onComplete,
    required this.controller,
    this.buttonText = 'CONTINUE',
    this.width = 250,
    this.height = 52,
    this.showCloseButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 200),
      child: Container(
        height: Responsive.screenHeight(context)*0.7,
        decoration: BoxDecoration(
          color: CustomColors.ghostWhite,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: CustomColors.blackBS1,
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ]
        ),
        child: Stack(
          children: [
            // Close Button (optional)
            if (showCloseButton)
              Positioned(
                top: Constants.spacingSmall,
                right: Constants.spacingMedium,
                child: GestureDetector(
                  onTap: onComplete,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),

             // Main Content
            Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  SizedBox(height: Constants.spacingLittle),

                  // Image
                  Container(
                    width: 238,
                    height: 156,
                    child: Image.asset(
                      Images.new_category,
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: Constants.spacingSmall),

                  // Title
                  Container(
                    width: 400,
                    height: Constants.fontLarge,
                    margin: EdgeInsets.only(bottom: Constants.spacingLittle),
                    child: Text(
                      'Add a New Category',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.fontMedium,
                        color: CustomColors.black87,
                      ),
                    ),
                  ),

                  SizedBox(height: Constants.spacingLittle),

                  // Subtitle
                  Container(
                    width: 335,
                    height: Constants.fontLarge,
                    margin: EdgeInsets.only(bottom: Constants.spacingSmall),
                    child: Text(
                      'Add a New Category to your list and manage better your Buckets',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.fontLittle,
                        color: CustomColors.black87,
                      ),
                    ),
                  ),

                  SizedBox(height: Constants.spacingSmall),

                  CustomFormField(
                    label: 'New Category',
                    hintText: 'Name the new category',
                    controller: controller,
                  ),

                  SizedBox(height: Constants.spacingSmall),

                  // Button
                  DarKPinkButton(
                    text: buttonText,
                    onPressed: onComplete,
                    width: width ?? 250,
                    height: height ?? 52,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
