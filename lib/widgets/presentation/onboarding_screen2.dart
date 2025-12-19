import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';

import '../../pages/others/custom_header_1.dart';
import '../../pages/others/logo_container.dart';
import '../../utils/Images.dart';
import '../../utils/responsive_media_query.dart';
import '../../utils/titles.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double screenWidth = Responsive.screenWidth(context);
    final double screenHeight = Responsive.screenHeight(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    // Base design dimensions (from original design)
    final double baseWidth = 375.0;
    final double baseHeight = 812.0;

    // Scaling factors
    final double widthScale = screenWidth / baseWidth;
    final double heightScale = screenHeight / baseHeight;
    final double scale = widthScale < heightScale ? widthScale : heightScale;

    // Limit maximum scaling for larger screens
    final double limitedScale = (isTablet || !isMobile)
        ? (scale > 1.2 ? 1.2 : scale)
        : scale;

    // Scale function
    double scaled(double value) => value * limitedScale;

    // For Girl image - Use percentage of screen width instead of fixed right value
    final double girlRightOffset = screenWidth * 0.12; // 15% from right
    final double girlTopOffset = scaled(212); // Scale the top position

    // For Clouds - Use percentage of screen width instead of fixed left value
    final double cloudsLeftOffset = screenWidth * 0.12; // 15% from left
    final double cloudsBottomOffset = scaled(180); // Scale the bottom position

    return OnboardingBackground(
        child: Stack(
          children: [

            // Background Girl image - USING PERCENTAGE POSITIONING
            Positioned(
              right: girlRightOffset,
              top: girlTopOffset,
              child: Image.asset(
                Images.girl,
                height: scaled(320),
                fit: BoxFit.contain,
              ),
            ),

            // Clouds - USING PERCENTAGE POSITIONING
            Positioned(
              left: cloudsLeftOffset,
              bottom: cloudsBottomOffset,
              child: Image.asset(
                Images.Clouds,
                width: scaled(280),
                fit: BoxFit.contain,
              ),
            ),

            // Custom Header 1
            Positioned(
              top: isMobile ? scaled(0) : scaled(10),
              left: 0,
              right: 0,
              child: Center(
                child: CustomHeader1(
                  title: Titles.header_title,
                  flagAsset: Images.flagAsset,
                ),
              ),
            ),

            // Main Logo Container
            Positioned(
              top: scaled(60) * limitedScale,
              left: 0,
              right: 0,
              child: Center(
                child: LogoContainer(
                  width: scaled(100) * limitedScale,
                  height: scaled(105) * limitedScale,
                  logoAsset: Images.logoAsset,
                ),
              ),
            ),

          ],
        )
    );
  }
}
