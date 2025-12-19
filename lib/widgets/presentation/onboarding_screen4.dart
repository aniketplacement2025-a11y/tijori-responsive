import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/page_indicator.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/onboarding_controller.dart';

import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/titles.dart';
import '../../pages/others/custom_header_1.dart';
import '../../pages/others/logo_container.dart';
import 'SplashScreen2.dart';

class OnboardingScreen4 extends StatefulWidget {
  @override
  _OnboardingScreen4State createState() => _OnboardingScreen4State();
}

class _OnboardingScreen4State extends State<OnboardingScreen4> {
  final OnboardingController _controller = OnboardingController();

  @override
  void initState() {
    super.initState();
  }

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

    return Scaffold(
      body: OnboardingBackground(
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

            // Bottom Content Section
            Positioned(
              bottom: scaled(10),
              left: scaled(35),
              right: scaled(35),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    height: scaled(170),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Content for Screen 4
                        Column(
                          children: [
                            Text(
                              'All in one place!',
                              style: TextStyle(
                                fontSize: Constants.getFontMedium(context) * limitedScale,
                                fontFamily: Constants.primaryfont,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: Constants.getSpacingSmall(context) * limitedScale),
                            Container(
                              width: scaled(280),
                              child: Text(
                                'Enable homeowners and contractors to collaborate within organized, project - centric environments.',
                                style: TextStyle(
                                  fontSize: Constants.getFontLittle(context) * limitedScale,
                                  fontFamily: Constants.primaryfont,
                                  color: CustomColors.black87,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),

                        // Page Indicator
                        ListenableBuilder(
                          listenable: _controller,
                          builder: (context, child) {
                            return PageIndicator(
                              currentPage: _controller.currentPage,
                              totalPages: _controller.totalPages,
                              onPageChanged: (newPage) {
                                _controller.handlePageChange(newPage, context);
                              },
                            );
                          },
                        ),

                        // Skip Button
                        ListenableBuilder(
                          listenable: _controller,
                          builder: (context, child) {
                            return Container(
                              width: scaled(290),
                              height: scaled(40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Left Button - "SKIP"
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: scaled(8)),
                                      height: scaled(40),
                                      decoration: BoxDecoration(
                                        color: CustomColors.ghostWhite,
                                        borderRadius: BorderRadius.circular(scaled(5)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: CustomColors.blackBS1,
                                            blurRadius: scaled(5),
                                            offset: Offset(0, scaled(2)),
                                          ),
                                        ],
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          _navigateToMainApp(context);
                                        },
                                        child: Text(
                                          'SKIP',
                                          style: TextStyle(
                                            fontSize: Constants.getFontLittle(context) * limitedScale,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColors.black87,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Right Button - "ENJOY THE APP"
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: scaled(8)),
                                      height: scaled(40),
                                      decoration: BoxDecoration(
                                        color: CustomColors.gradientBlue,
                                        borderRadius: BorderRadius.circular(scaled(5)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: CustomColors.blackBS1,
                                            blurRadius: scaled(5),
                                            offset: Offset(0, scaled(2)),
                                          ),
                                        ],
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          _navigateToMainApp(context);
                                        },
                                        child: Text(
                                          'ENJOY THE APP',
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
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Navigate to main app after onboarding completion
  void _navigateToMainApp(BuildContext context) {
    print('Navigating to main app...');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen2()),
    );
  }
}