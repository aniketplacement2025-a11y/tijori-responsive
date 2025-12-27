import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/Intl_custom_phone_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/only_custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/otp_verification.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/SplashScreen2.dart';

import '../utils/Images.dart';
import '../utils/constants.dart';
import '../utils/custom_colors.dart';
import '../utils/responsive_media_query.dart';

class ContinueCommercialRegisterPage extends StatefulWidget {
  final String phoneNumber;
  final String email;
  final String fullName;
  final bool isCommercial;

  ContinueCommercialRegisterPage({
    super.key,
    required this.phoneNumber,
    required this.email,
    required this.fullName,
    required this.isCommercial,
  });

  @override
  State<ContinueCommercialRegisterPage> createState() =>
      _ContinueCommercialRegisterPageState();
}

class _ContinueCommercialRegisterPageState
    extends State<ContinueCommercialRegisterPage> {
  TextEditingController _commercialRegisterNo = TextEditingController();
  TextEditingController _licenceNo = TextEditingController();
  TextEditingController _companyAddress = TextEditingController();
  TextEditingController _nameOfTheCompany = TextEditingController();
  TextEditingController _companyActivity = TextEditingController();
  TextEditingController _companyEstablishmentData = TextEditingController();
  TextEditingController _uploadFile = TextEditingController();
  TextEditingController _nameOfFolder = TextEditingController();

  List<String> companyPhoneNo = [];
  List<String> companyWhatsappNo = [];

  bool _acceptItems = false;

  void _handleRegister() {
    print('Phone: ${widget.phoneNumber.toString()}');
    print('Full Name: ${widget.fullName.toString()}');
    print('Email: ${widget.email.toString()}');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OTPVerificationPage(
          phoneNumber: widget.phoneNumber.toString(),
          email: widget.fullName.toString(),
          fullName: widget.email.toString(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for proportional scaling
    final double screenWidth = Responsive.screenWidth(context);
    final double screenHeight = Responsive.screenHeight(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    // Base design dimensions (from original design - roughly 375x812 mobile)
    final double baseWidth = 375.0;
    final double baseHeight = 812.0;

    // Scaling factors
    final double widthScale = screenWidth / baseWidth;
    final double heightScale = screenHeight / baseHeight;
    // Use the smaller scale to maintain proportions without overflow
    final double scale = widthScale < heightScale ? widthScale : heightScale;

    // Scale all values proportionally
    double scaled(double value) => value * scale;

    // For tablet/desktop, limit maximum scaling to 1.2x to prevent huge elements
    final double limitedScale = (isTablet || !isMobile)
        ? (scale > 1.2 ? 1.2 : scale)
        : scale;

    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // Back Button - SCALED
            Positioned(
              top: scaled(24) * limitedScale,
              left: scaled(8) * limitedScale,
              right: scaled(8) * limitedScale,
              child: Row(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => SplashScreen2()),
                        (route) => false,
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: CustomColors.black87,
                      size: scaled(24) * limitedScale,
                    ),
                  ),

                  // Title - SCALED
                  Center(
                    child: Text(
                      'Create an Account',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize:
                            Constants.getFontMedium(context) * limitedScale,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.black87,
                      ),
                    ),
                  ),

                  // Two Twos
                  Container(
                    height: scaled(24) * limitedScale,
                    width: scaled(24) * limitedScale,
                    child: Image.asset(Images.twotwoes, fit: BoxFit.contain),
                  ),
                ],
              ),
            ),

            Positioned(
              top: scaled(60) * limitedScale,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: scaled(24) * limitedScale,
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Center(
                      child: Text(
                        'Continue your registration with Commercial Informations',
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontSize:
                              Constants.getFontLittle(context) * limitedScale,
                          color: CustomColors.black87,
                        ),
                      ),
                    ),

                    SizedBox(
                      height:
                          Constants.getSpacingMedium(context) * limitedScale,
                    ),

                    OnlyCustomFormField(
                      controller: _commercialRegisterNo,
                      hintText: 'Commercial registration number',
                    ),

                    SizedBox(
                      height: Constants.getSpacingSmall(context) * limitedScale,
                    ),

                    OnlyCustomFormField(
                      controller: _licenceNo,
                      hintText: 'License Number (رقم الترخيص)',
                    ),

                    SizedBox(
                      height: Constants.getSpacingSmall(context) * limitedScale,
                    ),

                    OnlyCustomFormField(
                      suffixIcon: Icon(Icons.location_on),
                      controller: _companyAddress,
                      hintText: 'Company Address',
                    ),

                    SizedBox(
                      height: Constants.getSpacingSmall(context) * limitedScale,
                    ),

                    OnlyCustomFormField(
                      suffixIcon: Icon(Icons.person_pin),
                      controller: _nameOfTheCompany,
                      hintText: 'Name of the Company',
                    ),

                    SizedBox(
                      height: Constants.getSpacingSmall(context) * limitedScale,
                    ),

                    IntlCustomPhoneField(
                      suffixIcon: Icon(Icons.phone_android),
                      labelText: 'Company Phone Number',
                      onChanged: (value) {
                        setState(() {
                          companyPhoneNo = value;
                        });
                      },
                    ),

                    SizedBox(
                      height: Constants.getSpacingSmall(context) * limitedScale,
                    ),

                    IntlCustomPhoneField(
                      suffixIcon: Icon(Icons.phone_android),
                      labelText: 'Company WhatsApp Number',
                      onChanged: (value) {
                        setState(() {
                          companyWhatsappNo = value;
                        });
                      },
                    ),

                    OnlyCustomFormField(
                      controller: _companyActivity,
                      hintText: 'Company\’s Activity (Optional)',
                    ),

                    SizedBox(
                      height: Constants.getSpacingSmall(context) * limitedScale,
                    ),

                    OnlyCustomFormField(
                      controller: _companyEstablishmentData,
                      hintText: 'Company establishment date (Optional)',
                    ),

                    SizedBox(
                      height: Constants.getSpacingSmall(context) * limitedScale,
                    ),

                    // UPLOAD FOLDER OF THE COMPANY
                    Container(
                      width: 400,
                      height: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: CustomColors.blackBS1,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: Constants.spacingSmall),
                              Text(
                                'Folder of the Company',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: .w600,
                                  fontSize: Constants.fontLittle,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: Constants.getSpacingLittle(context)),

                          OnlyCustomFormField(
                            controller: _uploadFile,
                            hintText: 'Upload files of the Company',
                          ),

                          SizedBox(height: Constants.getSpacingLittle(context)),

                          OnlyCustomFormField(
                            controller: _nameOfFolder,
                            hintText: 'Name the Folder (Optional)',
                          ),

                          // Add More Files
                          Row(
                            crossAxisAlignment: .center,
                            children: [
                              Spacer(), // This pushes the button to the right

                              Material(
                                color: Colors.transparent,
                                child: GestureDetector(
                                  onTap: () {
                                    print("Clicked on Add New Bucket");
                                  },
                                  child: Container(
                                    height: 36,
                                    constraints: BoxConstraints(maxWidth: 150),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Constants.fontLittle,
                                      vertical: Constants.spacingLittle,
                                    ),
                                    decoration: BoxDecoration(
                                      color: CustomColors.blackBS1,
                                      borderRadius: BorderRadius.circular(
                                        Constants.spacingMedium,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: CustomColors.blackBS1,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: Constants.fontLittle,
                                          height: Constants.fontLittle,
                                          child: Image.asset(
                                            Images.plusIcon,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Constants.spacingLittle,
                                        ),
                                        Text(
                                          'Add More Files',
                                          style: TextStyle(
                                            fontFamily: Constants.primaryfont,
                                            fontSize: Constants.spacingSmall,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Terms and Conditions - SCALED
                    Row(
                      children: [
                        SizedBox(
                          width: scaled(24) * limitedScale,
                          height: scaled(24) * limitedScale,
                          child: Checkbox(
                            value: _acceptItems,
                            onChanged: (bool? value) {
                              setState(() {
                                _acceptItems = value ?? false;
                              });
                            },
                            activeColor: CustomColors.gradientBlue,
                          ),
                        ),
                        SizedBox(width: scaled(8) * limitedScale),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('CLICKED ON TERMS AND CONDITIONS');
                            },
                            child: Text(
                              'I have read and accept the terms and conditions.',
                              style: TextStyle(
                                fontFamily: Constants.primaryfont,
                                fontSize:
                                    Constants.getFontLittle(context) *
                                    limitedScale,
                                color: CustomColors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height:
                          Constants.getSpacingMedium(context) * limitedScale,
                    ),

                    // REGISTER BUTTON - SCALED
                    Container(
                      width: double.infinity,
                      height: scaled(42) * limitedScale,
                      decoration: BoxDecoration(
                        color: _acceptItems
                            ? CustomColors.gradientBlue
                            : CustomColors.littleWhite,
                        borderRadius: BorderRadius.circular(
                          scaled(5) * limitedScale,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.lightWhite,
                            blurRadius: scaled(8) * limitedScale,
                            offset: Offset(0, scaled(3) * limitedScale),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: _acceptItems ? _handleRegister : null,
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize:
                                Constants.getFontSmall(context) * limitedScale,
                            fontFamily: Constants.primaryfont,
                            color: CustomColors.ghostWhite,
                          ),
                        ),
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
