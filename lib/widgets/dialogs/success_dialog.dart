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
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants
    Constants.updateFromContext(context);

    // Responsive dimensions
    final double dialogHeight = Responsive.screenHeight(context) * 0.4;

    final double imageWidth = Responsive.value<double>(
      context,
      mobile: 260,
      tablet: 280,
      desktop: 320,
    );

    final double imageHeight = Responsive.value<double>(
      context,
      mobile: 172,
      tablet: 184,
      desktop: 210,
    );

    final double contentWidth = Responsive.value<double>(
      context,
      mobile: 420,
      tablet: 450,
      desktop: 500,
    );

    final double subtitleWidth = Responsive.value<double>(
      context,
      mobile: 335,
      tablet: 380,
      desktop: 425,
    );

    return Padding(
      padding: EdgeInsets.only(top: initialHeight),
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
            // Close button (optional)
            if (showCloseButton)
              Positioned(
                top: Constants.getSpacingSmall(context),
                right: Constants.getSpacingMedium(context),
                child: GestureDetector(
                  onTap: onComplete,
                  child: Container(
                    width: Responsive.value<double>(
                      context,
                      mobile: 40,
                      tablet: 44,
                      desktop: 48,
                    ),
                    height: Responsive.value<double>(
                      context,
                      mobile: 40,
                      tablet: 44,
                      desktop: 48,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: Responsive.value<double>(
                            context,
                            mobile: 5,
                            tablet: 6,
                            desktop: 7,
                          ),
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.close,
                      size: Responsive.value<double>(
                        context,
                        mobile: 24,
                        tablet: 26,
                        desktop: 28,
                      ),
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),

            // Main content
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Constants.getSpacingMedium(context)),

                    // Image
                    Container(
                      width: imageWidth,
                      height: imageHeight,
                      child: Image.asset(
                        imageAsset,
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(height: Constants.getSpacingSmall(context)),

                    // Title
                    Container(
                      width: contentWidth,
                      height: Constants.getFontLarge(context),
                      margin: EdgeInsets.only(bottom: Constants.getSpacingLittle(context)),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontWeight: FontWeight.bold,
                          fontSize: Constants.getFontMedium(context),
                          color: CustomColors.black87,
                        ),
                      ),
                    ),

                    SizedBox(height: Constants.getSpacingLittle(context)),

                    // Subtitle
                    Container(
                      width: subtitleWidth,
                      height: Constants.getFontMedium(context),
                      margin: EdgeInsets.only(bottom: Constants.getSpacingSmall(context)),
                      child: Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontSize: Constants.getFontSmall(context),
                          color: CustomColors.black87.withOpacity(0.8),
                        ),
                      ),
                    ),

                    SizedBox(height: Constants.getSpacingMedium(context)),

                    // Button
                    DarKPinkButton(
                      text: buttonText,
                      onPressed: onComplete,
                      width: Responsive.value<double>(
                        context,
                        mobile: width ?? 250,
                        tablet: (width ?? 250) * 1.1,
                        desktop: (width ?? 250) * 1.2,
                      ),
                      height: Responsive.value<double>(
                        context,
                        mobile: height ?? 52,
                        tablet: (height ?? 52) * 1.05,
                        desktop: (height ?? 52) * 1.1,
                      ),
                    ),

                    // Extra spacing for larger screens
                    if (isTablet || isDesktop)
                      SizedBox(height: Constants.getSpacingLarge(context)),
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