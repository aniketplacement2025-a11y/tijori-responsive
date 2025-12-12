import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/SplashScreen.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/onboarding_screen.dart';
// import 'package:vkaps_it_solution_project_tijori/widgets/presentation/onboarding_screen2.dart';
// import 'package:vkaps_it_solution_project_tijori/widgets/presentation/onboarding_screen3.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/onboarding_screen4.dart';

import '../../widgets/presentation/SplashScreen2.dart';

class OnboardingController extends ChangeNotifier {
  static final OnboardingController _instance = OnboardingController._internal();

  factory OnboardingController() {
    return _instance;
  }

  OnboardingController._internal();

  int _currentPage = 0;
  final int _totalPages = 4;

  int get currentPage => _currentPage;
  int get totalPages => _totalPages;

  // Function to handle SKIP button press - navigates to next onboading screen
  void handleSkipPress(BuildContext context){
    if(_currentPage < _totalPages - 1){
      // Go to next onboarding page
      _currentPage++;
      notifyListeners();

      // Use postFrameCallback to navigate after build is complete
      WidgetsBinding.instance.addPostFrameCallback((_){
        _navigateToNextOnboardingScreen(context);
      });
    } else {
      // Last onboarding page - navigate to main app screen (e.g., Login/Home)
      WidgetsBinding.instance.addPostFrameCallback((_){
        _navigateToMainApp(context);
      });
    }
  }

  // Function to handle page change from dots
  void handlePageChange(int newPage, BuildContext context){
    _currentPage = newPage;
    notifyListeners();

    // Use postFrameCallback to navigate after build is complete
    WidgetsBinding.instance.addPostFrameCallback((_){
      _navigateToNextOnboardingScreen(context);
    });
  }

  // Set page without navigation (for initState)
  void setPage(int page){
    _currentPage = page;
    notifyListeners();
  }

  //Navigate to next onboarding screen based on current page
  void _navigateToNextOnboardingScreen(BuildContext context){
    // Don't navigate if we're already on the current screen
    if(_currentPage == 0) return;

    switch(_currentPage){
      case 1:  break;
      case 2:  break;
      case 3:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen4())
        ); break;
    }
  }

  // Navigate to main app after onboarding completion
  void _navigateToMainApp(BuildContext context) {
    // Replace with your actual main app navigation
    print('Navigating to main app...');
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen2())
    );
    // Example:
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    // or
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  // Get button text based on current page
  String get buttonText{
   return _currentPage < _totalPages -1 ? 'SKIP' : 'ENJOY THE APP';
  }


  // Reset to first page
  void reset() {
    _currentPage = 0;
    notifyListeners();
  }
}