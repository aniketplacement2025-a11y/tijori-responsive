import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/otp_manager.dart';
import 'package:vkaps_it_solution_project_tijori/auth/otp_success_popup.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import '../services/providers/auth/personal_otp_verification_provider.dart';
import '../services/settings/print_value.dart';
import '../utils/Images.dart';

// Reusable Components
import 'package:vkaps_it_solution_project_tijori/auth/fields/otp_input_field.dart';
import '../auth/features/gradient_button.dart';
import '../auth/features/outline_button.dart';
import '../auth/features/back_button.dart';

class OTPVerificationPage extends StatefulWidget {
  final Map<dynamic, dynamic> requestBody;
  final bool isCommercial;
  final VoidCallback? onVerificationSuccess;
  final VoidCallback? onSendOtpByEmail;

  const OTPVerificationPage({
    super.key,
    required this.requestBody,
    this.onVerificationSuccess,
    required this.isCommercial,
    this.onSendOtpByEmail,
  });

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  late OtpManager otp;
  late PersonalOtpVerificationProvider _provider =
  PersonalOtpVerificationProvider(); // Create provider instance

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

  void _handleVerification() {
    String otpValue = otp.getOtp();
    print('Verifying OTP: $otpValue');

    if (otpValue.length != 4) {
      printValue('Please enter a valid 4-digit OTP', tag: 'ERROR');
      // Show snackbar instead of just printing
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid 4-digit OTP')),
      ); }

    Map<String, dynamic> verificationData = {
      'userData': widget.requestBody,
      'otp': otpValue,
    };

    print('Verification Data: $verificationData');

    // Get provider using Provider.of
    // final provider = Provider.of<PersonalOtpVerificationProvider>(context, listen: false);
    // provider.personalUserVerifyOtp(verificationData, context);

    // Use the provider instance directly
    _provider.personalUserVerifyOtp(verificationData, widget.isCommercial, context);
  }

  void _handleSendOtpByEmail() {
    print('SEND OTP BY EMAIL');
    if (widget.onSendOtpByEmail != null) {
      widget.onSendOtpByEmail!();
    }
  }

  String _getMaskedPhoneNumber() {
    try {
      // Extract nested Map (phone)
      Map<String, dynamic> phoneMap =
      widget.requestBody['phone'] as Map<String, dynamic>;
      String countryCode = phoneMap['country_code'] as String;
      String phoneNumber = phoneMap['number'] as String;
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
                              text: _provider.isLoading ? 'VERIFYING...' : 'VERIFY',
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
          width: 1,
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
