import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';

import '../services/providers/verify_otp_forgot_password_provider.dart';
import '../services/settings/print_value.dart';
import '../utils/Images.dart';
import '../utils/constants.dart';
import '../utils/custom_colors.dart';
import '../utils/responsive_media_query.dart';
import 'features/back_button.dart';
import 'features/gradient_button.dart';
import 'features/otp_manager.dart';
import 'features/outline_button.dart';
import 'fields/otp_input_field.dart';

class VerifyOtpForgotPassword extends StatefulWidget {
  final bool isCommercial;
  final List<String> completePhoneNumber;

  VerifyOtpForgotPassword({
    super.key,
    required this.isCommercial,
    required this.completePhoneNumber,
  });

  @override
  State<VerifyOtpForgotPassword> createState() => _VerifyOtpForgotPasswordState();
}

class _VerifyOtpForgotPasswordState extends State<VerifyOtpForgotPassword> {
  late OtpManager otp;
  late VerifyOtpForgotPasswordProvider _provider = VerifyOtpForgotPasswordProvider();

  @override
  void initState() {
    super.initState();
    otp = OtpManager(length: 4);
    otp.init();
  }

  @override
  void dispose() {
    otp.dispose();
    super.dispose();
  }

  void _handleVerification(){
    try {
      String otpValue = otp.getOtp();
      print('Verifying OTP: $otpValue');

      // Debug: Print the completePhoneNumber
      print('completePhoneNumber: ${widget.completePhoneNumber}');
      print('completePhoneNumber length: ${widget.completePhoneNumber?.length}');

      // Validate OTP length
      if (otpValue.length != 4) {
        _showErrorSnackBar('Please enter a valid 4-digit OTP');
        return;
      }

      if (widget.completePhoneNumber.length < 2) {
        print('ERROR: completePhoneNumber has only ${widget.completePhoneNumber.length} elements');
        print('Complete list: $widget.completePhoneNumber');
        _showErrorSnackBar('Invalid phone number format');
        return;
      }

      // Call API or next step
      _provider.verifyOtpForgotPassword(widget.completePhoneNumber, otpValue, widget.isCommercial, context);

    } catch (e, stackTrace) {
      print('EXCEPTION in _handleVerification: $e');
      print('Stack trace: $stackTrace');
      _showErrorSnackBar('An error occurred: $e');
    }
  }

  void _showErrorSnackBar(String message) {
    printValue(message, tag: 'ERROR');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }


  void _handleSendOtpByEmail() {
    print('SEND OTP BY EMAIL');
    // if (widget.onSendOtpByEmail != null) {
    //   widget.onSendOtpByEmail!();
    // }
  }

  String _getMaskedPhoneNumber() {
    try {
      // Extract nested Map (phone)
      List<String> phoneMap = widget.completePhoneNumber as List<String>;
      String countryCode = phoneMap[0] as String;
      String phoneNumber = phoneMap[1] as String;
      if (phoneNumber.length > 4) {
        return '${countryCode} ${phoneNumber.substring(0, 2)}** **${phoneNumber.substring(phoneNumber.length - 2)}';
      }
      return '$countryCode ** ** **';
    } catch (e) {
      return '+965 ** ** **';
    }
  }

