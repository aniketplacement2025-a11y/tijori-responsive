import 'package:flutter/material.dart';

import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';

class CompaniesAndBranchesList extends StatelessWidget {
  final List<ListItem> items;

  CompaniesAndBranchesList({super.key}) : items = [
    ListItem(
      image: Images.building,
      title: 'Companies and Branches',
      isChecked: false,
      onTap: () {
        print('Companies and Branches tapped');
      },
    ),
    ListItem(
      image: Images.book,
      title: 'List of Workers',
      isChecked: false,
      onTap: () {
        print('List of Workers tapped');
      },
    ),
    ListItem(
      image: Images.clock,
      title: 'My Appointments',
      isChecked: true,
      onTap: () {
        print('My Appointments tapped');
      },
    ),
    ListItem(
      image: Images.newspaper,
      title: 'My Invoices',
      isChecked: false,
      onTap: () {
        print('My Invoices tapped');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: .center,
      children: [
        // List items
        Column(
          children: items.map((item) => _buildListItem(item, context)).toList(),
        ),
      ],
    );
  }

  Widget _buildListItem(ListItem item, BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        width: double.infinity,
        height: Responsive.value<double>(
          context,
          mobile: 68,
          tablet: 72,
          desktop: 76,
        ),
        margin: EdgeInsets.only(
          bottom: Constants.getSpacingSmall(context),
        ),
        padding: EdgeInsets.all(
          Responsive.value<double>(
            context,
            mobile: 16,
            tablet: 18,
            desktop: 20,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(
            Responsive.value<double>(
              context,
              mobile: 16,
              tablet: 20,
              desktop: 24,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side: Icon + Text
            Row(
              children: [
                // Icon
                Container(
                  width: Responsive.value<double>(
                    context,
                    mobile: 24,
                    tablet: 28,
                    desktop: 32,
                  ),
                  height: Responsive.value<double>(
                    context,
                    mobile: 24,
                    tablet: 28,
                    desktop: 32,
                  ),
                  child: Center(
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                SizedBox(width: Constants.getSpacingMedium(context)),

                // Text
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: Constants.getFontSmall(context),
                    fontWeight: FontWeight.w500,
                    color: CustomColors.white,
                  ),
                ),
              ],
            ),

            // Right side: Arrow icon
            Container(
              width: Responsive.value<double>(
                context,
                mobile: 28,
                tablet: 32,
                desktop: 36,
              ),
              height: Responsive.value<double>(
                context,
                mobile: 28,
                tablet: 32,
                desktop: 36,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: Responsive.value<double>(
                    context,
                    mobile: 28,
                    tablet: 32,
                    desktop: 36,
                  ),
                  color: CustomColors.ghostWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem {
  final String image;
  final String title;
  final bool isChecked;
  final VoidCallback onTap;

  ListItem({
    required this.image,
    required this.title,
    required this.isChecked,
    required this.onTap,
  });
}