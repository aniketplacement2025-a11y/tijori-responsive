import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/signin_login_page.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/SplashScreen2.dart';

import '../utils/Images.dart';
import '../utils/constants.dart';
import '../utils/custom_colors.dart';
import '../utils/responsive_media_query.dart';
import 'continue_commercial_register_page.dart';
import 'fields/Intl_custom_phone_field.dart';
import 'fields/custom_form_field.dart';
import 'fields/custom_password_field.dart';
import 'fields/custom_phone_field.dart';
import 'fields/custom_social_button.dart';

class CommercialRegisterPage extends StatefulWidget {
  final bool isCommercial;

  CommercialRegisterPage({super.key, required this.isCommercial});

  @override
  State<CommercialRegisterPage> createState() => _CommercialRegisterPageState();
}

class _CommercialRegisterPageState extends State<CommercialRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String selectedType =
      'Job Title'; // This should match one of the items in typeList

  List<String> typeList = ['Job Title', 'Business Manager', 'Other'];

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      print('Registration successful!');
      print('Full Name: ${_fullNameController.text}');
      print('Phone: ${_phoneController[0]}${_phoneController[1]}');
      print('Email: ${_emailController.text}');
    }

    // Navigate to OTP Verification Page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContinueCommercialRegisterPage(
          phoneNumber: '${_phoneController[0]}${_phoneController[1]}',
          email: _emailController.text,
          fullName: _fullNameController.text,
          isCommercial: widget.isCommercial,
        ),
      ),
    );
  }

  bool _acceptItems = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  List<String> _phoneController = [];

  // Get screen dimensions for proportional scaling
  late final double screenWidth = Responsive.screenWidth(context);
  late final double screenHeight = Responsive.screenHeight(context);
  late final bool isMobile = Responsive.isMobile(context);
  late final bool isTablet = Responsive.isTablet(context);

  // Base design dimensions (from original design - roughly 375x812 mobile)
  final double baseWidth = 375.0;
  final double baseHeight = 812.0;

  // Scaling factors
  late final double widthScale = screenWidth / baseWidth;
  late final double heightScale = screenHeight / baseHeight;
  // Use the smaller scale to maintain proportions without overflow
  late final double scale = widthScale < heightScale ? widthScale : heightScale;

  // Scale all values proportionally
  double scaled(double value) => value * scale;

  // For tablet/desktop, limit maximum scaling to 1.2x to prevent huge elements
  late final double limitedScale = (isTablet || !isMobile)
      ? (scale > 1.2 ? 1.2 : scale)
      : scale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // Back Button - SCALED
            Positioned(
              top: scaled(24) * limitedScale,
              left: scaled(12) * limitedScale,
              child: IconButton(
                onPressed: () {
                  print("Clicked On Commercial Back Button");
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
            ),

            // Main Content - SCALED
            Positioned(
              top: scaled(32) * limitedScale,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: scaled(24) * limitedScale,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

                    SizedBox(
                      height:
                          Constants.getSpacingLittle(context) * limitedScale,
                    ),

                    // Sign In Link - SCALED
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I already have an account.',
                            style: TextStyle(
                              fontFamily: Constants.primaryfont,
                              fontSize:
                                  Constants.getFontSmall(context) *
                                  limitedScale,
                              color: CustomColors.black87,
                            ),
                          ),
                          SizedBox(width: scaled(4) * limitedScale),
                          InkWell(
                            onTap: () {
                              print('CLICKED ON SIGN IN.');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SigninLoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontFamily: Constants.primaryfont,
                                fontSize:
                                    Constants.getFontSmall(context) *
                                    limitedScale,
                                color: CustomColors.black87,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height:
                          Constants.getSpacingMedium(context) * limitedScale,
                    ),

                    // Registration Form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Your DropdownButtonFormField - this is CORRECT
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'The job title',
                                    style: TextStyle(
                                      fontSize: Constants.getFontSmall(context),
                                      color: CustomColors.littleWhite,
                                      fontFamily: Constants.primaryfont,
                                    ),
                                  ),
                                  Text(
                                    ' *',
                                    style: TextStyle(
                                      fontSize: Constants.getFontSmall(context),
                                      color: CustomColors.red,
                                      fontFamily: Constants.primaryfont,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Constants.getSpacingLittle(context),
                              ),

                              DropdownButtonFormField(
                                value:
                                    selectedType, // This should be 'Business Manager' not 'Individual'
                                items: typeList.map((String item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedType = value!;
                                  });
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: CustomColors.lightWhite,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      Responsive.value<double>(
                                        context,
                                        mobile: 8,
                                        tablet: 10,
                                        desktop: 12,
                                      ),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: Responsive.value<double>(
                                      context,
                                      mobile: 12,
                                      tablet: 14,
                                      desktop: 16,
                                    ),
                                    vertical: Responsive.value<double>(
                                      context,
                                      mobile: 14,
                                      tablet: 16,
                                      desktop: 18,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height:
                                    Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              // Full Name Field - Note: CustomFormField should handle its own scaling
                              CustomFormField(
                                label: 'Full Name',
                                hintText: 'Enter Full Name',
                                controller: _fullNameController,
                                suffixIcon: Icon(Icons.person),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your full name';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(
                                height:
                                    Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              // Phone Field
                              IntlCustomPhoneField(
                                suffixIcon: Icon(Icons.phone),
                                labelText: 'Company Phone Number',
                                onChanged: (value) {
                                  setState(() {
                                    _phoneController = value;
                                  });
                                },
                              ),

                              SizedBox(
                                height:
                                    Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              // Email Field
                              CustomFormField(
                                label: 'Email Name',
                                hintText: 'E.g.: User@domain.com',
                                controller: _emailController,
                                suffixIcon: Icon(Icons.email),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                  ).hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(
                                height:
                                    Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              // Password Field
                              CustomPasswordField(
                                label: 'Password',
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                onToggle: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),

                              SizedBox(
                                height:
                                    Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              // Confirm Password Field
                              CustomPasswordField(
                                label: 'Confirm Password',
                                controller: _confirmPasswordController,
                                obscureText: _obscureConfirmPassword,
                                onToggle: () {
                                  setState(() {
                                    _obscureConfirmPassword =
                                        !_obscureConfirmPassword;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  }
                                  if (value != _passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(
                                height:
                                    Constants.getSpacingSmall(context) *
                                    limitedScale,
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
                                        print(
                                          'CLICKED ON TERMS AND CONDITIONS',
                                        );
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
                                    Constants.getSpacingMedium(context) *
                                    limitedScale,
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
                                      offset: Offset(
                                        0,
                                        scaled(3) * limitedScale,
                                      ),
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: _acceptItems
                                      ? _handleRegister
                                      : null,
                                  child: Text(
                                    'REGISTER',
                                    style: TextStyle(
                                      fontSize:
                                          Constants.getFontSmall(context) *
                                          limitedScale,
                                      fontFamily: Constants.primaryfont,
                                      color: CustomColors.ghostWhite,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height:
                                    Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              // Horizontal line - SCALED
                              Container(
                                width: double.infinity,
                                height: scaled(1) * limitedScale,
                                color: CustomColors.littleWhite,
                              ),

                              SizedBox(
                                height:
                                    Constants.getSpacingLittle(context) *
                                    limitedScale,
                              ),

                              // Social Media Section - SCALED
                              Column(
                                children: [
                                  Text(
                                    'Or use social media account to Sign Up',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize:
                                          Constants.getFontSmall(context) *
                                          limitedScale,
                                      color: CustomColors.black87.withOpacity(
                                        0.7,
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                        Constants.getSpacingSmall(context) *
                                        limitedScale,
                                  ),

                                  // Social Media Buttons - SCALED
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // APPLE BUTTON
                                      CustomSocialButton(
                                        icon: Images.apple,
                                        label: 'APPLE',
                                        onPressed: () {
                                          print("CLICKED ON APPLE BUTTON");
                                        },
                                      ),

                                      SizedBox(
                                        width:
                                            Constants.getSpacingMedium(
                                              context,
                                            ) *
                                            limitedScale,
                                      ),

                                      // GOOGLE BUTTON
                                      CustomSocialButton(
                                        icon: Images.google,
                                        label: 'GOOGLE',
                                        onPressed: () {
                                          print("CLICKED ON GOOGLE BUTTON");
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: scaled(40) * limitedScale,
                              ), // Extra bottom padding
                            ],
                          ),
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