  // Responsive padding helper
  EdgeInsets _getResponsivePadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: Responsive.value<double>(
        context,
        mobile: Constants.getSpacingMedium(context),
        tablet: Constants.getSpacingHigh(context),
        desktop: Constants.getSpacingLarge(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants with context
    Constants.updateFromContext(context);

    return Scaffold(
      body: OnboardingBackground(
          child: SafeArea(
              child: Padding(
                  padding: _getResponsivePadding(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Back Button
                    SizedBox(height: Constants.getSpacingMedium(context)),
                    CustomBackButton(onPressed: () => Navigator.of(context).pop()),

                    // Main Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: Responsive.value<double>(
                            context,
                            mobile: 24,
                            tablet: 32,
                            desktop: 40,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // OTP Title
                            _buildTitle(context),
                            SizedBox(height: Constants.getSpacingSmall(context)),

                            // Description
                            _buildDescription(context),
                            SizedBox(height: Constants.getSpacingSmall(context)),

                            // Phone Number
                            _buildPhoneNumberText(context),
                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // OTP Image
                            _buildOtpImage(context),
                            SizedBox(height: Constants.getSpacingHigh(context)),

                            // OTP Input Fields
                            _buildOtpInputFields(context),
                            SizedBox(height: Constants.getSpacingHigh(context)),

                            // Verify Button
                            StatefulBuilder(
                                builder: (context, setState) {
                                  return
                                    GradientButton(
                                      text: 'VERIFY',
                                      width: Responsive.value<double>(
                                        context,
                                        mobile: 300,
                                        tablet: 350,
                                        desktop: 400,
                                      ),
                                      height: Responsive.value<double>(
                                        context,
                                        mobile: 50,
                                        tablet: 55,
                                        desktop: 60,
                                      ),
                                      onPressed: _handleVerification,
                                    );
                                }
                            ),
                            SizedBox(height: Constants.getSpacingHigh(context)),

                            // Divider
                            _buildDivider(context),
                            SizedBox(height: Constants.getSpacingHigh(context)),

                            // No Phone Text
                            _buildNoPhoneText(context),
                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // Send OTP by Email Button
                            CustomOutlineButton(
                              text: 'SEND OTP BY EMAIL',
                              width: Responsive.value<double>(
                                context,
                                mobile: 300,
                                tablet: 350,
                                desktop: 400,
                              ),
                              height: Responsive.value<double>(
                                context,
                                mobile: 50,
                                tablet: 55,
                                desktop: 60,
                              ),
                              onPressed: _handleSendOtpByEmail,
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
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Center(
      child: Text(
        'OTP',
        style: TextStyle(
          fontFamily: Constants.primaryfont,
          fontSize: Constants.getFontLarge(context),
          fontWeight: FontWeight.bold,
          color: CustomColors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Center(
      child: Text(
        'We sent a One Time Password',
        style: TextStyle(
          fontFamily: Constants.primaryfont,
          fontSize: Constants.getFontSmall(context),
          color: CustomColors.black87.withOpacity(0.8),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildPhoneNumberText(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'to ',
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontSize: Constants.getFontSmall(context),
                color: CustomColors.black87.withOpacity(0.8),
              ),
            ),
            TextSpan(
              text: _getMaskedPhoneNumber(),
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontWeight: FontWeight.bold,
                fontSize: Constants.getFontMedium(context),
                color: CustomColors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpImage(BuildContext context) {
    final double imageSize = Responsive.value<double>(
      context,
      mobile: 180,
      tablet: 220,
      desktop: 250,
    );

    return Container(
      width: imageSize,
      height: imageSize * 0.6, // Maintain aspect ratio
      decoration: BoxDecoration(
        color: CustomColors.ghostWhite.withOpacity(0.6),
        shape: BoxShape.circle,
        border: Border.all(
          color: CustomColors.lightWhite,
          width: Responsive.value<double>(
            context,
            mobile: 1.0,
            tablet: 1.2,
            desktop: 1.5,
          ),
        ),
      ),
      child: Image.asset(Images.otp, fit: BoxFit.contain),
    );
  }

  Widget _buildOtpInputFields(BuildContext context) {
    final double spacing = Responsive.value<double>(
      context,
      mobile: 16,
      tablet: 20,
      desktop: 24,
    );

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing / 2),
            child: OTPInputField(
              controller: otp.controllers[index],
              focusNode: otp.focusNodes[index],
              onChanged: (value) => otp.onOtpChanged(value, index, context),
              autoFocus: index == 0,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      margin: EdgeInsets.symmetric(
        horizontal: Responsive.value<double>(
          context,
          mobile: 20,
          tablet: 40,
          desktop: 60,
        ),
      ),
      color: CustomColors.littleWhite,
    );
  }

  Widget _buildNoPhoneText(BuildContext context) {
    return Text(
      'I don\'t have my phone right now',
      style: TextStyle(
        fontFamily: Constants.primaryfont,
        fontSize: Constants.getFontSmall(context),
        color: CustomColors.black87.withOpacity(0.8),
      ),
      textAlign: TextAlign.center,
    );
  }
}
