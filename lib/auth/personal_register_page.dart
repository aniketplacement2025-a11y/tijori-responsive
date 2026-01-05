import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_phone_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_social_button.dart';
import 'package:vkaps_it_solution_project_tijori/auth/signin_login_page.dart';
import 'package:vkaps_it_solution_project_tijori/services/providers/auth/sign_up_provider.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/SplashScreen2.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/titles.dart';
import '../pages/others/custom_header_1.dart';
import '../pages/others/logo_container.dart';
import '../services/settings/loadingIndicator.dart';
import '../services/settings/print_value.dart';
import 'features/password_validation_checklist.dart';
import 'fields/Intl_custom_phone_field.dart';
import 'fields/custom_password_field.dart';
import 'otp_verification.dart';

class PersonalRegisterPage extends StatefulWidget {
  bool isCommercial;

  PersonalRegisterPage({super.key, required this.isCommercial});

  @override
  _PersonalRegisterScreenState createState() => _PersonalRegisterScreenState();
}

class _PersonalRegisterScreenState extends State<PersonalRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  bool _showPasswordValidation = false;
  bool _acceptItems = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  List<String> _phoneController = [];

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _showPasswordValidation = _passwordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
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
                                  builder: (context) => SigninLoginPage(
                                    isCommercial: widget.isCommercial,
                                  ),
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
                            validator: (phone) {
                              if (phone == null || phone.number.isEmpty) {
                                return 'Please enter a phone number';
                              }

                              // Validate phone number length
                              if (phone.number.length < 10) {
                                return 'Phone number must be at least 10 digits';
                              }

                              // Additional validation if needed
                              if (!RegExp(r'^[0-9]+$').hasMatch(phone.number)) {
                                return 'Phone number must contain only digits';
                              }

                              return null;
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

                          // Password Field with comprehensive validation
                          CustomPasswordField(
                            label: 'Password',
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            onToggle: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }

                              // Quick validation for form submission
                              final isValid = value.length >= 8 &&
                                  RegExp(r'[A-Z]').hasMatch(value) &&
                                  RegExp(r'[a-z]').hasMatch(value) &&
                                  RegExp(r'[0-9]').hasMatch(value) &&
                                  RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value) &&
                                  !value.contains(' ');

                              return isValid ? null : 'Password does not meet all requirements';
                            },
                          ),

                          // Animated Password Validation Box
                          AnimatedCrossFade(
                            duration: Duration(milliseconds: 200),
                            crossFadeState: _showPasswordValidation
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            firstChild: PasswordValidationChecklist(
                              password: _passwordController.text,
                            ),
                            secondChild: SizedBox.shrink(),
                          ),

                          SizedBox(
                            height: Constants.getSpacingSmall(context) * limitedScale,
                          ),

// Confirm Password Field
                          CustomPasswordField(
                            label: 'Confirm Password',
                            controller: _confirmPasswordController,
                            obscureText: _obscureConfirmPassword,
                            onToggle: () {
                              setState(() {
                                _obscureConfirmPassword = !_obscureConfirmPassword;
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
                                  offset: Offset(0, scaled(3) * limitedScale),
                                ),
                              ],
                            ),
                            child: ChangeNotifierProvider(
                              create: (BuildContext context) => SignUpProvider(),
                              child: Consumer<SignUpProvider>(
                                builder: (context, provider, child) {
                                  return
                                  TextButton(
                                    onPressed: () async {
                                      if(!provider.isLoading && _formKey.currentState!.validate()){
                                        // Validate phone number
                                        if (_phoneController.length < 2) {
                                          print("Please enter valid phone number");
                                          // Show error: Please enter valid phone number
                                          return;
                                        }

                                        // Prepare request body
                                        Map<String, dynamic> requestBody = {
                                          "fullName": _fullNameController.text.trim(),
                                          "email": _emailController.text.trim(),
                                          "password": _passwordController.text,
                                          "phone": {
                                            "country_code":
                                            _phoneController[0], // Should be like "+91"
                                            "number": _phoneController[1].replaceAll(
                                              RegExp(r'\D'),
                                              '',
                                            ), // Remove non-digits
                                          },
                                          "isCommercial": widget.isCommercial,
                                        };

                                        printValue(requestBody, tag: "INPUT TO API");

                                        // Call the provider
                                        await provider.signUpPersonalProvider(
                                          requestBody,
                                          widget.isCommercial,
                                          context,
                                        );
                                      }
                                    },
                                    child: provider.isLoading
                                        ? loadingIndicator()
                                        : Text(
                                      'REGISTER',
                                      style: TextStyle(
                                        fontSize:
                                        Constants.getFontSmall(context) *
                                            limitedScale,
                                        fontFamily: Constants.primaryfont,
                                        color: CustomColors.ghostWhite,
                                      ),
                                    ),
                                  );
                                },
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
                                  color: CustomColors.black87.withOpacity(0.7),
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
                                        Constants.getSpacingMedium(context) *
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
