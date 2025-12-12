import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/official_landing_page.dart';

import '../../../utils/constants.dart';
import '../../../utils/custom_colors.dart';

class HomePageFooter extends StatefulWidget {
  final HomePageTab currentTab;
  final Function(HomePageTab) onTabChanged;

  const HomePageFooter({
    Key? key,
    required this.currentTab,
    required this.onTabChanged,
  }): super(key: key);

  @override
  State<HomePageFooter> createState() => _HomePageFooterState(); // Make sure this returns the correct type
}

class _HomePageFooterState extends State<HomePageFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400, // width: 400px
        height: 85, // height: 85px
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20), // L30 T20 R30 B20
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(200), // 200px border radius
            boxShadow: [
              BoxShadow(
                color: CustomColors.blackBS1,
                blurRadius: 20,
                offset: Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: CustomColors.ghostWhite,
              width: 2,
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Image/Button
            GestureDetector(
              onTap: () {
                widget.onTabChanged(HomePageTab.home);
                print('Left navigation item tapped');
                // Handle left navigation
              },
              child: Container(
                width: 77, // width: 77px
                height: 45, // height: 45px
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Prevents column from expanding
                  crossAxisAlignment: .center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                      Icon(
                        Icons.home,
                        size: 20,
                        color: widget.currentTab == HomePageTab.home
                            ? CustomColors.gradientBlue
                            : CustomColors.littleWhite,
                      ),
                    SizedBox(height: Constants.spacingLittle), // gap: 5px
                    Text(
                      'Home',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.fontLittle,
                        fontWeight: FontWeight.w600,
                        color: widget.currentTab == HomePageTab.home
                            ? CustomColors.gradientBlue  // Active color
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
                // Handle main action
              },
              child: Column(
                mainAxisSize: MainAxisSize.min, // Prevents column from expanding
                crossAxisAlignment: .center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Icons.description,
                      size: 20,
                      color: widget.currentTab == HomePageTab.documents
                          ? CustomColors.gradientBlue
                        : CustomColors.littleWhite,
                    ),
                  SizedBox(height: Constants.spacingLittle), // gap: 5px
                  Text(
                    'My Documents',
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.fontLittle,
                      fontWeight: FontWeight.w600,
                      color: widget.currentTab == HomePageTab.documents
                          ? CustomColors.gradientBlue  // Active color
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
                // Handle right navigation
              },
              child: Container(
                width: 77, // width: 77px
                height: 45, // height: 45px
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Important!
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.subscriptions,
                        size: 20,
                        color: widget.currentTab == HomePageTab.subscription
                            ? CustomColors.gradientBlue
                            : CustomColors.littleWhite,
                    ),
                    SizedBox(height: Constants.spacingLittle), // gap: 5px
                    Text(
                      'Subscription',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.fontLittle,
                        fontWeight: FontWeight.w600,
                        color: widget.currentTab == HomePageTab.subscription
                            ? CustomColors.gradientBlue  // Active color
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
