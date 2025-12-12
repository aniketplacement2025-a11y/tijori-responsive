import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/material/custom_header_back_icon.dart';

import '../../utils/custom_colors.dart';

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
    return Positioned(
      top: top,
      left: left,
      right: right,
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
