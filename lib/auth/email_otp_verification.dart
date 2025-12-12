import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/otp_manager.dart';
import 'package:vkaps_it_solution_project_tijori/auth/otp_success_popup.dart';
import 'package:vkaps_it_solution_project_tijori/auth/otp_verification.dart';
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

class EmailOtpVerification extends StatefulWidget{
  final String email;
  final VoidCallback? onVerificationSuccess;
  final VoidCallback? onSendOtpByPhone;

  const EmailOtpVerification({
    super.key,
    required this.email,
    this.onVerificationSuccess,
    this.onSendOtpByPhone,
 });

  @override
  State<EmailOtpVerification> createState() => _EmailOtpVerificationState();
}

class _EmailOtpVerificationState extends State<EmailOtpVerification>{
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

    // Call the success callback if provided, otherwise use default navigation
    if (widget.onVerificationSuccess != null) {
      widget.onVerificationSuccess!();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UpdateNewPassword())
      );
    }
  }

  void _handleSendOtpByPhone() {
    print('SEND OTP BY EMAIL');
    if (widget.onSendOtpByPhone != null) {
      widget.onSendOtpByPhone!();
    }
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

    // Mask username
    String maskedUsername = username.length > showFirstChars
        ? '${username.substring(0, showFirstChars)}...'
        : '$username...';

    // Mask domain name
    String maskedDomainName = domainName.length > showLastChars
        ? '...${domainName.substring(domainName.length - showLastChars)}'
        : '...$domainName';

    return '$maskedUsername@$maskedDomainName$domainExtension';
  }

  @override
  Widget build(BuildContext context) {
    Constants.screenWidth = Responsive.screenWidth(context);
    Constants.screenHeight = Responsive.screenHeight(context);

    return Scaffold(
      body: OnboardingBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.spacingMedium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                SizedBox(height: Constants.spacingMedium),
                CustomBackButton(
                  onPressed: () => Navigator.of(context).pop(),
                ),

                // Main Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // OTP Title
                        _buildTitle(),
                        SizedBox(height: Constants.spacingSmall),

                        // Description
                        _buildDescription(),
                        SizedBox(height: Constants.spacingSmall),

                        // Phone Number
                        _buildPhoneNumberText(),
                        SizedBox(height: Constants.spacingMedium),

                        // OTP Image
                        _buildOtpImage(),
                        SizedBox(height: Constants.spacingMedium),

                        // OTP Input Fields
                        _buildOtpInputFields(),
                        SizedBox(height: Constants.spacingMedium),

                        // Verify Button
                        GradientButton(
                          text: 'VERIFY',
                          width: 400,
                          onPressed: _handleVerification,
                        ),
                        SizedBox(height: Constants.spacingMedium),

                        // Divider
                        _buildDivider(),
                        SizedBox(height: Constants.spacingMedium),

                        // No Phone Text
                        _buildNoPhoneText(),
                        SizedBox(height: Constants.spacingMedium),

                        // Send OTP by Email Button
                        CustomOutlineButton(
                          text: 'SEND OTP BY PHONE',
                          onPressed: _handleSendOtpByPhone,
                        ),
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

  Widget _buildTitle() {
    return Center(
      child: Text(
        'OTP',
        style: TextStyle(
          fontFamily: Constants.primaryfont,
          fontSize: Constants.fontLarge,
          color: CustomColors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDescription() {
    return Center(
      child: Text(
        'We sent a One Time Password',
        style: TextStyle(
          fontFamily: Constants.primaryfont,
          fontSize: Constants.fontSmall,
          color: CustomColors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildPhoneNumberText() {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'to ',
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontSize: Constants.fontSmall,
                color: CustomColors.black87,
              ),
            ),
            TextSpan(
              text: _getMaskedEmail(),
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontWeight: FontWeight.bold,
                fontSize: Constants.fontMedium,
                color: CustomColors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpImage() {
    return Container(
      width: 180,
      height: 108,
      child: Image.asset(
        Images.otp,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildOtpInputFields() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return OTPInputField(
            controller: otp.controllers[index],
            focusNode: otp.focusNodes[index],
            onChanged: (value) => otp.onOtpChanged(value, index, context),
            autoFocus: index == 0,
          );
        }),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: CustomColors.littleWhite,
    );
  }

  Widget _buildNoPhoneText() {
    return Text(
      'I can\’t get access to my email box right now',
      style: TextStyle(
        fontFamily: Constants.primaryfont,
        fontSize: Constants.fontSmall,
        color: CustomColors.black87,
      ),
      textAlign: TextAlign.center,
    );
  }
}