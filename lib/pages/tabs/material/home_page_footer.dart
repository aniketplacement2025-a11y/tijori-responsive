import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';

import '../../official_landing_page.dart';

class HomePageFooter extends StatefulWidget {
  final HomePageTab currentTab;
  final Function(HomePageTab) onTabChanged;

  const HomePageFooter({
    Key? key,
    required this.currentTab,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  State<HomePageFooter> createState() => _HomePageFooterState();
}

class _HomePageFooterState extends State<HomePageFooter> {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    // Update constants
    Constants.updateFromContext(context);

    return Container(
      width: Responsive.value<double>(
        context,
        mobile: 380,
        tablet: 420,
        desktop: 480,
      ),
      height: Responsive.value<double>(
        context,
        mobile: 82,
        tablet: 88,
        desktop: 94,
      ),
      padding: EdgeInsets.fromLTRB(
        Responsive.value<double>(context, mobile: 20, tablet: 25, desktop: 30),
        Responsive.value<double>(context, mobile: 15, tablet: 18, desktop: 24),
        Responsive.value<double>(context, mobile: 20, tablet: 25, desktop: 30),
        Responsive.value<double>(context, mobile: 15, tablet: 18, desktop: 24),
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(200),
        border: Border.all(
          color: CustomColors.ghostWhite,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Image/Button
          GestureDetector(
            onTap: () {
              widget.onTabChanged(HomePageTab.home);
              print('Left navigation item tapped');
            },
            child: Container(
              width: Responsive.value<double>(
                context,
                mobile: 70,
                tablet: 80,
                desktop: 90,
              ),
              height: Responsive.value<double>(
                context,
                mobile: 58,
                tablet: 62,
                desktop: 66,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: Responsive.value<double>(
                      context,
                      mobile: 24,
                      tablet: 26,
                      desktop: 28,
                    ),
                    color: widget.currentTab == HomePageTab.home
                        ? CustomColors.gradientBlue
                        : CustomColors.littleWhite,
                  ),
                  SizedBox(height: Constants.getSpacingLittle(context)),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.getFontSmall(context),
                      fontWeight: FontWeight.w600,
                      color: widget.currentTab == HomePageTab.home
                          ? CustomColors.gradientBlue
                          : CustomColors.littleWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Center Image/Button (Main Action)
          GestureDetector(
            onTap: () {
              widget.onTabChanged(HomePageTab.documents);
              print('Center navigation item tapped');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.description,
                  size: Responsive.value<double>(
                    context,
                    mobile: 24,
                    tablet: 26,
                    desktop: 28,
                  ),
                  color: widget.currentTab == HomePageTab.documents
                      ? CustomColors.gradientBlue
                      : CustomColors.littleWhite,
                ),
                SizedBox(height: Constants.getSpacingLittle(context)),
                Text(
                  'My Documents',
                  style: TextStyle(
                    fontFamily: Constants.primaryfont,
                    fontSize: Constants.getFontSmall(context),
                    fontWeight: FontWeight.w600,
                    color: widget.currentTab == HomePageTab.documents
                        ? CustomColors.gradientBlue
                        : CustomColors.littleWhite,
                  ),
                ),
              ],
            ),
          ),

          // Right Image/Button
          GestureDetector(
            onTap: () {
              widget.onTabChanged(HomePageTab.subscription);
            },
            child: Container(
              width: Responsive.value<double>(
                context,
                mobile: 84,
                tablet: 92,
                desktop: 100,
              ),
              height: Responsive.value<double>(
                context,
                mobile: 48,
                tablet: 51,
                desktop: 54,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.subscriptions,
                    size: Responsive.value<double>(
                      context,
                      mobile: 24,
                      tablet: 26,
                      desktop: 28,
                    ),
                    color: widget.currentTab == HomePageTab.subscription
                        ? CustomColors.gradientBlue
                        : CustomColors.littleWhite,
                  ),
                  SizedBox(height: Constants.getSpacingLittle(context)),
                  Text(
                    'Subscription',
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.getFontSmall(context),
                      fontWeight: FontWeight.w600,
                      color: widget.currentTab == HomePageTab.subscription
                          ? CustomColors.gradientBlue
                          : CustomColors.littleWhite,
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
}