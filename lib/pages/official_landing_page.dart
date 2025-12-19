import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/material/home_page_footer.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/home_document_page_body.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/home_subs_page_body.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/home_page_body.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/material/home_page_header.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/material/home_search_bar.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';

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
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changeTab(HomePageTab tab) {
    final int pageIndex = tab.index;
    setState(() {
      _currentTab = tab;
      _currentPageIndex = pageIndex;
    });
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
      _currentTab = HomePageTab.values[index];
    });
  }

  Widget _getPageBody(int index) {
    switch (HomePageTab.values[index]) {
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
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants with context
    Constants.updateFromContext(context);

    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // Header Fixed at top - Responsive positioning
            Positioned(
              top: Responsive.value<double>(
                context,
                mobile: 20,
                tablet: 24,
                desktop: 28,
              ),
              left: isMobile ? 4 : 8,
              right: isMobile ? 0 : 8,
              child: HomePageHeader(),
            ),

            // Search Bar - Responsive positioning
            Positioned(
              top: Responsive.value<double>(
                context,
                mobile: 64,
                tablet: 72,
                desktop: 80,
              ),
              left: isMobile ? 12 : 20,
              right: isMobile ? 12 : 20,
              child: HomeSearchBar(),
            ),

            // Main Body - Swipable PageView
            Positioned(
              top: Responsive.value<double>(
                context,
                mobile: 116,
                tablet: 128,
                desktop: 140,
              ),
              left: isMobile ? 0 : 8,
              right: isMobile ? 0 : 8,
              bottom: Responsive.value<double>(
                context,
                mobile: 85,
                tablet: 95,
                desktop: 105,
              ),
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: HomePageTab.values.length,
                itemBuilder: (context, index) {
                  return _getPageBody(index);
                },
              ),
            ),

            // Fixed Bottom Navigation Bar - Responsive positioning
            Positioned(
              left: isMobile ? 0 : 20,
              right: isMobile ? 0 : 20,
              bottom: Responsive.value<double>(
                context,
                mobile: 20,
                tablet: 24,
                desktop: 28,
              ),
              child: Center(
                child: HomePageFooter(
                  currentTab: _currentTab,
                  onTabChanged: _changeTab,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}