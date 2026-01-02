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
  final bool isCommercial;

  OfficialLandingPage({
    super.key,
    required this.isCommercial,
  });

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
        return HomePageBody(
          isCommercial: widget.isCommercial,
        );
      case HomePageTab.documents:
        return HomeDocumentPageBody(
          isCommercial: widget.isCommercial,
        );
      case HomePageTab.subscription:
        return HomeSubsPageBody(
          isCommercial: widget.isCommercial,
        );
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
              left: isMobile ? 8 : 12,
              right: isMobile ? 8 : 12,
              child: HomePageHeader(
                isCommercial: widget.isCommercial,
              ),
            ),

            // Search Bar - Responsive positioning
            Positioned(
              top: Responsive.value<double>(
                context,
                mobile: 72,
                tablet: 80,
                desktop: 88,
              ),
              left: isMobile ? 12 : 20,
              right: isMobile ? 12 : 20,
              child: HomeSearchBar(),
            ),

            // Main Body - Swipable PageView
            Positioned(
              top: Responsive.value<double>(
                context,
                mobile: 136,
                tablet: 144,
                desktop: 152,
              ),
              left: isMobile ? 8 : 12,
              right: isMobile ? 8 : 12,
              bottom: Responsive.value<double>(
                context,
                mobile: 104,
                tablet: 112,
                desktop: 124,
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
              left: isMobile ? 10 : 20,
              right: isMobile ? 10 : 20,
              bottom: Responsive.value<double>(
                context,
                mobile: 16,
                tablet: 20,
                desktop: 24,
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