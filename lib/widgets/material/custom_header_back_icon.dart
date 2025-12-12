import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/profile_page.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';

import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';

class CustomHeaderBackIcon extends StatelessWidget {
  final BuildContext context;
  final VoidCallback? onBackPressed;
  final VoidCallback? onReminderPressed;
  final List<PopupMenuItem<String>>? menuItems;
  final String? reminderText;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? height;
  final double? widthPercentage;

  const CustomHeaderBackIcon({
    super.key,
    required this.context,
    this.onBackPressed,
    this.onReminderPressed,
    this.menuItems,
    this.reminderText = 'Create reminder',
    this.backgroundColor = CustomColors.ghostWhite,
    this.iconColor = CustomColors.black87,
    this.height = 36,
    this.widthPercentage = 0.88,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: Responsive.screenWidth(context) * (widthPercentage ?? 0.88),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Back Button
          IconButton(
            onPressed: onBackPressed ?? () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: iconColor),
          ),

          SizedBox(width: Constants.spacingHigh),

          // Reminder Button
          GestureDetector(
            onTap:
                onReminderPressed ??
                () {
                  print('CLICKED ON BELL IMAGE');
                },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.blackBS1,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(Images.bell, width: 16, height: 16),
                  SizedBox(width: Constants.spacingLittle),
                  Text(
                    reminderText!,
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.fontSmall,
                      color: CustomColors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Popup Menu
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: Border.all(color: CustomColors.lightWhite, width: 1),
            ),
            child: IconButton(
              icon: Icon(Icons.menu_outlined, color: iconColor, size: 16),
              onPressed: () {
                print("Clicked on Menu Button");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // List<PopupMenuItem<String>> _defaultMenuItems() {
  //   return [
  //     PopupMenuItem<String>(
  //       value: 'profile',
  //       child: Row(
  //         children: [
  //           Icon(Icons.person, size: 12),
  //           SizedBox(width: 4),
  //           Text('Profile'),
  //         ],
  //       ),
  //     ),
  //     PopupMenuItem<String>(
  //       value: 'settings',
  //       child: Row(
  //         children: [
  //           Icon(Icons.settings, size: 12),
  //           SizedBox(width: 4),
  //           Text('Settings'),
  //         ],
  //       ),
  //     ),
  //     PopupMenuItem<String>(
  //       value: 'logout',
  //       child: Row(
  //         children: [
  //           Icon(Icons.logout, size: 12),
  //           SizedBox(width: 4),
  //           Text('Logout'),
  //         ],
  //       ),
  //     ),
  //   ];
  // }

  // void _handleMenuSelection(String value, BuildContext context) {
  //   switch (value) {
  //     case 'profile':
  //       print('Profile selected');
  //       // Navigate to profile page
  //       // Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
  //       break;
  //     case 'settings':
  //       print('Settings selected');
  //       // Navigate to settings
  //       // Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage()));
  //       break;
  //     case 'logout':
  //       print('Logout selected');
  //       // Handle logout
  //       break;
  //   }
  // }
}
