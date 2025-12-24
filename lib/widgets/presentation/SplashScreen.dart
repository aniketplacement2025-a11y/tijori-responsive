import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/titles.dart';
import '../../pages/others/custom_header_1.dart';
import '../../pages/others/logo_container.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to Onboarding after 3 seconds (reduced from 10 seconds for better UX)
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check device type for responsive adjustments
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Responsive logo size
    final double logoSize = Responsive.value<double>(
      context,
      mobile: 180.0,
      tablet: 250.0,
      desktop: 300.0,
    );

    // Responsive spacing
    final double spacingAfterLogo = Responsive.value<double>(
      context,
      mobile: Constants.getSpacingLarge(context),
      tablet: Constants.getSpacingLarge(context) * 1.2,
      desktop: Constants.getSpacingLarge(context) * 1.5,
    );

    return Scaffold(
      body: Container(
        // GRADIENT BACKGROUND - White to Light Blue
        width: Responsive.screenWidth(context),
        height: Responsive.screenHeight(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors.white,
              CustomColors.white,
              CustomColors.lightBlue,
              CustomColors.lightBlue,
            ],
            // Adjust gradient stops based on device type
            stops: Responsive.value<List<double>>(
              context,
              mobile: [0.0, 0.4, 0.6, 1.0],
              tablet: [0.0, 0.35, 0.55, 1.0],
              desktop: [0.0, 0.3, 0.5, 1.0],
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header at top - Now responsive
              CustomHeader1(
                title: Titles.header_title,
                flagAsset: Images.flagAsset,
                // Add responsive properties if CustomHeader1 supports them
                // isMobile: isMobile,
                // isTablet: isTablet,
              ),

              // Spacer to push content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Tijori + Logo centered with responsive size
                    LogoContainer(
                      width: logoSize,
                      height: logoSize * 1.05, // Maintain aspect ratio
                      logoAsset: Images.logoAsset,
                      // If LogoContainer has responsive features, use them:
                      // isMobile: isMobile,
                    ),

                    // Responsive spacing
                    SizedBox(height: spacingAfterLogo),

                    // Optional: Loading indicator for better UX
                    if (isTablet || isDesktop)
                      Padding(
                        padding: EdgeInsets.only(top: Constants.getSpacingMedium(context)),
                        child: _buildLoadingIndicator(context),
                      ),
                  ],
                ),
              ),

              // Optional: Footer text for desktop/tablet
              if (isDesktop || isTablet)
                Padding(
                  padding: EdgeInsets.only(
                    bottom: Constants.getSpacingLarge(context),
                  ),
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: Constants.getFontLittle(context),
                      color: CustomColors.black87.withOpacity(0.6),
                      fontFamily: Constants.primaryfont,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for loading indicator
  Widget _buildLoadingIndicator(BuildContext context) {
    return SizedBox(
      width: Responsive.value<double>(
        context,
        mobile: 40,
        tablet: 50,
        desktop: 60,
      ),
      height: Responsive.value<double>(
        context,
        mobile: 40,
        tablet: 50,
        desktop: 60,
      ),
      child: CircularProgressIndicator(
        strokeWidth: Responsive.value<double>(
          context,
          mobile: 3.0,
          tablet: 4.0,
          desktop: 5.0,
        ),
        valueColor: AlwaysStoppedAnimation<Color>(CustomColors.gradientBlue),
        backgroundColor: CustomColors.white.withOpacity(0.3),
      ),
    );
  }
}