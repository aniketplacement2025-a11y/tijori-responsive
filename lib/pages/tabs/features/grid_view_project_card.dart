import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/projects_list_titles.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import '../../../utils/Images.dart';

class GridViewProjectCard extends StatefulWidget {
  const GridViewProjectCard({super.key});

  @override
  State<GridViewProjectCard> createState() => _GridViewProjectCardState();
}

class _GridViewProjectCardState extends State<GridViewProjectCard> {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants
    Constants.updateFromContext(context);

    return GridView.count(
      crossAxisCount: Responsive.value<int>(
        context,
        mobile: 2,
        tablet: 3,
        desktop: 4,
      ),
      crossAxisSpacing: Constants.getSpacingSmall(context),
      mainAxisSpacing: Constants.getSpacingSmall(context),
      childAspectRatio: Responsive.value<double>(
        context,
        mobile: 175 / 84,
        tablet: 180 / 86,
        desktop: 185 / 88,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: ProjectsListTitles.projects.map((project) {
        return Container(
          padding: EdgeInsets.all(
            Responsive.value<double>(
              context,
              mobile: Constants.getSpacingMedium(context),
              tablet: Constants.getSpacingMedium(context) * 1.1,
              desktop: Constants.getSpacingMedium(context) * 1.2,
            ),
          ),
          decoration: BoxDecoration(
            color: CustomColors.ghostWhite,
            borderRadius: BorderRadius.circular(
              Responsive.value<double>(
                context,
                mobile: Constants.getSpacingMedium(context),
                tablet: Constants.getSpacingMedium(context) * 1.1,
                desktop: Constants.getSpacingMedium(context) * 1.2,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: CustomColors.blackBS1,
                blurRadius: Responsive.value<double>(
                  context,
                  mobile: 1,
                  tablet: 1.5,
                  desktop: 2,
                ),
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top: Icon
                  Container(
                    width: Constants.getSpacingHigh(context),
                    height: Constants.getSpacingHigh(context),
                    child: Image.asset(
                      Images.projectIcon,
                      width: Constants.getSpacingHigh(context),
                      height: Constants.getSpacingHigh(context),
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Bottom: title
                  Container(
                    width: Responsive.value<double>(
                      context,
                      mobile: 164,
                      tablet: 170,
                      desktop: 176,
                    ),
                    height: Responsive.value<double>(
                      context,
                      mobile: 20,
                      tablet: 22,
                      desktop: 24,
                    ),
                    child: Text(
                      project['title']!,
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Responsive.value<double>(
                          context,
                          mobile: 12,
                          tablet: 13,
                          desktop: 14,
                        ),
                        fontWeight: FontWeight.bold,
                        color: CustomColors.black87,
                      ),
                    ),
                  ),
                ],
              ),

              // Two images in top-right corner
              Positioned(
                top: 0,
                right: 0,
                child: Row(
                  children: [
                    // First icon
                    Transform.rotate(
                      angle: 0,
                      child: Container(
                        width: Constants.getSpacingHigh(context),
                        height: Constants.getSpacingHigh(context),
                        child: Image.asset(
                          Images.bottomarrowIcon,
                          width: Constants.getSpacingHigh(context),
                          height: Constants.getSpacingHigh(context),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(width: Constants.getSpacingLittle(context)),

                    // Second icon
                    Container(
                      width: Constants.getSpacingHigh(context),
                      height: Constants.getSpacingHigh(context),
                      child: Image.asset(
                        Images.menudotIcon,
                        width: Constants.getSpacingHigh(context),
                        height: Constants.getSpacingHigh(context),
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