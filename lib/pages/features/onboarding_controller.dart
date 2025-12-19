import 'package:flutter/material.dart';

import '../../widgets/presentation/SplashScreen2.dart';

class OnboardingController extends ChangeNotifier {
  int _currentPage = 0;
  final int _totalPages = 4;
  late PageController _pageController;

  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  PageController get pageController => _pageController;

  void initializePageController() {
    _pageController = PageController(initialPage: _currentPage);
  }

  // Update for page changes from swiping
  void updateCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  // Function to handle SKIP button press - ONLY for first 3 pages
  void handleSkipPress(BuildContext context) {
    if (_currentPage < 2) { // Only for pages 0 and 1
      // Go to next page
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (_currentPage == 2) {
      // On page 2, skip to page 3 (OnboardingScreen4)
      _pageController.animateToPage(
        3,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    // No skip action for page 3
  }

  // Function to handle page change from dots
  void handlePageChange(int newPage, BuildContext context) {
    if (newPage < 3) { // Only allow navigation to first 3 pages
      _pageController.animateToPage(
        newPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Set page without navigation (for initState)
  void setPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  // Navigate to main app after onboarding completion
  void _navigateToMainApp(BuildContext context) {
    print('Navigating to main app...');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen2()),
    );
  }

  // Get button text based on current page
  String get buttonText {
    return _currentPage < 3 ? 'SKIP' : '';
  }

  // Reset to first page
  void reset() {
    _currentPage = 0;
    notifyListeners();
    if (_pageController.hasClients) {
      _pageController.jumpToPage(0);
    }
  }

  // Dispose page controller
  void disposeController() {
    _pageController.dispose();
  }
}