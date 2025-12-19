import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../utils/custom_colors.dart';
import '../../../utils/responsive_media_query.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    // Update constants
    Constants.updateFromContext(context);

    return Container(
      height: Responsive.value<double>(
        context,
        mobile: 40,
        tablet: 44,
        desktop: 48,
      ),
      width: Responsive.screenWidth(context) * (isMobile ? 0.9 : 0.85),
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(
          Responsive.value<double>(
            context,
            mobile: 12,
            tablet: 14,
            desktop: 16,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.blackBS1,
            blurRadius: Responsive.value<double>(
              context,
              mobile: 8,
              tablet: 9,
              desktop: 10,
            ),
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: Constants.getSpacingMedium(context)),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(
                  fontFamily: Constants.primaryfont,
                  fontSize: Constants.getFontMedium(context),
                  color: CustomColors.littleWhite,
                ),
              ),
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontSize: Constants.getFontSmall(context),
                color: CustomColors.black87,
              ),
              onChanged: (value) {
                // Handle search
              },
            ),
          ),
          SizedBox(width: Constants.getSpacingSmall(context)),
          Icon(
            Icons.search,
            color: CustomColors.littleWhite,
            size: Responsive.value<double>(
              context,
              mobile: 24,
              tablet: 26,
              desktop: 28,
            ),
          ),
          SizedBox(width: Constants.getSpacingLittle(context)),
        ],
      ),
    );
  }
}