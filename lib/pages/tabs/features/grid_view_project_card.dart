import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/projects_list_titles.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';

import '../../../utils/Images.dart';

class GridViewProjectCard extends StatefulWidget {
  const GridViewProjectCard({super.key});

  @override
  State<GridViewProjectCard> createState() => _GridViewProjectCardState();
}

class _GridViewProjectCardState extends State<GridViewProjectCard> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // 2 items per row
      crossAxisSpacing: Constants.spacingSmall, // Horizontal spacing
      mainAxisSpacing: Constants.spacingSmall, // Vertical spacing
      childAspectRatio: 175 / 84, // Width / Height ratio
      shrinkWrap: true, // Important for nested scrolling
      physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
      children: ProjectsListTitles.projects.map((project) {
        return Container(
          // width: 175, // Width after click
          // height: 84, // Height after click
          padding: EdgeInsets.all(Constants.spacingMedium),
          decoration: BoxDecoration(
            color: CustomColors.ghostWhite,
            borderRadius: BorderRadius.circular(Constants.spacingMedium),
            boxShadow: [
              BoxShadow(
                color: CustomColors.blackBS1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .spaceBetween,
                children: [
                  // Top: Icon
                  Container(
                    width: Constants.spacingHigh,
                    height: Constants.spacingHigh,
                    child: Image.asset(
                      Images.projectIcon,
                      width: Constants.spacingHigh,
                      height: Constants.spacingHigh,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Bottom: title
                  Container(
                    width: 164,
                    height: 20,
                    child: Text(
                      project['title']!,
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: 12,
                        fontWeight: .bold,
                        color: CustomColors.black87,
                      ),
                    ),
                  ),
                ],
              ),

              // Two images in top- right corner - FIXED
              Positioned(
                top: 0,
                right: 0,
                child: Row(
                  children: [
                    // First icon In Future (rotated -90 deg)
                    Transform.rotate(
                      angle:
                          0, // In Future We rotate it angle: -90 * (3.1415926535 / 180), // -90 degrees
                      child: Container(
                        width: Constants.spacingHigh,
                        height: Constants.spacingHigh,
                        child: Image.asset(
                          Images.bottomarrowIcon,
                          width: Constants.spacingHigh,
                          height: Constants.spacingHigh,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(width: Constants.spacingLittle),

                    // Second icon
                    Container(
                      width: Constants.spacingHigh,
                      height: Constants.spacingHigh,
                      child: Image.asset(
                        Images.menudotIcon,
                        width: Constants.spacingHigh,
                        height: Constants.spacingHigh,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
