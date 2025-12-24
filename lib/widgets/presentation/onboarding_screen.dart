import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/Images.dart';
import 'package:vkaps_it_solution_project_tijori/utils/titles.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/SplashScreen2.dart';
import '../../pages/others/custom_header_1.dart';
import '../../pages/others/logo_container.dart';
import '../../utils/onboarding_background.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handlePageChange(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _handleSkipPress() {
    if (_currentPage < _totalPages - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToMainApp(context);
    }
  }

  void _navigateToMainApp(BuildContext context) {
    // Navigate to your main app screen
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen2()));
  }

  Widget _buildContent(int page) {
    final List<Map<String, String>> pageContents = [
      {
        'title': 'Organize Your Life',
        'description': 'Enable homeowners and contractors to collaborate within organized, project-centric environments.',
        'image': 'assets/images/onboarding_page.png',
      },
      {
        'title': 'All in one place!',
        'description': 'Enable homeowners and contractors to collaborate within organized, project-centric environments.',
        'image': 'assets/images/onboarding_page4.png',
      },
      {
        'title': 'Organize Your Life',
        'description': 'Enable homeowners and contractors to collaborate within organized, project-centric environments.',
        'image': 'assets/images/onboarding_page.png',
      },
      {
        'title': 'All in one place!',
        'description': 'Enable homeowners and contractors to collaborate within organized, project-centric environments.',
        'image': 'assets/images/onboarding_page4.png',
      },
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Responsive Image
        Container(
          width: Responsive.value<double>(
            context,
            mobile: 400,
            tablet: 450,
            desktop: 500,
          ),
          height: Responsive.value<double>(
            context,
            mobile: 350,
            tablet: 400,
            desktop: 450,
          ),
          child: Image.asset(
            pageContents[page]['image']!,
            fit: BoxFit.contain,
          ),
        ),


        // Title
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.value<double>(
              context,
              mobile: 24,
              tablet: 40,
              desktop: 60,
            ),
          ),
          child: Text(
            pageContents[page]['title']!,
            style: TextStyle(
              fontFamily: Constants.primaryfont,
              fontSize: Responsive.value<double>(
                context,
                mobile: 24,
                tablet: 28,
                desktop: 32,
              ),
              fontWeight: FontWeight.bold,
              color: CustomColors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(height: Responsive.value<double>(
          context,
          mobile: 12,
          tablet: 16,
          desktop: 20,
        )),

        // Description
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.value<double>(
              context,
              mobile: 24,
              tablet: 40,
              desktop: 60,
            ),
          ),
          child: Text(
            pageContents[page]['description']!,
            style: TextStyle(
              fontFamily: Constants.primaryfont,
              fontSize: Responsive.value<double>(
                context,
                mobile: 14,
                tablet: 16,
                desktop: 18,
              ),
              color: CustomColors.black87,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                height: Responsive.value<double>(
                  context,
                  mobile: 70,
                  tablet: 80,
                  desktop: 90,
                ),
                child: Center(
                  child: CustomHeader1(
                    title: Titles.header_title,
                    flagAsset: Images.flagAsset,
                  ),
                ),
              ),

              // Logo
              Container(
                height: Responsive.value<double>(
                  context,
                  mobile: 120,
                  tablet: 140,
                  desktop: 160,
                ),
                child: Center(
                  child: LogoContainer(
                    width: Responsive.value<double>(
                      context,
                      mobile: 120,
                      tablet: 140,
                      desktop: 160,
                    ),
                    height: Responsive.value<double>(
                      context,
                      mobile: 120,
                      tablet: 140,
                      desktop: 160,
                    ),
                    logoAsset: Images.logoAsset,
                  ),
                ),
              ),

              SizedBox(height: Constants.getSpacingMedium(context)),

              // Main Content Area - Takes remaining space
              Expanded(
                child: Column(
                  children: [
                    // PageView for swipable content
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: _handlePageChange,
                        itemCount: _totalPages,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Responsive.value<double>(
                                  context,
                                  mobile: 8,
                                  tablet: 16,
                                  desktop: 24,
                                ),
                              ),
                              child: _buildContent(index),
                            ),
                          );
                        },
                      ),
                    ),

                    // Page Indicator
                    Container(
                      height: Responsive.value<double>(
                        context,
                        mobile: 40,
                        tablet: 50,
                        desktop: 60,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_totalPages, (index) {
                          return Container(
                            width: Responsive.value<double>(
                              context,
                              mobile: 10,
                              tablet: 12,
                              desktop: 14,
                            ),
                            height: Responsive.value<double>(
                              context,
                              mobile: 10,
                              tablet: 12,
                              desktop: 14,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? CustomColors.darkPink
                                  : Colors.grey[300],
                            ),
                          );
                        }),
                      ),
                    ),

                    SizedBox(height: Constants.getSpacingSmall(context)),

                    // Footer Button
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: Responsive.value<double>(
                          context,
                          mobile: 16,
                          tablet: 20,
                          desktop: 24,
                        ),
                        left: Responsive.value<double>(
                          context,
                          mobile: 20,
                          tablet: 30,
                          desktop: 40,
                        ),
                        right: Responsive.value<double>(
                          context,
                          mobile: 20,
                          tablet: 30,
                          desktop: 40,
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: Responsive.value<double>(
                          context,
                          mobile: 50,
                          tablet: 56,
                          desktop: 60,
                        ),
                        decoration: BoxDecoration(
                          color: _currentPage < 3 ? CustomColors.ghostWhite : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: _currentPage < 3 ? [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ] : null,
                        ),
                        child: _currentPage < 3
                            ? TextButton(
                          onPressed: _handleSkipPress,
                          child: Text(
                            'SKIP',
                            style: TextStyle(
                              fontSize: Responsive.value<double>(
                                context,
                                mobile: 16,
                                tablet: 18,
                                desktop: 20,
                              ),
                              fontWeight: FontWeight.bold,
                              color: CustomColors.black87,
                            ),
                          ),
                        )
                            : Row(
                          children: [
                            // Left Button
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  color: CustomColors.ghostWhite,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () => _navigateToMainApp(context),
                                  child: Text(
                                    'SKIP',
                                    style: TextStyle(
                                      fontSize: Responsive.value<double>(
                                        context,
                                        mobile: 14,
                                        tablet: 16,
                                        desktop: 18,
                                      ),
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Right Button
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  color: CustomColors.gradientBlue,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () => _navigateToMainApp(context),
                                  child: Text(
                                    'ENJOY',
                                    style: TextStyle(
                                      fontSize: Responsive.value<double>(
                                        context,
                                        mobile: 14,
                                        tablet: 16,
                                        desktop: 18,
                                      ),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}