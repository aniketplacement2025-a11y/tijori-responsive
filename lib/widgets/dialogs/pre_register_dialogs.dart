import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';

class PreRegisterDialog extends StatelessWidget {
  final Function(String) onUserTypeSelected;

  const PreRegisterDialog({super.key, required this.onUserTypeSelected});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for proportional scaling
    final double screenWidth = Responsive.screenWidth(context);
    final double screenHeight = Responsive.screenHeight(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    // Base design dimensions (from original design - roughly 375x812 mobile)
    final double baseWidth = 375.0;
    final double baseHeight = 812.0;

    // Scaling factors
    final double widthScale = screenWidth / baseWidth;
    final double heightScale = screenHeight / baseHeight;
    final double scale = widthScale < heightScale ? widthScale : heightScale;

    // Scale all values proportionally
    double scaled(double value) => value * scale;

    // For tablet/desktop, limit maximum scaling
    final double limitedScale = (isTablet || !isMobile)
        ? (scale > 1.2 ? 1.2 : scale)
        : scale;

    // Calculate top padding as percentage of screen height
    final double topPadding = screenHeight * 0.48;

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Container(
        height: screenHeight * 0.64,
        decoration: BoxDecoration(
          color: CustomColors.ghostWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(scaled(30) * limitedScale),
            topRight: Radius.circular(scaled(30) * limitedScale),
          ),
          boxShadow: [
            BoxShadow(
              color: CustomColors.blackBS1,
              blurRadius: scaled(20) * limitedScale,
              offset: Offset(0, -scaled(5) * limitedScale),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Drag handle - CENTERED
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(
                  top: scaled(8) * limitedScale,
                  bottom: scaled(4) * limitedScale,
                ),
                width: scaled(40) * limitedScale,
                height: scaled(5) * limitedScale,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(scaled(10) * limitedScale),
                ),
              ),
            ),

            // Close button positioned at top right
            Positioned(
              right: scaled(16) * limitedScale,
              top: scaled(8) * limitedScale,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close),
                iconSize: Constants.getFontMedium(context) * limitedScale,
                color: CustomColors.black87,
                padding: EdgeInsets.all(scaled(4) * limitedScale),
              ),
            ),

            // Person Logo - PERFECTLY CENTERED USING ALIGN
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: scaled(28) * limitedScale),
                child: Image.asset(
                  Images.person_logo,
                  width: screenWidth * 1.2, // Takes 80% of screen width
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Bottom Content Section with buttons
            Positioned(
              left: scaled(16) * limitedScale, // Use scaled values for consistency
              right: scaled(16) * limitedScale,
              bottom: scaled(16) * limitedScale,
              child: Container(
                height: scaled(48) * limitedScale,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left Button - "PERSONAL USER"
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: scaled(8) * limitedScale),
                        height: scaled(48) * limitedScale,
                        decoration: BoxDecoration(
                          color: CustomColors.gradientBlue,
                          borderRadius: BorderRadius.circular(scaled(12) * limitedScale),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.blackBS1,
                              blurRadius: scaled(5) * limitedScale,
                              offset: Offset(0, scaled(2) * limitedScale),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            print('PRESSED ON PERSONAL BUTTON');
                            onUserTypeSelected('personal');
                          },
                          child: Text(
                            'PERSONAL USER',
                            style: TextStyle(
                              fontSize: Constants.getFontLittle(context) * limitedScale,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.ghostWhite,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Right Button - "COMMERCIAL USER"
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: scaled(8) * limitedScale),
                        height: scaled(48) * limitedScale,
                        decoration: BoxDecoration(
                          color: CustomColors.black87,
                          borderRadius: BorderRadius.circular(scaled(12) * limitedScale),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.blackBS1,
                              blurRadius: scaled(5) * limitedScale,
                              offset: Offset(0, scaled(2) * limitedScale),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            print("PRESSED COMMERCIAL BUTTON");
                            onUserTypeSelected('commercial');
                          },
                          child: Text(
                            'COMMERCIAL USER',
                            style: TextStyle(
                              fontSize: Constants.getFontLittle(context) * limitedScale,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.ghostWhite,
                            ),
                          ),
                        ),
                      ),
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