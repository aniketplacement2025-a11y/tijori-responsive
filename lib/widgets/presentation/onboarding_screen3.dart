import 'package:flutter/material.dart';

import '../../pages/others/custom_header_1.dart';
import '../../pages/others/logo_container.dart';
import '../../utils/Images.dart';
import '../../utils/onboarding_background.dart';
import '../../utils/responsive_media_query.dart';
import '../../utils/titles.dart';

class OnboardingScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = Responsive.screenWidth(context);
    final double screenHeight = Responsive.screenHeight(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    final double baseWidth = 375.0;
    final double baseHeight = 812.0;
    final double widthScale = screenWidth / baseWidth;
    final double heightScale = screenHeight / baseHeight;
    final double scale = widthScale < heightScale ? widthScale : heightScale;
    final double limitedScale = (isTablet || !isMobile)
        ? (scale > 1.2 ? 1.2 : scale)
        : scale;

    double scaled(double value) => value * scale;

    return OnboardingBackground(
      child: Stack(
        children: [
          // Background cloud images
          Positioned(
            left: -scaled(180) * limitedScale,
            top: scaled(116) * limitedScale,
            child: Image.asset(
              Images.bg_removal,
              width: scaled(700) * limitedScale,
              height: scaled(445) * limitedScale,
              fit: BoxFit.contain,
            ),
          ),

          // Cloud 1
          Positioned(
            left: -scaled(50) * limitedScale,
            top: scaled(280) * limitedScale,
            child: Image.asset(
              Images.cloud1,
              width: scaled(339) * limitedScale,
              height: scaled(226) * limitedScale,
              fit: BoxFit.contain,
            ),
          ),

          // Cloud 2
          Positioned(
            left: scaled(100) * limitedScale,
            top: scaled(148) * limitedScale,
            child: Image.asset(
              Images.cloud2,
              width: scaled(339) * limitedScale,
              height: scaled(226) * limitedScale,
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

          // Rotated Small Logo
          Positioned(
            left: scaled(120) * limitedScale,
            top: scaled(280) * limitedScale,
            child: Transform.rotate(
              angle: 0.0951,
              child: LogoContainer(
                width: scaled(66.10) * limitedScale,
                height: scaled(69.56) * limitedScale,
                logoAsset: Images.logoAsset,
              ),
            ),
          ),

          // Title & Description for this page
        ],
      ),
    );
  }
}