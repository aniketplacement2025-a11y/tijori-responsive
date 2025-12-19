import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';

class CustomSocialButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onPressed;

  CustomSocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Constants.updateFromContext(context);

    final double buttonWidth = Responsive.value<double>(
      context,
      mobile: 136,
      tablet: 150,
      desktop: 164,
    );

    final double buttonHeight = Responsive.value<double>(
      context,
      mobile: 48,
      tablet: 52,
      desktop: 56,
    );

    final double iconSize = Responsive.value<double>(
      context,
      mobile: 16,
      tablet: 18,
      desktop: 20,
    );

    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        color: CustomColors.ghostWhite,
        borderRadius: BorderRadius.circular(
          Responsive.value<double>(
            context,
            mobile: 10,
            tablet: 12,
            desktop: 14,
          ),
        ),
        border: Border.all(
          color: CustomColors.ghostWhite,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.blackBS1,
            blurRadius: Responsive.value<double>(
              context,
              mobile: 5,
              tablet: 6,
              desktop: 7,
            ),
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Responsive.value<double>(
                context,
                mobile: 10,
                tablet: 12,
                desktop: 14,
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: Constants.getFontSmall(context),
                color: CustomColors.black87,
                fontFamily: Constants.primaryfont,
              ),
            ),
            SizedBox(
              width: Constants.getSpacingMedium(context),
              height: Constants.getSpacingMedium(context),
            ),
            Image.asset(
              icon,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}