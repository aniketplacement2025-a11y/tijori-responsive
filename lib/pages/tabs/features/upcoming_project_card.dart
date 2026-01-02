import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import '../../../auth/features/gradient_button.dart';
import '../../../utils/Images.dart';
import '../../../utils/constants.dart';
import '../../../utils/custom_colors.dart';
import '../../others/upcoming_card_list_titles.dart';

class UpcomingProjectCard extends StatefulWidget {
  const UpcomingProjectCard({super.key});

  @override
  State<UpcomingProjectCard> createState() => _UpcomingProjectCardState();
}

class _UpcomingProjectCardState extends State<UpcomingProjectCard> {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants
    Constants.updateFromContext(context);

    final double cardWidth = Responsive.value<double>(
      context,
      mobile: 360,
      tablet: 380,
      desktop: 400,
    );

    final double innerCardWidth = Responsive.value<double>(
      context,
      mobile: 360,
      tablet: 380,
      desktop: 400,
    );

    return Column(
      children: UpcomingCardListTitles.up_projects.map((project) {
        return Container(
          alignment: .center,
          margin: EdgeInsets.only(bottom: Constants.getSpacingMedium(context)),
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
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Project Details Card
              Container(
                width: innerCardWidth,
                height: Responsive.value<double>(
                  context,
                  mobile: 116,
                  tablet: 124,
                  desktop: 132,
                ),
                margin: EdgeInsets.only(bottom: Constants.getSpacingMedium(context)),
                padding: EdgeInsets.all(
                  Responsive.value<double>(
                    context,
                    mobile: Constants.getSpacingSmall(context),
                    tablet: Constants.getSpacingSmall(context) * 1.1,
                    desktop: Constants.getSpacingSmall(context) * 1.2,
                  ),
                ),
                decoration: BoxDecoration(
                  color: CustomColors.ghostWhite,
                  borderRadius: BorderRadius.circular(
                    Responsive.value<double>(
                      context,
                      mobile: 10,
                      tablet: 12,
                      desktop: 14,
                    ),
                  ),
                  border: Border.all(
                    color: CustomColors.blackBS1,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row 1: Main Title
                    Container(
                      width: Responsive.value<double>(
                        context,
                        mobile: 297,
                        tablet: 317,
                        desktop: 337,
                      ),
                      height: Responsive.value<double>(
                        context,
                        mobile: 34,
                        tablet: 36,
                        desktop: 38,
                      ),
                      child: Text(
                        project['title']!,
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontSize: Constants.getFontSmall(context),
                          fontWeight: FontWeight.bold,
                          color: CustomColors.black87,
                        ),
                      ),
                    ),

                    // Row 2: Project Icon + Project Name
                    Row(
                      children: [
                        // Project Icon
                        Container(
                          width: Constants.getFontMedium(context),
                          height: Constants.getFontMedium(context),
                          margin: EdgeInsets.only(
                            right: Constants.getSpacingSmall(context),
                          ),
                          child: Image.asset(
                            Images.projectIcon,
                            width: Constants.getFontMedium(context),
                            height: Constants.getFontMedium(context),
                            fit: BoxFit.contain,
                          ),
                        ),

                        // Project Name Text
                        Container(
                          width: Responsive.value<double>(
                            context,
                            mobile: 172,
                            tablet: 182,
                            desktop: 192,
                          ),
                          height: Responsive.value<double>(
                            context,
                            mobile: 20,
                            tablet: 22,
                            desktop: 24,
                          ),
                          child: Text(
                            project['sub_title']!,
                            style: TextStyle(
                              fontFamily: Constants.primaryfont,
                              fontSize: Constants.getFontLittle(context),
                              fontWeight: FontWeight.bold,
                              color: CustomColors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: Constants.getSpacingSmall(context)),

                    // Row 3: Date, Amount and Menu Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left: Date Container
                        Container(
                          width: Responsive.value<double>(
                            context,
                            mobile: 97,
                            tablet: 107,
                            desktop: 117,
                          ),
                          height: Responsive.value<double>(
                            context,
                            mobile: 26,
                            tablet: 28,
                            desktop: 30,
                          ),
                          child: Row(
                            children: [
                              // Calendar Icon
                              Container(
                                width: Constants.getFontMedium(context),
                                height: Constants.getFontMedium(context),
                                child: Image.asset(
                                  Images.calenderIcon,
                                  width: Constants.getFontMedium(context),
                                  height: Constants.getFontMedium(context),
                                  fit: BoxFit.contain,
                                ),
                              ),

                              SizedBox(width: Constants.getSpacingLittle(context)),

                              // Date Text
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: Responsive.value<double>(
                                    context,
                                    mobile: 68,
                                    tablet: 72,
                                    desktop: 76,
                                  ),
                                ),
                                child: Text(
                                  project['Date']!,
                                  style: TextStyle(
                                    fontFamily: Constants.primaryfont,
                                    fontSize: Constants.getFontLittle(context),
                                    color: CustomColors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Center: Amount Container
                        Container(
                          width: Responsive.value<double>(
                            context,
                            mobile: 124,
                            tablet: 134,
                            desktop: 144,
                          ),
                          height: Responsive.value<double>(
                            context,
                            mobile: 26,
                            tablet: 28,
                            desktop: 30,
                          ),
                          child: Row(
                            children: [
                              // Money / Dollar Icon
                              Container(
                                width: Constants.getFontMedium(context),
                                height: Constants.getFontMedium(context),
                                child: Image.asset(
                                  Images.circlepercentIcon,
                                  width: Constants.getFontMedium(context),
                                  height: Constants.getFontMedium(context),
                                  fit: BoxFit.contain,
                                ),
                              ),

                              SizedBox(width: Constants.getSpacingLittle(context)),

                              // Amount Text
                              Container(
                                width: Responsive.value<double>(
                                  context,
                                  mobile: 95,
                                  tablet: 100,
                                  desktop: 105,
                                ),
                                height: Responsive.value<double>(
                                  context,
                                  mobile: 20,
                                  tablet: 22,
                                  desktop: 24,
                                ),
                                child: Text(
                                  project['amount']!,
                                  style: TextStyle(
                                    fontFamily: Constants.primaryfont,
                                    fontSize: Constants.getFontLittle(context),
                                    fontWeight: FontWeight.w400,
                                    color: CustomColors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Right: Menu Icon
                        Container(
                          width: Constants.getFontMedium(context),
                          height: Constants.getFontMedium(context),
                          child: Image.asset(
                            Images.menuIcon,
                            width: Constants.getFontMedium(context),
                            height: Constants.getFontMedium(context),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: Constants.getSpacingLittle(context)),

              // Gradient Button Below the card
              GradientButton(
                text: 'VIEW DETAILS',
                onPressed: () {
                  print('VIEW DETAILS tapped');
                },
                width: innerCardWidth,
                height: Responsive.value<double>(
                  context,
                  mobile: 48,
                  tablet: 52,
                  desktop: 56,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}