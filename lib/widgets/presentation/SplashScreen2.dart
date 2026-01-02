import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/signin_login_page.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/pre_register_controller.dart';
import 'package:vkaps_it_solution_project_tijori/services/functions/storage_area_of_access_token.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import '../../pages/official_landing_page.dart';
import '../../utils/onboarding_background.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/titles.dart';
import '../../pages/others/custom_header_1.dart';
import '../../pages/others/logo_container.dart';
import 'onboarding_screen.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>{
  late PreRegisterController _controller;
  bool isCommercial = false;

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 1), (){
      checkTokenAndRedirect();
    });
    _controller = PreRegisterController(context);
  }

  void checkTokenAndRedirect() {
    print('redirection: ${StorageAreaOfAccessToken.instance.getToken()}');
    print('User Role: ${StorageAreaOfAccessToken.instance.getRole()}');
    // Check if token exists and is not empty
    String token = StorageAreaOfAccessToken.instance.getToken();
    String role = StorageAreaOfAccessToken.instance.getRole();

    if(token.isEmpty || token == "") {}
    else {
      // Token exists, go to main app screen (NOT SplashScreen2 again!)
      if(role == "COMMERCIAL_USER".trim()) {
        isCommercial = true;
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OfficialLandingPage(
          isCommercial: isCommercial,
        )), // Or your main home page
      );
    }
  }

  @override
  Widget build(BuildContext context){
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
    // Use the smaller scale to maintain proportions without overflow
    final double scale = widthScale < heightScale ? widthScale : heightScale;

    // Scale all values proportionally
    double scaled(double value) => value * scale;

    // For tablet/desktop, limit maximum scaling to 1.2x to prevent huge elements
    final double limitedScale = (isTablet || !isMobile)
        ? (scale > 1.2 ? 1.2 : scale)
        : scale;

    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // Custom Header 1 - SCALED PROPORTIONALLY
            Positioned(
              top: isMobile ? scaled(0) : scaled(10),
              right: 22,
              left: 0,
              child: Center(
                child: CustomHeader1(
                  title: Titles.header_title,
                  flagAsset: Images.flagAsset,
                ),
              ),
            ),

            // Main Logo - SCALED PROPORTIONALLY
            Positioned(
              top: scaled(150) * limitedScale,
              right: 0,
              left: 0,
              child: Center(
                child: LogoContainer(
                  width: scaled(200) * limitedScale,
                  height: scaled(210) * limitedScale,
                  logoAsset: Images.logoAsset,
                ),
              ),
            ),

            // Subtitle "All in one place" - SCALED PROPORTIONALLY
            Positioned(
              top: scaled(376) * limitedScale,
              right: 0,
              left: 0,
              child: Center(
                child: Text(
                  'All in one place!',
                  style: TextStyle(
                    fontFamily: Constants.primaryfont,
                    fontSize: Constants.getFontSmall(context) * limitedScale,
                    color: CustomColors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Bottom Content Section with 3 buttons - SCALED PROPORTIONALLY
            Positioned(
              bottom: scaled(20) * limitedScale,
              left: scaled(35) * limitedScale,
              right: scaled(35) * limitedScale,
              child: Container(
                height: scaled(220) * limitedScale,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title "Get Access to Your App" - SCALED PROPORTIONALLY
                    Text(
                      'Get Access to your App',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.getFontSmall(context) * limitedScale,
                        color: CustomColors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    // REGISTER Button - SCALED PROPORTIONALLY
                    Container(
                      width: double.infinity,
                      height: scaled(50) * limitedScale,
                      decoration: BoxDecoration(
                        color: CustomColors.gradientBlue,
                        borderRadius: BorderRadius.circular(scaled(5) * limitedScale),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.blackBS1,
                            blurRadius: scaled(8) * limitedScale,
                            offset: Offset(0, scaled(3) * limitedScale),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: (){
                          print('PRESSED ON REGISTER');
                          _controller.handleRegisterPress();
                        },
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: Constants.getFontSmall(context) * limitedScale,
                            color: CustomColors.ghostWhite,
                          ),
                        ),
                      ),
                    ),

                    // LOG IN Button - SCALED PROPORTIONALLY
                    Container(
                      width: double.infinity,
                      height: scaled(50) * limitedScale,
                      decoration: BoxDecoration(
                        color: CustomColors.black87,
                        borderRadius: BorderRadius.circular(scaled(5) * limitedScale),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.blackBS1,
                            blurRadius: scaled(8) * limitedScale,
                            offset: Offset(0, scaled(3) * limitedScale),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: (){
                          print('CLICKED ON LOGIN PAGE');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SigninLoginPage(
                                isCommercial: isCommercial,
                              )));
                        },
                        child: Text(
                          'LOG IN',
                          style: TextStyle(
                            fontSize: Constants.getFontSmall(context) * limitedScale,
                            color: CustomColors.ghostWhite,
                          ),
                        ),
                      ),
                    ),

                    // ENTER AS A GUEST BUTTON - SCALED PROPORTIONALLY
                    Container(
                      width: double.infinity,
                      height: scaled(50) * limitedScale,
                      decoration: BoxDecoration(
                        color: CustomColors.ghostWhite,
                        borderRadius: BorderRadius.circular(scaled(5) * limitedScale),
                        border: Border.all(
                          color: CustomColors.ghostWhite,
                          width: scaled(2) * limitedScale,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.blackBS1,
                            blurRadius: scaled(8) * limitedScale,
                            offset: Offset(0, scaled(3) * limitedScale),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: (){
                          print('PRESSED ENTER AS A GUEST');
                        },
                        child: Text(
                          'ENTER AS A GUEST',
                          style: TextStyle(
                            fontSize: Constants.getFontSmall(context) * limitedScale,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.black87,
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