import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/material/home_page_footer.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/home_document_page_body.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/home_subs_page_body.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/home_page_body.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/material/home_page_header.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/material/home_search_bar.dart';

enum HomePageTab {
  home,
  documents,
  subscription,
}

class OfficialLandingPage extends StatefulWidget {
  @override
  _OfficialLandingPageState createState() => _OfficialLandingPageState();
}

class _OfficialLandingPageState extends State<OfficialLandingPage> {
  HomePageTab _currentTab = HomePageTab.home;

  // Method to change tabs
  void _changeTab(HomePageTab tab){
    setState(() {
      _currentTab = tab;
    });
  }

  // Method to get the current body based on selected tab
  Widget _getCurrentBody(){
    switch(_currentTab){
      case HomePageTab.home:
        return const HomePageBody();
      case HomePageTab.documents:
        return const HomeDocumentPageBody();
      case HomePageTab.subscription:
        return const HomeSubsPageBody();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // Header Fixed at top
            Positioned(
              top: 20,
              left: 4,
              right: 0,
              child: HomePageHeader(),
            ),

            Positioned(
              top: 64,
              left: 12,
              right: 12,
              child: HomeSearchBar(),
            ),

            Positioned(
              top: 116,
              left: 0,
              right: 0,
              bottom: 85,
              child: _getCurrentBody(),
            ),

            // Fixed Bottom Navigation Bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 20, // Adjust this value for distance from bottom
              child: HomePageFooter(
                currentTab: _currentTab,
                onTabChanged: _changeTab,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
