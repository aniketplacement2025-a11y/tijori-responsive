import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';

class OTPInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final bool autoFocus;

  const OTPInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    // Responsive dimensions
    final double fieldSize = Responsive.value<double>(
      context,
      mobile: 64.0,
      tablet: 72.0,
      desktop: 80.0,
    );

    final double fontSize = Responsive.value<double>(
      context,
      mobile: Constants.getFontMedium(context),
      tablet: Constants.getFontMedium(context) * 1.1,
      desktop: Constants.getFontMedium(context) * 1.2,
    );

    final double circlePadding = Responsive.value<double>(
      context,
      mobile: 8.0,
      tablet: 10.0,
      desktop: 12.0,
    );

    return Container(
      width: fieldSize,
      height: fieldSize * 1.2, // Maintain aspect ratio
      decoration: BoxDecoration(
        color: CustomColors.ghostWhite.withOpacity(0.6),
        shape: BoxShape.circle,
        border: Border.all(
          color: CustomColors.littleWhite,
          width: Responsive.value<double>(
            context,
            mobile: 1.0,
            tablet: 1.2,
            desktop: 1.5,
          ),
        ),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          textAlignVertical: TextAlignVertical.center, // Add this
          maxLength: 1,
          style: TextStyle(
            fontFamily: Constants.primaryfont,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: CustomColors.black87,
            height: 1.0, // Ensure line height is exactly 1
          ),
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero, // Remove all padding
            isDense: true, // Makes the TextField smaller
            constraints: BoxConstraints(
              maxHeight: fieldSize - circlePadding * 2,
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}