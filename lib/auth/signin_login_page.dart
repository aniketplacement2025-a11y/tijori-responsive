import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/forgot_password_page.dart';
import 'package:vkaps_it_solution_project_tijori/pages/official_landing_page.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/titles.dart';
import 'fields/custom_password_field.dart';
import 'fields/custom_social_button.dart';

class SigninLoginPage extends StatefulWidget {
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
    // TODO: implement build
    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // Back Button
            Positioned(
              top: 24,
              left: 12,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: CustomColors.black87),
              ),
            ),

            // Main Content
            Positioned(
              top: 32,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontSize: Constants.fontMedium,
                          fontWeight: .bold,
                          color: CustomColors.black87,
                        ),
                      ),
                    ),

                    SizedBox(height: Constants.spacingLittle),

                    // Sign Up Link
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I don\'t have an account.',
                            style: TextStyle(
                              fontFamily: Constants.primaryfont,
                              fontSize: Constants.fontSmall,
                              color: CustomColors.black87,
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              print('CLICKED ON CREATE AN ACCOUNT');
                            },
                            child: Text(
                              'Create an Account',
                              style: TextStyle(
                                fontFamily: Constants.primaryfont,
                                fontSize: Constants.fontSmall,
                                color: CustomColors.black87,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: Constants.spacingMedium),

                    // Registration Form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Phone Number or Email Field
                          CustomFormField(
                            label: 'Phone Number or Email',
                            hintText: 'Enter your Phone number or Email',
                            controller: _phoneEmailController,
                            suffixIcon: Icon(Icons.person), // Custom icon
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: Constants.spacingSmall),

                          CustomPasswordField(
                            label: 'Password',
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            onToggle: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ), // CustomPasswordField

                          SizedBox(height: Constants.spacingSmall),

                          SizedBox(
                            height: 24,
                            width: 320,
                            child: InkWell(
                              onTap: () {
                                print('CLICKED ON I FORGOT MY PASSWORD.');
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'I forgot my password',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.black87,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: Constants.spacingMedium),

                          // SIGN IN BUTTON
                          Container(
                            width: double.infinity,
                            height: 42,
                            decoration: BoxDecoration(
                              color: CustomColors.gradientBlue,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: CustomColors.lightWhite,
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),

                            child: TextButton(
                              onPressed: () {
                                print('CLICKED ON SIGNED IN BUTTON');
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => OfficialLandingPage())
                                );
                              },
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.ghostWhite,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: Constants.spacingMedium),

                          // Horizontal line
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: CustomColors.littleWhite,
                          ),

                          SizedBox(height: Constants.spacingSmall),

                          //Social Media Section
                          Column(
                            children: [
                              Text(
                                'Or use social media account to Sign Up',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.black87.withOpacity(0.7),
                                ),
                              ),

                              SizedBox(height: Constants.spacingMedium),

                              // Social Media Buttons
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

                                  SizedBox(width: Constants.spacingMedium),

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
