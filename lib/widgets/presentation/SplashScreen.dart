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

    // Navigate to Onboarding after 3 seconds
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: CustomColors.lightBlue,
      body: Container(
        // GRADIENT BACKGROUND - White to Light Blue
        width: Responsive.screenWidth(context),
        height: Responsive.screenHeight(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors.white, // White at top
              CustomColors.white, // White in middle
              CustomColors.lightBlue, // Start blue around logo
              CustomColors.lightBlue, // Light blue at bottom
            ],
            // 0.0 = top, 1.0 = bottom
            stops: [
              0.0,
              0.4,
              0.6,
              1.0,
            ], // Adjust these values to match your design
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header at top
              CustomHeader1(
                title: Titles.header_title,
                flagAsset: Images.flagAsset,
              ),
              // SizedBox(height: Constants.spacingMedium),
              // Spacer to push content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tijori + Logo centered
                    LogoContainer(
                      width: 200,
                      height: 210,
                      logoAsset: Images.logoAsset,
                    ),
                    SizedBox(height: Constants.spacingLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
