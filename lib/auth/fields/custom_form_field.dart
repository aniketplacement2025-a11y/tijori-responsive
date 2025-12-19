import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const CustomFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    // Update constants with context
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
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(
            fontSize: Constants.getFontSmall(context),
            color: CustomColors.black87,
            fontFamily: Constants.primaryfont,
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
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
                mobile: 12,
                tablet: 14,
                desktop: 16,
              ),
              vertical: Responsive.value<double>(
                context,
                mobile: 14,
                tablet: 16,
                desktop: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
}