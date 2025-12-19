import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/material/custom_header_back_icon.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';

class PositionedHeaderBackIcon extends StatelessWidget {
  final BuildContext context;
  final double top;
  final double left;
  final double right;
  final VoidCallback? onBackPressed;
  final VoidCallback? onReminderPressed;
  final List<PopupMenuItem<String>>? menuItems;
  final String? reminderText;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? height;
  final double? widthPercentage;

  const PositionedHeaderBackIcon({
    super.key,
    required this.context,
    this.top = 20,
    this.left = 4,
    this.right = 0,
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

    return Positioned(
      top: Responsive.value<double>(
        context,
        mobile: top,
        tablet: top * 1.1,
        desktop: top * 1.2,
      ),
      left: Responsive.value<double>(
        context,
        mobile: left,
        tablet: left * 1.2,
        desktop: left * 1.5,
      ),
      right: Responsive.value<double>(
        context,
        mobile: right,
        tablet: right * 1.2,
        desktop: right * 1.5,
      ),
      child: CustomHeaderBackIcon(
        context: context,
        onBackPressed: onBackPressed,
        onReminderPressed: onReminderPressed,
        menuItems: menuItems,
        reminderText: reminderText,
        backgroundColor: backgroundColor,
        iconColor: iconColor,
        height: height,
        widthPercentage: widthPercentage,
      ),
    );
  }
}