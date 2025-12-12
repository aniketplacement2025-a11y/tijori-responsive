import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';

class CustomSocialButton extends StatelessWidget{
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
    // TODO: implement build
    return Container(
      width: 136,
      height: 48,
      decoration: BoxDecoration(
        color: CustomColors.ghostWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: CustomColors.ghostWhite,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
           color: CustomColors.blackBS1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: CustomColors.black87,
                ),
              ),
              SizedBox(height: Constants.spacingMedium, width: Constants.spacingMedium),
              Image.asset(
                icon,
                width: 16,
                fit: BoxFit.cover,
              ),
            ],
          ),
     ),
    );
  }
}