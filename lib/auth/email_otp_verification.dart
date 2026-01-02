import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/otp_manager.dart';
import 'package:vkaps_it_solution_project_tijori/auth/otp_success_popup.dart';
import 'package:vkaps_it_solution_project_tijori/auth/otp_verification.dart';
import 'package:vkaps_it_solution_project_tijori/auth/send_otp_by_phone.dart';
import 'package:vkaps_it_solution_project_tijori/auth/update_new_password.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import '../utils/Images.dart';

// Reusable Components
import 'package:vkaps_it_solution_project_tijori/auth/fields/otp_input_field.dart';
import '../auth/features/gradient_button.dart';
import '../auth/features/outline_button.dart';
import '../auth/features/back_button.dart';

class EmailOtpVerification extends StatefulWidget {
  final bool isCommercial;
  final String email;
  final VoidCallback? onVerificationSuccess;
  final VoidCallback? onSendOtpByPhone;

  const EmailOtpVerification({
    super.key,
    required this.email,
    required this.isCommercial,
    this.onVerificationSuccess,
    this.onSendOtpByPhone,
  });

  @override
  State<EmailOtpVerification> createState() => _EmailOtpVerificationState();
}

class _EmailOtpVerificationState extends State<EmailOtpVerification> {
  late OtpManager otp;

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

    if (widget.onVerificationSuccess != null) {
      widget.onVerificationSuccess!();
    } else {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => UpdateNewPassword()),
      // );
      print('VERIFY OTP BY EMAIL NUMBER');
    }
  }

  void _handleSendOtpByPhone() {
    print('CLICKED ON SEND OTP BY PHONE BUTTON');
    Navigator.push(
        context,
        MaterialPageRoute(builder:
            (context) => SendOtpByPhone(
              isCommercial: widget.isCommercial,
            )
        ),
    );
  }

  String _getMaskedEmail({int showFirstChars = 2, int showLastChars = 2}) {
    if (widget.email.isEmpty) return 'user@domain.com';

    final email = widget.email;
    final atIndex = email.indexOf('@');

    if (atIndex == -1) return email;

    final username = email.substring(0, atIndex);
    final domain = email.substring(atIndex + 1);
    final dotIndex = domain.lastIndexOf('.');

    if (dotIndex == -1) return email;

    final domainName = domain.substring(0, dotIndex);
    final domainExtension = domain.substring(dotIndex);

    String maskedUsername = username.length > showFirstChars
        ? '${username.substring(0, showFirstChars)}...'
        : '$username...';

    String maskedDomainName = domainName.length > showLastChars
        ? '...${domainName.substring(domainName.length - showLastChars)}'
        : '...$domainName';

    return '$maskedUsername@$maskedDomainName$domainExtension';
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
                CustomBackButton(
                  onPressed: () => Navigator.of(context).pop(),
                ),

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

                        // Email Text
                        _buildEmailText(context),
                        SizedBox(height: Constants.getSpacingMedium(context)),

                        // OTP Image
                        _buildOtpImage(context),
                        SizedBox(height: Constants.getSpacingHigh(context)),

                        // OTP Input Fields
                        _buildOtpInputFields(context),
                        SizedBox(height: Constants.getSpacingHigh(context)),

                        // Verify Button
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
                        ),
                        SizedBox(height: Constants.getSpacingHigh(context)),

                        // Divider
                        _buildDivider(context),
                        SizedBox(height: Constants.getSpacingHigh(context)),

                        // No Email Text
                        _buildNoEmailText(context),
                        SizedBox(height: Constants.getSpacingMedium(context)),

                        // Send OTP by Phone Button
                        CustomOutlineButton(
                          text: 'SEND OTP BY PHONE',
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
                          onPressed: _handleSendOtpByPhone,
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

  Widget _buildEmailText(BuildContext context) {
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
              text: _getMaskedEmail(),
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
      child: Image.asset(
        Images.otp,
        fit: BoxFit.contain,
      ),
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

  Widget _buildNoEmailText(BuildContext context) {
    return Container(
      width: Responsive.value<double>(
        context,
        mobile: double.infinity,
        tablet: 350,
        desktop: 400,
      ),
      child: Text(
        'I can\’t get access to my email box right now',
        style: TextStyle(
          fontFamily: Constants.primaryfont,
          fontSize: Constants.getFontSmall(context),
          color: CustomColors.black87.withOpacity(0.8),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}