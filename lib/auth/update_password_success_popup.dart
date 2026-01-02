import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/button_with_thumsup.dart';
import 'package:vkaps_it_solution_project_tijori/pages/official_landing_page.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/responsive_media_query.dart';

class UpdatePasswordSuccessPopup extends StatelessWidget {
  final bool isCommercial;

  UpdatePasswordSuccessPopup({
    super.key,
    required this.isCommercial,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants with context
    Constants.updateFromContext(context);

    return Scaffold(
      body: OnboardingBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.value<double>(
              context,
              mobile: Constants.getSpacingMedium(context),
              tablet: Constants.getSpacingHigh(context),
              desktop: Constants.getSpacingLarge(context),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // CHANGED TO CENTER
            children: [
              // Back Arrow - Keep at top left but in a centered container
              SizedBox(height: Constants.getSpacingLarge(context)),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: Responsive.value<double>(
                    context,
                    mobile: Constants.getFontMedium(context),
                    tablet: Constants.getFontMedium(context) * 1.2,
                    desktop: Constants.getFontMedium(context) * 1.4,
                  ),
                  height: Responsive.value<double>(
                    context,
                    mobile: Constants.getFontMedium(context),
                    tablet: Constants.getFontMedium(context) * 1.2,
                    desktop: Constants.getFontMedium(context) * 1.4,
                  ),
                  decoration: BoxDecoration(
                    color: CustomColors.lightWhite,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: Responsive.value<double>(
                        context,
                        mobile: 20,
                        tablet: 22,
                        desktop: 24,
                      ),
                    ),
                    padding: EdgeInsets.all(
                      Responsive.value<double>(
                        context,
                        mobile: 8,
                        tablet: 10,
                        desktop: 12,
                      ),
                    ),
                  ),
                ),
              ),

              // Title and Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.value<double>(
                      context,
                      mobile: 36,
                      tablet: 60,
                      desktop: 80,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Password title - Responsive
                      SizedBox(
                        width: Responsive.value<double>(
                          context,
                          mobile: 200,
                          tablet: 250,
                          desktop: 300,
                        ),
                        child: Text(
                          'Password Changed',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontWeight: FontWeight.bold,
                            fontSize: Responsive.value<double>(
                              context,
                              mobile: Constants.getFontMedium(context),
                              tablet: Constants.getFontMedium(context) * 1.1,
                              desktop: Constants.getFontLarge(context),
                            ),
                            color: CustomColors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: Constants.getSpacingSmall(context)),

                      // Description Text - Responsive
                      SizedBox(
                        width: Responsive.value<double>(
                          context,
                          mobile: 240,
                          tablet: 300,
                          desktop: 360,
                        ),
                        child: Text(
                          'Your Password was successfully created',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Responsive.value<double>(
                              context,
                              mobile: 13,
                              tablet: 15,
                              desktop: 16,
                            ),
                            color: CustomColors.black87.withOpacity(0.8),
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: Constants.getSpacingHigh(context)),

                      // Button with thumbs up - Responsive
                      ButtonWithThumsup(
                        imagePath: Images.thumsUp,
                        buttonText: "GET ACCESS TO THE APP",
                        imageWidth: Responsive.value<double>(
                          context,
                          mobile: 238,
                          tablet: 300,
                          desktop: 350,
                        ),
                        imageHeight: Responsive.value<double>(
                          context,
                          mobile: 156,
                          tablet: 196,
                          desktop: 230,
                        ),
                        buttonWidth: Responsive.value<double>(
                          context,
                          mobile: 300,
                          tablet: 380,
                          desktop: 464,
                        ),
                        buttonHeight: Responsive.value<double>(
                          context,
                          mobile: 56,
                          tablet: 60,
                          desktop: 64,
                        ),
                        fontSize: Responsive.value<double>(
                          context,
                          mobile: 14,
                          tablet: 15,
                          desktop: 16,
                        ),
                        onPressed: () {
                          print("Successfully Done Sign Up");
                          // Add navigation or other actions here
                          Navigator.push(
                            context,
                           MaterialPageRoute(
                               builder: (context) => OfficialLandingPage(isCommercial: isCommercial,)
                           ), );
                        },
                      ),

                      // Extra spacing for larger screens
                      if (isTablet || isDesktop)
                        SizedBox(height: Constants.getSpacingLarge(context)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}