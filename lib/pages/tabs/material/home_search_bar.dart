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
    return Container(
      height: 40,
      width: Responsive.screenWidth(context) * 0.88,
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CustomColors.blackBS1,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: .center,
        children: [
          SizedBox(width: Constants.spacingMedium),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(
                  fontFamily: Constants.primaryfont,
                  fontSize: 20,
                  color: CustomColors.littleWhite,
                ),
              ),
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontSize: Constants.fontSmall,
                color: CustomColors.lightWhite,
              ),
              onChanged: (value) {
                // Handle search
              },
            ),
          ),
          SizedBox(width: Constants.spacingSmall),
          Icon(
            Icons.search,
            color: CustomColors.littleWhite,
            size: 24,
          ),
          SizedBox(width: Constants.spacingLittle),
        ],
      ),
    );
  }
}
