import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/onboarding_screen.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/onboarding_screen3.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/onboarding_screen4.dart';
import '../../pages/features/onboarding_controller.dart';
import '../../pages/features/page_indicator.dart';
import '../../utils/custom_colors.dart';
import '../../utils/constants.dart';
import '../../utils/responsive_media_query.dart';
import '../presentation/SplashScreen2.dart';
import '../presentation/onboarding_screen2.dart';

class OnboardingWrapper extends StatefulWidget {
  @override
  _OnboardingWrapperState createState() => _OnboardingWrapperState();
}

class _OnboardingWrapperState extends State<OnboardingWrapper> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageListener);
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    // Optional: Add any page change logic here if needed
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _handleSkipPress() {
    if (_currentPage < 3) { // 0, 1, 2
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // On page 4, handle navigation differently if needed
      // Or let OnboardingScreen4 handle its own navigation
    }
  }

  void _handlePageChange(int newPage) {
    _pageController.animateToPage(
      newPage,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  String get _buttonText {
    return _currentPage < 3 ? 'SKIP' : 'ENJOY THE APP';
  }

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

    return Scaffold(
      body: Stack(
        children: [
          // PageView for swipeable screens
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              OnboardingScreen(),
              OnboardingScreen2(),
              OnboardingScreen3(),
              OnboardingScreen4(),
            ],
          ),

          // Show bottom navigation ONLY for pages 0, 1, and 2
          // NOT for page 3 (which is OnboardingScreen4)
          if (_currentPage < 3) // 0, 1, 2 only
            Positioned(
              bottom: scaled(10) * limitedScale,
              left: scaled(35) * limitedScale,
              right: scaled(35) * limitedScale,
              child: Container(
                height: scaled(170) * limitedScale,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title & Description
                    _getContentForPage(_currentPage, scaled, limitedScale),

                    SizedBox(height: 10),

                    // Page Indicator (3 dots only for first 3 pages)
                    PageIndicator(
                      currentPage: _currentPage,
                      totalPages: 4, // Important: Only 3 pages for indicator
                      onPageChanged: _handlePageChange,
                    ),

                    SizedBox(height: 10),

                    // Skip Button
                    Container(
                      width: scaled(250) * limitedScale,
                      height: scaled(48) * limitedScale,
                      decoration: BoxDecoration(
                        color: CustomColors.ghostWhite,
                        borderRadius: BorderRadius.circular(scaled(5) * limitedScale),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.blackBS1,
                            blurRadius: scaled(5) * limitedScale,
                            offset: Offset(0, scaled(2) * limitedScale),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: _handleSkipPress,
                        child: Text(
                          'SKIP', // Always "SKIP" for first 3 pages
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
    );
  }

  Widget _getContentForPage(int page, double Function(double) scaled, double limitedScale) {
    switch (page) {
      case 0:
        return Column(
          children: [
            Text(
              'Organize Your Life',
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontSize: Constants.getFontMedium(context) * limitedScale,
                fontWeight: FontWeight.bold,
                color: CustomColors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Constants.getSpacingSmall(context) * limitedScale),
            Container(
              width: scaled(280) * limitedScale,
              child: Text(
                'Enable homeowners and contractors to collaborate within organized, project-centric environments.',
                style: TextStyle(
                  fontFamily: Constants.primaryfont,
                  fontSize: Constants.getFontLittle(context) * limitedScale,
                  color: CustomColors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      case 1:
        return Column(
          children: [
            Text(
              'All in one place!',
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontSize: Constants.getFontMedium(context) * limitedScale,
                fontWeight: FontWeight.bold,
                color: CustomColors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Constants.getSpacingSmall(context) * limitedScale),
            Container(
              width: scaled(280) * limitedScale,
              child: Text(
                'Enable homeowners and contractors to collaborate within organized, project - centric environments.',
                style: TextStyle(
                  fontFamily: Constants.primaryfont,
                  fontSize: Constants.getFontLittle(context) * limitedScale,
                  color: CustomColors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            Text(
              'Organize Your Life',
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontSize: Constants.getFontMedium(context) * limitedScale,
                fontWeight: FontWeight.bold,
                color: CustomColors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Constants.getSpacingSmall(context) * limitedScale),
            Container(
              width: scaled(280) * limitedScale,
              child: Text(
                'Enable homeowners and contractors to collaborate within organized, project-centric environments.',
                style: TextStyle(
                  fontFamily: Constants.primaryfont,
                  fontSize: Constants.getFontLittle(context) * limitedScale,
                  color: CustomColors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      default:
        return SizedBox.shrink(); // Empty for page 3
    }
  }
}