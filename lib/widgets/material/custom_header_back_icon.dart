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
    final bool isMobile = Responsive.isMobile(context);

    // Update constants
    Constants.updateFromContext(context);

    return SizedBox(
      height: Responsive.value<double>(
        context,
        mobile: height ?? 36,
        tablet: (height ?? 36) * 1.1,
        desktop: (height ?? 36) * 1.2,
      ),
      width: Responsive.screenWidth(context) * (widthPercentage ?? 0.88),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Back Button
          IconButton(
            onPressed: onBackPressed ?? () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: iconColor,
              size: Responsive.value<double>(
                context,
                mobile: 20,
                tablet: 22,
                desktop: 24,
              ),
            ),
            padding: EdgeInsets.all(
              Responsive.value<double>(
                context,
                mobile: 4,
                tablet: 5,
                desktop: 6,
              ),
            ),
          ),

          SizedBox(width: Constants.getSpacingHigh(context)),

          // Reminder Button
          GestureDetector(
            onTap: onReminderPressed ?? () {
              print('CLICKED ON BELL IMAGE');
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.value<double>(
                  context,
                  mobile: 12,
                  tablet: 14,
                  desktop: 16,
                ),
                vertical: Responsive.value<double>(
                  context,
                  mobile: 6,
                  tablet: 7,
                  desktop: 8,
                ),
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(
                  Responsive.value<double>(
                    context,
                    mobile: 16,
                    tablet: 18,
                    desktop: 20,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.blackBS1,
                    blurRadius: Responsive.value<double>(
                      context,
                      mobile: 8,
                      tablet: 9,
                      desktop: 10,
                    ),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    Images.bell,
                    width: Responsive.value<double>(
                      context,
                      mobile: 16,
                      tablet: 18,
                      desktop: 20,
                    ),
                    height: Responsive.value<double>(
                      context,
                      mobile: 16,
                      tablet: 18,
                      desktop: 20,
                    ),
                  ),
                  SizedBox(width: Constants.getSpacingLittle(context)),
                  Text(
                    reminderText!,
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.getFontSmall(context),
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
              border: Border.all(
                color: CustomColors.lightWhite,
                width: 1,
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.menu_outlined,
                color: iconColor,
                size: Responsive.value<double>(
                  context,
                  mobile: 16,
                  tablet: 18,
                  desktop: 20,
                ),
              ),
              onPressed: () {
                print("Clicked on Menu Button");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              padding: EdgeInsets.all(
                Responsive.value<double>(
                  context,
                  mobile: 6,
                  tablet: 7,
                  desktop: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}