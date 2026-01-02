import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';

class IntlCustomPhoneField extends StatelessWidget {
  final String labelText;
  final Function(List<String>) onChanged;
  final Widget? suffixIcon;
  final String? Function(PhoneNumber?)? validator; // Changed to PhoneNumber?

  const IntlCustomPhoneField({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: Constants.getFontLittle(context),
          color: CustomColors.littleWhite,
          fontFamily: Constants.primaryfont,
        ),
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      initialCountryCode: 'IN',
      dropdownTextStyle: TextStyle(
        fontSize: Constants.getFontLittle(context),
        color: CustomColors.littleWhite,
        fontFamily: Constants.primaryfont,
      ),
      validator: validator, // Validator goes here, not in decoration
      onChanged: (phone) {
        onChanged([
          phone.countryCode, // +91
          phone.number,      // 10 digit
        ]);
      },
    );
  }
}
