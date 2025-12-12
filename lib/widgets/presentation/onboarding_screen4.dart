import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/page_indicator.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/onboarding_controller.dart';

import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/titles.dart';
import '../../pages/others/custom_header_1.dart';
import '../../pages/others/logo_container.dart';

class OnboardingScreen4 extends StatefulWidget {
  @override
  _OnboardingScreen4State createState() => _OnboardingScreen4State();
}

class _OnboardingScreen4State extends State<OnboardingScreen4> {
  final OnboardingController _controller = OnboardingController();
  // Now Singleton
  @override
  void initState() {
    super.initState();
    // Set to second page when this screen loads
    // _controller.handlePageChange(1, context); // This will just update internal state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.setPage(3); // This will update the singleton instance
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBackground(
        // Using the reusable background
        child: Stack(
          children: [
            // Background Girl image
            Positioned(
              right: 56,
              top: 148,
              child: Image.asset(Images.girl, height: 300, fit: BoxFit.contain),
            ),

            // Clouds
            Positioned(
              left: 56,
              bottom: 148,
              child: Image.asset(
                Images.Clouds,
                width: 250,
                fit: BoxFit.contain,
              ),
            ),

            // Custom Header 1
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: CustomHeader1(
                  title: Titles.header_title,
                  flagAsset: Images.flagAsset,
                ),
              ),
            ),

            // Main Logo Container - Added left and top positions
            Positioned(
              top: 56,
              left: 0,
              right: 0,
              child: Center(
                child: LogoContainer(
                  width: 100,
                  height: 105,
                  logoAsset: Images.logoAsset,
                ),
              ),
            ),

            // Bottom Content Section (same structure but different content)
            Positioned(
              bottom: 10,
              left: 35,
              right: 35,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Content for Screen 2
                        Column(
                          children: [
                            Text(
                              'All in one place!', // Your unique title for screen 2
                              style: TextStyle(
                                fontSize: Constants.fontMedium,
                                fontFamily: Constants.primaryfont,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: Constants.spacingSmall),
                            Container(
                              width: 280,
                              child: Text(
                                'Enable homeowners and contractors to collaborate within organized, project - centric environments.', // Your unique description for screen 2
                                style: TextStyle(
                                  fontSize: Constants.fontLittle,
                                  fontFamily: Constants.primaryfont,
                                  color: CustomColors.black87,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),

                        // Page Indicator - Listens to controller changes
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
                              width:
                                  290, // Increased width to accomodate both buttons
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Left Button - "SKIP"
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 8),
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: CustomColors.ghostWhite,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: CustomColors.blackBS1,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          _controller.handleSkipPress(context);
                                        },
                                        child: Text(
                                          'SKIP',
                                          style: TextStyle(
                                            fontSize: Constants.fontLittle,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColors.black87,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Right Button - "ENJOY THE APP"
                                  Expanded(
                                    // Use Expanded to share available space
                                    child: Container(
                                      //width: 160,
                                      margin: EdgeInsets.only(left: 8),
                                      // Add spacing between buttons
                                      // Fixed width instead of infinity
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: CustomColors.gradientBlue,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: CustomColors.blackBS1,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),

                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _controller.handleSkipPress(
                                              context,
                                            );
                                          });
                                        },
                                        child: Text(
                                          _controller.buttonText,
                                          style: TextStyle(
                                            fontSize: Constants.fontLittle,
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
}
