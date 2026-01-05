import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/services/settings/loadingIndicator.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';

class HomeCategoryCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  HomeCategoryCard({
    super.key,
    this.isSelected = false,
    required this.onTap,
    required this.imageAsset,
    required this.title,
  });

  bool get _isNetworkImage => imageAsset.startsWith('http');

  @override
  Widget build(BuildContext context) {
    Constants.updateFromContext(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Responsive.value<double>(
          context,
          mobile: 185,
          tablet: 195,
          desktop: 205,
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
          color: isSelected ? CustomColors.darkPink : CustomColors.ghostWhite,
          borderRadius: BorderRadius.circular(
            Responsive.value<double>(
              context,
              mobile: 16,
              tablet: 18,
              desktop: 20,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: CustomColors.blackBS1,
              blurRadius: Responsive.value<double>(
                context,
                mobile: 1,
                tablet: 2,
                desktop: 3,
              ),
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon/Image
            Container(
              width: Constants.getSpacingHigh(context),
              height: Constants.getSpacingHigh(context),
              child: _isNetworkImage
                 ? Image.network(
                imageAsset,
                width: Constants.getSpacingHigh(context),
                height: Constants.getSpacingHigh(context),
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress){
                  if(loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null?
                          loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                           :null
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: Constants.getSpacingHigh(context),
                    height: Constants.getSpacingHigh(context),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.category,
                      size: 24,
                      color: Colors.grey[400],
                    ),
                  );
                },
              ):
              Image.asset(
                imageAsset,
                width: Constants.getSpacingHigh(context),
                height: Constants.getSpacingHigh(context),
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: Constants.getSpacingSmall(context)),

            // Title Text
            Container(
              height: Constants.getSpacingHigh(context),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: Constants.primaryfont,
                  fontSize: Constants.getFontSmall(context),
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? Colors.white
                      : CustomColors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}