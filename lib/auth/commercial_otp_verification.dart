import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/otp_manager.dart';
import 'package:vkaps_it_solution_project_tijori/services/providers/commercial_user_verify_otp_provider.dart';

import '../utils/Images.dart';
import '../utils/constants.dart';
import '../utils/custom_colors.dart';
import '../utils/onboarding_background.dart';
import '../utils/responsive_media_query.dart';
import 'features/back_button.dart';
import 'features/gradient_button.dart';
import 'features/outline_button.dart';
import 'fields/otp_input_field.dart';

class CommercialOtpVerification extends StatefulWidget {

  final Map<dynamic, dynamic> requestBody;
  final bool isCommercial;

  CommercialOtpVerification({
    super.key,
    required this.requestBody,
    required this.isCommercial,
  });

  @override
  State<CommercialOtpVerification> createState() => _CommercialOtpVerificationState();
}

class _CommercialOtpVerificationState extends State<CommercialOtpVerification> {
  late OtpManager otp;
  late CommercialUserVerifyOtpProvider _provider =
  CommercialUserVerifyOtpProvider();

  @override
  void initState() {
    super.initState();
    otp = OtpManager(length: 4);
    otp.init();
  }

  // CORRECTED _handleVerification method in CommercialOtpVerification
  void _handleVerification() {
    String otpValue = otp.getOtp();
    print('Verifying OTP: $otpValue');

    if (otpValue.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid 4-digit OTP')),
      );
      return; // IMPORTANT: Return here
    }

    // Extract the original formData Map
    Map<String, dynamic> originalFormData = widget.requestBody['formData'] ?? {};

    // Create the correct structure for OTP verification
    // The API expects FLAT structure, not nested
    Map<String, dynamic> verificationData = {
      // Copy all original form data (FLAT structure)
      'userData[fullName]': originalFormData['fullName'] ?? '',
      'userData[email]': originalFormData['email'] ?? '',
      'userData[password]': originalFormData['password'] ?? '',
      'userData[phone][country_code]': originalFormData['phone[country_code]'] ?? '',
      'userData[phone][number]': originalFormData['phone[number]'] ?? '',
      'userData[jobTitle]': originalFormData['jobTitle'] ?? '',
      'userData[isCommercial]': originalFormData['isCommercial'] ?? '',
      'userData[commercialInformation][commercialRegNum]': originalFormData['commercialInformation[commercialRegNum]'] ?? '',
      'userData[commercialInformation][licenseNumber]': originalFormData['commercialInformation[licenseNumber]'] ?? '',
      'userData[commercialInformation][companyName]': originalFormData['commercialInformation[companyName]'] ?? '',
      'userData[commercialInformation][companyAddress]': originalFormData['commercialInformation[companyAddress]'] ?? '',
      'userData[commercialInformation][companyPhone][country_code]': originalFormData['commercialInformation[companyPhone][country_code]'] ?? '',
      'userData[commercialInformation][companyPhone][number]': originalFormData['commercialInformation[companyPhone][number]'] ?? '',
      'userData[commercialInformation][companyWhatsapp][country_code]': originalFormData['commercialInformation[companyWhatsapp][country_code]'] ?? '',
      'userData[commercialInformation][companyWhatsapp][number]': originalFormData['commercialInformation[companyWhatsapp][number]'] ?? '',
      'userData[commercialInformation][companyActivity]': originalFormData['commercialInformation[companyActivity]'] ?? '',
      'userData[commercialInformation][establishmentDate]': originalFormData['commercialInformation[establishmentDate]'] ?? '',

      // Add OTP
      'otp': otpValue,

      // Add file path and folder name
      'documents': widget.requestBody['documents'] ?? '',
      'folderName': widget.requestBody['folderName'] ?? '',
    };

    // Remove empty values
    verificationData.removeWhere((key, value) => value == null || value.toString().isEmpty);

    print('Sending OTP verification data:');
    verificationData.forEach((key, value) {
      print('$key: $value');
    });

    // Call the provider
    _provider.verifyOtpCommercialSignUp(verificationData, widget.isCommercial , context);
  }

  String _getMaskedPhoneNumber() {
    try {
      // Extract from original formData
      Map<String, dynamic> originalFormData = widget.requestBody['formData'] ?? {};

      String countryCode = originalFormData['phone[country_code]']?.toString() ?? '';
      String phoneNumber = originalFormData['phone[number]']?.toString() ?? '';

      if (phoneNumber.length > 4) {
        return '${countryCode} ${phoneNumber.substring(0, 2)}** **${phoneNumber.substring(phoneNumber.length - 2)}';
      }
      return '$countryCode ** ** **';
    } catch (e) {
      print('Error masking phone: $e');
      return '+91 ** ** **';
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

  void _handleSendOtpByEmail() {
    print('SEND OTP BY EMAIL');
    // if (widget.onSendOtpByEmail != null) {
    //   widget.onSendOtpByEmail!();
    // }
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