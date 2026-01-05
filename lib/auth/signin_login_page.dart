import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/forgot_password_page.dart';
import 'package:vkaps_it_solution_project_tijori/auth/send_otp_by_phone.dart';
import 'package:vkaps_it_solution_project_tijori/pages/official_landing_page.dart';
import 'package:vkaps_it_solution_project_tijori/services/providers/auth/login_provider.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/SplashScreen2.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/titles.dart';
import '../services/settings/loadingIndicator.dart';
import 'fields/custom_password_field.dart';
import 'fields/custom_social_button.dart';

class SigninLoginPage extends StatefulWidget {
  final bool isCommercial;

  SigninLoginPage({
   super.key,
   required this.isCommercial,
  });

  @override
  _SigninLoginPageState createState() => _SigninLoginPageState();
}

class _SigninLoginPageState extends State<SigninLoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  final TextEditingController _phoneEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneEmailController.dispose();
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
                        'Sign In',
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

                    // Sign Up Link - SCALED
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I don\'t have an account.',
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
                              print('CLICKED ON CREATE AN ACCOUNT');
                            },
                            child: Text(
                              'Create an Account',
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

                    // Login Form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Phone Number or Email Field
                          CustomFormField(
                            label: 'Phone Number or Email',
                            hintText: 'Enter your Phone number or Email',
                            controller: _phoneEmailController,
                            suffixIcon: Icon(
                              Icons.person,
                              size: Constants.getFontMedium(context) * limitedScale,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number or email';
                              }

                              // Email validation regex
                              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                              // Phone validation (10 digits)
                              final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');
                              final isPhone = digitsOnly.length >= 10;
                              final isEmail = emailRegex.hasMatch(value);

                              if (!isEmail && !isPhone) {
                                return 'Please enter a valid email or 10-digit phone number';
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height:
                                Constants.getSpacingSmall(context) *
                                limitedScale,
                          ),

                          // Forgot Password Link - SCALED
                          Container(
                            height: scaled(24) * limitedScale,
                            width: scaled(320) * limitedScale,
                            child: InkWell(
                              onTap: () {
                                print('CLICKED ON I FORGOT MY PASSWORD.');
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SendOtpByPhone(
                                        isCommercial: widget.isCommercial)
                                  ),
                                );
                              },
                              child: Text(
                                'I forgot my password',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize:
                                      Constants.getFontSmall(context) *
                                      limitedScale,
                                  color: CustomColors.black87,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height:
                                Constants.getSpacingMedium(context) *
                                limitedScale,
                          ),

                          // SIGN IN BUTTON - SCALED
                          Container(
                            width: double.infinity,
                            height: scaled(42) * limitedScale,
                            decoration: BoxDecoration(
                              color: CustomColors.gradientBlue,
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
                              create: (BuildContext context) => LoginProvider(),
                              child: Consumer<LoginProvider>(
                                builder: (context, provider, child) {
                                  return TextButton(
                                    // In your SigninLoginPage, update the onPressed:
                                    onPressed: () {
                                      print('CLICKED ON SIGNED IN BUTTON');

                                      // Check if form key is valid
                                      if (_formKey.currentState == null) {
                                        print('Form key is null!');
                                        return;
                                      }

                                      // Try to validate
                                      bool isValid = _formKey.currentState!.validate();
                                      print('Form validation result: $isValid');

                                      if (isValid) {
                                        if (!provider.isLoading) {
                                          Map requestBody = {
                                            "emailOrPhone": _phoneEmailController.text.toString(),
                                            "password": _passwordController.text.toString(),
                                          };
                                          provider.login(requestBody, widget.isCommercial ,context);
                                        }
                                      } else {
                                        print('Validation failed - showing snackbar');
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Please fill in all required fields'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                                    child: provider.isLoading
                                        ? loadingIndicator()
                                        : Text(
                                            'SIGN IN',
                                            style: TextStyle(
                                              fontFamily: Constants.primaryfont,
                                              fontSize:
                                                  Constants.getFontSmall(
                                                    context,
                                                  ) *
                                                  limitedScale,
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
                                Constants.getSpacingMedium(context) *
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
                                Constants.getSpacingSmall(context) *
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
                                    Constants.getSpacingMedium(context) *
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

                          // Extra bottom padding for better scrolling
                          SizedBox(
                            height:
                                Constants.getSpacingLarge(context) *
                                limitedScale,
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
