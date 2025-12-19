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
        mobile: 400,
        tablet: 450,
        desktop: 500,
      ),
      height: Responsive.value<double>(
        context,
        mobile: 85,
        tablet: 90,
        desktop: 95,
      ),
      padding: EdgeInsets.fromLTRB(
        Responsive.value<double>(context, mobile: 30, tablet: 35, desktop: 40),
        Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
        Responsive.value<double>(context, mobile: 30, tablet: 35, desktop: 40),
        Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(200),
        boxShadow: [
          BoxShadow(
            color: CustomColors.blackBS1,
            blurRadius: Responsive.value<double>(
              context,
              mobile: 20,
              tablet: 22,
              desktop: 24,
            ),
            offset: Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: CustomColors.ghostWhite,
          width: 2,
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
                mobile: 77,
                tablet: 85,
                desktop: 93,
              ),
              height: Responsive.value<double>(
                context,
                mobile: 45,
                tablet: 48,
                desktop: 51,
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
                      mobile: 20,
                      tablet: 22,
                      desktop: 24,
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
                      fontSize: Constants.getFontLittle(context),
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
                    mobile: 20,
                    tablet: 22,
                    desktop: 24,
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
                    fontSize: Constants.getFontLittle(context),
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
                mobile: 77,
                tablet: 85,
                desktop: 93,
              ),
              height: Responsive.value<double>(
                context,
                mobile: 45,
                tablet: 48,
                desktop: 51,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.subscriptions,
                    size: Responsive.value<double>(
                      context,
                      mobile: 20,
                      tablet: 22,
                      desktop: 24,
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
                      fontSize: Constants.getFontLittle(context),
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