import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_phone_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_social_button.dart';
import 'package:vkaps_it_solution_project_tijori/auth/signin_login_page.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/titles.dart';
import '../pages/others/custom_header_1.dart';
import '../pages/others/logo_container.dart';
import 'fields/custom_password_field.dart';
import 'otp_verification.dart';

class PersonalRegisterPage extends StatefulWidget {
  @override
  _PersonalRegisterScreenState createState() => _PersonalRegisterScreenState();
}

class _PersonalRegisterScreenState extends State<PersonalRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _acceptItems = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  // Handle Register
  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      print('Registration successful!');
      print('Full Name: ${_fullNameController.text}');
      print('Phone: ${_phoneController.text}');
      print('Email: ${_emailController.text}');

      // Navigate to OTP Verification Page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPVerificationPage(
            phoneNumber: _phoneController.text,
            email: _emailController.text,
            fullName: _fullNameController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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

            //Main Content
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
                        'Create an Account',
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontSize: Constants.fontMedium,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.black87,
                        ),
                      ),
                    ),

                    SizedBox(height: Constants.spacingLittle),

                    //Sign In Link
                    Center(
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Add this line
                        children: [
                          Text(
                            'I already have an account.',
                            style: TextStyle(
                              fontFamily: Constants.primaryfont,
                              fontSize: Constants.fontSmall,
                              color: CustomColors.black87,
                            ),
                          ),

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
                          // Full Name Field
                          CustomFormField(
                            label: 'Full Name',
                            hintText: 'Enter Full Name',
                            controller: _fullNameController,
                            suffixIcon: Icon(Icons.person), // Custom icon
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: Constants.spacingSmall),

                          //  Form Field for Phone
                          CustomPhoneField(),

                          SizedBox(height: Constants.spacingSmall),

                          // FORM FIELD FOR EMAIL
                          CustomFormField(
                            label: 'Email Name',
                            hintText: 'E.g.: User@domain.com',
                            controller: _emailController,
                            suffixIcon: Icon(Icons.email), // Custom icon
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              if (!RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              ).hasMatch(value)) {
                                return 'Please enter a valid email';
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
                          ),

                          SizedBox(height: Constants.spacingSmall),

                          // Password Field
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

                          SizedBox(height: Constants.spacingSmall),

                          // Terms and Conditions
                          Row(
                            children: [
                              Checkbox(
                                value: _acceptItems,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _acceptItems = value ?? false;
                                  });
                                },
                                activeColor: CustomColors.gradientBlue,
                              ),

                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    print('CLICKED ON TERMS AND CONDITIONS');
                                  },
                                  child: Text(
                                    'I have read and accept the terms and conditions.',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.fontLittle,
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: Constants.spacingMedium),

                          // REGISTER BUTTON
                          Container(
                            width: double.infinity,
                            height: 42,
                            decoration: BoxDecoration(
                              color: _acceptItems
                                  ? CustomColors.gradientBlue
                                  : CustomColors.littleWhite,
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
                              onPressed: _acceptItems
                                  ? // Navigate to OTP Verification Page
                                    _handleRegister
                                  : null,
                              child: Text(
                                'REGISTER',
                                style: TextStyle(
                                  fontSize: Constants.fontSmall,
                                  fontFamily: Constants.primaryfont,
                                  color: CustomColors.ghostWhite,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: Constants.spacingSmall),

                          // Horizontal line
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: CustomColors.littleWhite,
                          ),

                          SizedBox(height: Constants.spacingLittle),

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

                              SizedBox(height: Constants.spacingSmall),

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
                          SizedBox(height: Constants.spacingLarge),
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
