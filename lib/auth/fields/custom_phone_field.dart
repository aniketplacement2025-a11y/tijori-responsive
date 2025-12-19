import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/Images.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';

class CustomPhoneField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Constants.updateFromContext(context);

    final double fieldHeight = Responsive.value<double>(
      context,
      mobile: 48,
      tablet: 52,
      desktop: 56,
    );

    final double flagSize = Responsive.value<double>(
      context,
      mobile: 20,
      tablet: 22,
      desktop: 24,
    );

    final double countryCodeWidth = Responsive.value<double>(
      context,
      mobile: 96,
      tablet: 104,
      desktop: 112,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Phone Number',
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
            ),
          ],
        ),

        SizedBox(height: Constants.getSpacingLittle(context)),

        Container(
          height: fieldHeight,
          decoration: BoxDecoration(
            color: CustomColors.lightWhite,
            borderRadius: BorderRadius.circular(
              Responsive.value<double>(
                context,
                mobile: 8,
                tablet: 10,
                desktop: 12,
              ),
            ),
          ),
          child: Row(
            children: [
              // Country Code Section
              Container(
                width: countryCodeWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.value<double>(
                    context,
                    mobile: 8,
                    tablet: 10,
                    desktop: 12,
                  ),
                  vertical: Responsive.value<double>(
                    context,
                    mobile: 8,
                    tablet: 10,
                    desktop: 12,
                  ),
                ),
                decoration: BoxDecoration(
                  color: CustomColors.lightWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Responsive.value<double>(
                        context,
                        mobile: 8,
                        tablet: 10,
                        desktop: 12,
                      ),
                    ),
                    bottomLeft: Radius.circular(
                      Responsive.value<double>(
                        context,
                        mobile: 8,
                        tablet: 10,
                        desktop: 12,
                      ),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.flagAsset,
                      width: flagSize,
                      height: flagSize,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: Constants.getSpacingSmall(context)),
                    Text(
                      '+965',
                      style: TextStyle(
                        fontSize: Constants.getFontSmall(context),
                        color: CustomColors.black87,
                        fontFamily: Constants.primaryfont,
                      ),
                    ),
                  ],
                ),
              ),

              // Phone Number Input Section
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.value<double>(
                      context,
                      mobile: 8,
                      tablet: 10,
                      desktop: 12,
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.phone,
                        size: Responsive.value<double>(
                          context,
                          mobile: 20,
                          tablet: 22,
                          desktop: 24,
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: '000 0000',
                      hintStyle: TextStyle(
                        fontSize: Constants.getFontSmall(context),
                        color: CustomColors.littleWhite,
                        fontFamily: Constants.primaryfont,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: Responsive.value<double>(
                          context,
                          mobile: 10,
                          tablet: 12,
                          desktop: 14,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: Constants.getFontSmall(context),
                      color: CustomColors.black87,
                      fontFamily: Constants.primaryfont,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}