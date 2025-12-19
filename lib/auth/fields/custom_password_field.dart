import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';

class CustomPasswordField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggle;
  final String? Function(String?)? validator;

  const CustomPasswordField({
    super.key,
    required this.label,
    required this.controller,
    required this.obscureText,
    required this.onToggle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    Constants.updateFromContext(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: Constants.getFontSmall(context),
                color: CustomColors.littleWhite,
                fontFamily: Constants.primaryfont,
              ),
            ),
            Text(
              ' *',
              style: TextStyle(
                fontSize: Constants.getFontSmall(context),
                color: CustomColors.red,
                fontFamily: Constants.primaryfont,
              ),
            )
          ],
        ),
        SizedBox(height: Constants.getSpacingLittle(context)),

        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          style: TextStyle(
            fontSize: Constants.getFontSmall(context),
            color: CustomColors.black87,
            fontFamily: Constants.primaryfont,
          ),
          decoration: InputDecoration(
            hintText: '*********',
            hintStyle: TextStyle(
              fontSize: Constants.getFontLittle(context),
              color: CustomColors.littleWhite,
              fontFamily: Constants.primaryfont,
            ),
            filled: true,
            fillColor: CustomColors.lightWhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Responsive.value<double>(
                  context,
                  mobile: 8,
                  tablet: 10,
                  desktop: 12,
                ),
              ),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: Responsive.value<double>(
                context,
                mobile: 16,
                tablet: 18,
                desktop: 20,
              ),
              vertical: Responsive.value<double>(
                context,
                mobile: 14,
                tablet: 16,
                desktop: 18,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: onToggle,
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[600],
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
                  mobile: 8,
                  tablet: 10,
                  desktop: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}