import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';

class OnlyCustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final String hintText;

  OnlyCustomFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
