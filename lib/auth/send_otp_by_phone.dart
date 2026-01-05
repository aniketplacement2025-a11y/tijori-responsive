import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/otp_manager.dart';
import 'package:vkaps_it_solution_project_tijori/auth/forgot_password_page.dart';
import 'package:vkaps_it_solution_project_tijori/auth/signin_login_page.dart';
import 'package:vkaps_it_solution_project_tijori/auth/verify_otp_forgot_password.dart';
import 'package:vkaps_it_solution_project_tijori/services/providers/auth/send_otp_by_phone_provider.dart';

import '../services/settings/loadingIndicator.dart';
import '../services/settings/print_value.dart';
import '../utils/constants.dart';
import '../utils/custom_colors.dart';
import '../utils/onboarding_background.dart';
import '../utils/responsive_media_query.dart';
import 'fields/Intl_custom_phone_field.dart';

class SendOtpByPhone extends StatefulWidget {
  final bool isCommercial;

  SendOtpByPhone({
    super.key,
    required this.isCommercial,
  });

  @override
  State<SendOtpByPhone> createState() => _SendOtpByPhoneState();
}

class _SendOtpByPhoneState extends State<SendOtpByPhone> {
  List<String> send_otp_phone_number = [];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants with context
    Constants.updateFromContext(context);

    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // Back Button - Responsive positioning
            Positioned(
              top: Responsive.value<double>(
                context,
                mobile: 24,
                tablet: 32,
                desktop: 40,
              ),
              left: Responsive.value<double>(
                context,
                mobile: 12,
                tablet: 16,
                desktop: 20,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => SigninLoginPage(
                      isCommercial: widget.isCommercial,
                    )),
                        (route) => false,
                  );
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: CustomColors.black87,
                  size: Responsive.value<double>(
                    context,
                    mobile: 20,
                    tablet: 22,
                    desktop: 24,
                  ),
                ),
              ),
            ),

            // Main Content - Responsive positioning and sizing
            Positioned(
              top: Responsive.value<double>(
                context,
                mobile: 32,
                tablet: 40,
                desktop: 48,
              ),
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.value<double>(
                    context,
                    mobile: 24,
                    tablet: 48,
                    desktop: 64,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title - Responsive
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: isTablet || isDesktop ? Constants.getSpacingMedium(context) : 0,
                        ),
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Responsive.value<double>(
                              context,
                              mobile: Constants.getFontMedium(context),
                              tablet: Constants.getFontMedium(context) * 1.1,
                              desktop: Constants.getFontLarge(context),
                            ),
                            fontWeight: FontWeight.bold,
                            color: CustomColors.black87,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Constants.getSpacingLittle(context)),

                    // Description Text - Responsive
                    Center(
                      child: Container(
                        width: Responsive.value<double>(
                          context,
                          mobile: double.infinity,
                          tablet: 400,
                          desktop: 500,
                        ),
                        child: Text(
                          'Please enter your email to send an OTP for verification',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Constants.getFontLittle(context),
                            color: CustomColors.black87.withOpacity(0.8),
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    SizedBox(height: Constants.getSpacingHigh(context)),

                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          // PHONE FIELD - Already responsive via CustomFormField
                          IntlCustomPhoneField(
                            suffixIcon: Icon(Icons.phone),
                            labelText: 'Company Phone Number',
                            onChanged: (value) {
                              setState(() {
                                send_otp_phone_number = value;
                              });
                            },
                          ),

                          SizedBox(height: Constants.getSpacingHigh(context)),

                          // SEND OTP BUTTON - Responsive
                          Container(
                            width: double.infinity,
                            height: Responsive.value<double>(
                              context,
                              mobile: 48,
                              tablet: 52,
                              desktop: 56,
                            ),
                            decoration: BoxDecoration(
                              color: CustomColors.gradientBlue,
                              borderRadius: BorderRadius.circular(
                                Responsive.value<double>(
                                  context,
                                  mobile: 5,
                                  tablet: 6,
                                  desktop: 8,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: CustomColors.lightWhite.withOpacity(0.5),
                                  blurRadius: Responsive.value<double>(
                                    context,
                                    mobile: 8,
                                    tablet: 10,
                                    desktop: 12,
                                  ),
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ChangeNotifierProvider(
                              create: (BuildContext context) => SendOtpByPhoneProvider(),
                              child: Consumer<SendOtpByPhoneProvider>(
                                builder: (context, provider, child) {
                                  return TextButton(
                                    onPressed: () {
                                      print('CLICKED ON SEND OTP BUTTON');
                                      printValue(send_otp_phone_number,
                                          tag: 'LIST OF STING VALUE');
                                      if(!provider.isLoading){
                                       provider.sendOtpByPhoneProvider(
                                           send_otp_phone_number,
                                           widget.isCommercial,
                                           context
                                       );
                                      }
                                    },
                                    child: provider.isLoading
                                        ? loadingIndicator()
                                        : Text(
                                            'SEND OTP',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontSize: Constants.getFontSmall(context),
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.ghostWhite,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          SizedBox(height: Constants.getSpacingHigh(context)),

                          // Horizontal line
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: CustomColors.littleWhite.withOpacity(0.5),
                          ),

                          SizedBox(height: Constants.getSpacingHigh(context)),

                          Column(
                            children: [
                              Text(
                                'I can\'t get access to my email box right now',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.getFontLittle(context),
                                  color: CustomColors.black87.withOpacity(0.7),
                                ),
                                textAlign: TextAlign.center,
                              ),

                              SizedBox(height: Constants.getSpacingMedium(context)),

                              // SEND OTP BY EMAIL BUTTON - Responsive
                              Container(
                                width: double.infinity,
                                height: Responsive.value<double>(
                                  context,
                                  mobile: 48,
                                  tablet: 52,
                                  desktop: 56,
                                ),
                                decoration: BoxDecoration(
                                  color: CustomColors.ghostWhite,
                                  borderRadius: BorderRadius.circular(
                                    Responsive.value<double>(
                                      context,
                                      mobile: 5,
                                      tablet: 6,
                                      desktop: 8,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.lightWhite.withOpacity(0.5),
                                      blurRadius: Responsive.value<double>(
                                        context,
                                        mobile: 8,
                                        tablet: 10,
                                        desktop: 12,
                                      ),
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    print('CLICKED ON SEND OTP BY EMAIL BUTTON');
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ForgotPasswordPage(
                                              isCommercial: widget.isCommercial
                                          ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'SEND OTP BY EMAIL',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.getFontLittle(context),
                                      fontWeight: FontWeight.w600,
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Extra spacing for larger screens
                          if (isTablet || isDesktop)
                            SizedBox(height: Constants.getSpacingLarge(context) * 2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
