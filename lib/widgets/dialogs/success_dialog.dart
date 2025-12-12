import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/dart_pink_button.dart';
import 'package:vkaps_it_solution_project_tijori/utils/Images.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';

class SuccessDialog extends StatelessWidget {
  final double initialHeight;
  final VoidCallback onComplete;
  final String imageAsset;
  final String title;
  final String subtitle;
  final String buttonText;
  final double? width;
  final double? height;
  final bool showCloseButton;

  const SuccessDialog({
    super.key,
    required this.initialHeight,
    required this.onComplete,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    this.buttonText = 'CONTINUE',
    this.width = 250,
    this.height = 52,
    this.showCloseButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: initialHeight),
      child: Container(
        height: Responsive.screenHeight(context) * 0.6,
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
          ],
        ),
        child: Stack(
          children: [
            // Close button (optional)
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

            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: Constants.spacingMedium),

                  // Image
                  Container(
                    width: 238,
                    height: 156,
                    child: Image.asset(
                      imageAsset,
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
                      title,
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
                    height: Constants.fontMedium,
                    margin: EdgeInsets.only(bottom: Constants.spacingSmall),
                    child: Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.fontSmall,
                        color: Colors.black87,
                      ),
                    ),
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