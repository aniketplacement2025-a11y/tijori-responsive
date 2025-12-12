import 'package:flutter/material.dart';

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
    return Column(
      children: UpcomingCardListTitles.up_projects.map((project) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: Constants.spacingSmall),
          padding: EdgeInsets.all(Constants.spacingSmall),
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
          child: Column(
            crossAxisAlignment: .start,
            children: [
              // Project Details Card
              Container(
                width: 360,
                height: 116,
                margin: EdgeInsets.only(bottom: Constants.spacingMedium),
                padding: EdgeInsets.all(Constants.spacingSmall),
                decoration: BoxDecoration(
                  color: CustomColors.ghostWhite,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: CustomColors.blackBS1, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    // Row 1: Main Title
                    Container(
                      width: 297,
                      height: 34,
                      // margin: EdgeInsets.only(bottom: 10), // gap: 10px
                      child: Text(
                        project['title']!,
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontSize: Constants.fontSmall,
                          fontWeight: .bold,
                          color: CustomColors.black87,
                        ),
                      ),
                    ),

                    // Row 2: Project Icon + Project Name
                    Row(
                      children: [
                        // Project Icon
                        Container(
                          width: Constants.fontMedium,
                          height: Constants.fontMedium,
                          margin: EdgeInsets.only(
                            right: Constants.spacingSmall,
                          ),
                          child: Image.asset(
                            Images.projectIcon,
                            width: Constants.fontMedium,
                            height: Constants.fontMedium,
                            fit: BoxFit.contain,
                          ),
                        ),

                        // Project Name Text
                        Container(
                          width: 172,
                          height: 20,
                          child: Text(
                            project['sub_title']!, // Variable Text
                            style: TextStyle(
                              fontFamily: Constants.primaryfont,
                              fontSize: Constants.fontLittle,
                              fontWeight: .bold,
                              color: CustomColors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: Constants.spacingSmall),

                    // Row 3: Date, Amount and Menu Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left: Date Container
                        Container(
                          width: 97,
                          height: 26,
                          child: Row(
                            children: [
                              // Calender Icon
                              Container(
                                width: Constants.fontMedium,
                                height: Constants.fontMedium,
                                child: Image.asset(
                                  Images.calenderIcon,
                                  width: Constants.fontMedium,
                                  height: Constants.fontMedium,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              SizedBox(width: 5),

                              // Date Text
                              Container(
                                constraints: BoxConstraints(maxWidth: 68),
                                child: Text(
                                  project['Date']!, // Variable date
                                  style: TextStyle(
                                    fontFamily: Constants.primaryfont,
                                    fontSize: Constants.fontLittle,
                                    color: CustomColors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Center: Amount Container
                        Container(
                          width: 124,
                          height: 26,
                          child: Row(
                            children: [
                              // Money / Dollar Icon
                              Container(
                                width: Constants.fontMedium,
                                height: Constants.fontMedium,
                                child: Image.asset(
                                  Images.circlepercentIcon,
                                  width: Constants.fontMedium,
                                  height: Constants.fontMedium,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              SizedBox(width: Constants.spacingLittle),

                              //Amount Text
                              Container(
                                width: 95,
                                height: 20,
                                child: Text(
                                  project['amount']!,
                                  style: TextStyle(
                                    fontFamily: Constants.primaryfont,
                                    fontSize: Constants.fontLittle,
                                    fontWeight: .w400,
                                    color: CustomColors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Right: Menu Icon
                        Container(
                          width: Constants.fontMedium,
                          height: Constants.fontMedium,
                          child: Image.asset(
                            Images.menuIcon,
                            width: Constants.fontMedium,
                            height: Constants.fontMedium,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: Constants.spacingLittle),

              // Gradient Button Below the card
              GradientButton(
                text: 'VIEW DETAILS',
                onPressed: () {
                  print('VIEW DETAILS tapped');
                },
                width: 360,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
