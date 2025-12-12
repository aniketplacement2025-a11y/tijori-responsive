import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';

class HomeCategoryCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final bool isSelected; // New Parameter
  final VoidCallback onTap; // New Parameter

  HomeCategoryCard({
    super.key,
    this.isSelected = false,
    required this.onTap,
    required this.imageAsset,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 156, // Width: 190px
        //height: 24, // height: 110px
        padding: EdgeInsets.all(16), // padding: 16px
        decoration: BoxDecoration(
          color: isSelected ? CustomColors.darkPink : CustomColors.ghostWhite,
          borderRadius: BorderRadius.circular(16), // 16px border radius
          boxShadow: [
            BoxShadow(
              color: CustomColors.blackBS1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
          children: [
            // Icon/Image
            Container(
              width: Constants.spacingHigh,
              height: Constants.spacingHigh,
              child: Image.asset(
                imageAsset,
                width: Constants.spacingHigh,
                height: Constants.spacingHigh,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: Constants.spacingSmall),

            //Title Text
            Container(
              width: 120,
              height: Constants.spacingHigh,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: Constants.primaryfont,
                  fontSize: Constants.fontSmall,
                  fontWeight: .bold,
                  color: isSelected
                      ? Colors.white
                      : CustomColors
                            .black87, // Optional: change text color when selected
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
