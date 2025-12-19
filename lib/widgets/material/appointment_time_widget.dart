import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import '../../utils/Images.dart';

class AppointmentTimeWidget extends StatelessWidget {
  const AppointmentTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants
    Constants.updateFromContext(context);

    // Responsive dimensions
    final double containerWidth = Responsive.value<double>(
      context,
      mobile: 400,
      tablet: 450,
      desktop: 500,
    );

    final double containerHeight = Responsive.value<double>(
      context,
      mobile: 85,
      tablet: 95,
      desktop: 105,
    );

    final double inputHeight = Responsive.value<double>(
      context,
      mobile: 56,
      tablet: 60,
      desktop: 64,
    );

    return Container(
      height: containerHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row - Label
          Container(
            width: containerWidth - 65,
            height: Constants.getFontMedium(context),
            alignment: Alignment.centerLeft,
            child: Text(
              'Appointment time',
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: Constants.getFontSmall(context),
                color: CustomColors.littleWhite,
              ),
            ),
          ),

          SizedBox(height: Responsive.value<double>(
            context,
            mobile: 5,
            tablet: 6,
            desktop: 7,
          )),

          // Second Row - Input fields
          Container(
            height: inputHeight,
            child: Row(
              children: [
                // Hours TextField
                Container(
                  width: Responsive.value<double>(
                    context,
                    mobile: 134,
                    tablet: 148,
                    desktop: 164,
                  ),
                  height: inputHeight,
                  decoration: BoxDecoration(
                    color: const Color(0x0A000000), // #00000005
                    borderRadius: BorderRadius.circular(
                      Responsive.value<double>(
                        context,
                        mobile: 20,
                        tablet: 22,
                        desktop: 24,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(
                    Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
                    Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
                    Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
                    Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Hours',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontWeight: FontWeight.w400,
                        fontSize: Constants.getFontSmall(context),
                        color: CustomColors.littleWhite,
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.getFontSmall(context),
                      color: CustomColors.black87,
                    ),
                  ),
                ),

                SizedBox(width: Responsive.value<double>(
                  context,
                  mobile: 5,
                  tablet: 6,
                  desktop: 7,
                )),

                // Colon Text
                Container(
                  height: inputHeight,
                  alignment: Alignment.center,
                  child: Text(
                    ':',
                    style: TextStyle(
                      fontSize: Responsive.value<double>(
                        context,
                        mobile: 20,
                        tablet: 22,
                        desktop: 24,
                      ),
                      fontWeight: FontWeight.bold,
                      color: CustomColors.black87,
                    ),
                  ),
                ),

                SizedBox(width: Responsive.value<double>(
                  context,
                  mobile: 5,
                  tablet: 6,
                  desktop: 7,
                )),

                // Minutes TextField
                Container(
                  width: Responsive.value<double>(
                    context,
                    mobile: 134,
                    tablet: 148,
                    desktop: 164,
                  ),
                  height: inputHeight,
                  decoration: BoxDecoration(
                    color: const Color(0x0A000000), // #00000005
                    borderRadius: BorderRadius.circular(
                      Responsive.value<double>(
                        context,
                        mobile: 20,
                        tablet: 22,
                        desktop: 24,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(
                    Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
                    Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
                    Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
                    Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Minutes',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontWeight: FontWeight.w400,
                        fontSize: Constants.getFontSmall(context),
                        color: CustomColors.littleWhite,
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.getFontSmall(context),
                      color: CustomColors.black87,
                    ),
                  ),
                ),

                SizedBox(width: Responsive.value<double>(
                  context,
                  mobile: 5,
                  tablet: 6,
                  desktop: 7,
                )),

                // AM/PM Box
                Container(
                  width: Responsive.value<double>(
                    context,
                    mobile: 124,
                    tablet: 148,
                    desktop: 164,
                  ),
                  height: inputHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Responsive.value<double>(
                        context,
                        mobile: 20,
                        tablet: 22,
                        desktop: 24,
                      ),
                    ),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(
                    Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
                    Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
                    Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
                    Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'AM',
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontWeight: FontWeight.w600,
                          fontSize: Constants.getFontSmall(context),
                          height: 1.0,
                          letterSpacing: 0,
                          color: CustomColors.black87,
                        ),
                      ),
                      Image.asset(
                        Images.bottomarrowIcon,
                        width: Responsive.value<double>(
                          context,
                          mobile: 16,
                          tablet: 18,
                          desktop: 20,
                        ),
                        height: Responsive.value<double>(
                          context,
                          mobile: 16,
                          tablet: 18,
                          desktop: 20,
                        ),
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}