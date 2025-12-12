import 'dart:async';

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

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController _controller = OnboardingController();
  // Now Singleton
  @override
  void initState() {
    super.initState();
    // Set to first page when this screen loads
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width; // Use full screen width
    // final screenHeight = MediaQuery.of(context).size.height; // Use full screen height

    return Scaffold(
      body: OnboardingBackground(
        // Using the reusable background
        child: Stack(
          children: [
            //Background cloud images
            Positioned(
              left: -180,
              top: 96,
              child: Image.asset(
                Images.bg_removal, // Update with actual path
                width: 700,
                height: 445,
                fit: BoxFit.contain,
              ),
            ),

            // Cloud 1
            Positioned(
              left: -50,
              top: 280,
              child: Image.asset(
                Images.cloud1,
                width: 339,
                height: 226,
                fit: BoxFit.contain,
              ),
            ),

            // Cloud 2
            Positioned(
              left: 100,
              top: 148,
              child: Image.asset(
                Images.cloud2,
                width: 339,
                height: 226,
                fit: BoxFit.contain,
              ),
            ),

            // Custom Header 1
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                // width: 200, // Fixed width to prevent infinity constraints
                child: CustomHeader1(
                  title: Titles.header_title,
                  flagAsset: Images.flagAsset,
                ),
              ),
            ),

            //  Main Logo Container - Added left and top positions
            Positioned(
              // left: 170, // Added missing left position
              top: 60,
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

            // Rotated Small Logo (top right corner)
            Positioned(
              left: 120,
              top: 280,
              child: Transform.rotate(
                angle: 0.0951, // -5.45 degrees in radians
                child: LogoContainer(
                  width: 66.10,
                  height: 69.56,
                  logoAsset: Images.logoAsset,
                ),
              ),
            ),

            // Bottom Content Section (Organize Your Life to Skip button)
            Positioned(
              bottom: 10, // Positioned from bottom instead of fixed top
              left: 35,
              //top: 677,
              right: 35,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    //width: 371,
                    height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title & Description Section (Static for First page)
                        Column(
                          children: [
                            Text(
                              'Organize Your Life',
                              style: TextStyle(
                                fontFamily: Constants.primaryfont,
                                fontSize: Constants.fontMedium,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: Constants.spacingSmall),

                            Container(
                              width: 280,
                              child: Text(
                                'Enable homeowners and contractors to collaborate within organized, project-centric environments.',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontLittle,
                                  color: CustomColors.black87,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),

                        // ADDED: Page Indication Bar/Dots
                        ListenableBuilder(
                          listenable: _controller,
                          builder: (context, child) {
                            return PageIndicator(
                              currentPage: _controller.currentPage,
                              totalPages: _controller.totalPages,
                              onPageChanged: (newPage) {
                                setState(() {
                                  _controller.handlePageChange(
                                    newPage,
                                    context,
                                  );
                                });
                              },
                            );
                          },
                        ),

                        // Skip Button
                        ListenableBuilder(
                          listenable: _controller,
                          builder: (context, child) {
                            return Container(
                              width: 250,
                              // Fixed width instead of infinity
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
                                  setState(() {
                                    _controller.handleSkipPress(context);
                                  });
                                },
                                child: Text(
                                  _controller.buttonText,
                                  style: TextStyle(
                                    fontSize: Constants.fontSmall,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.black87,
                                  ),
                                ),
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
