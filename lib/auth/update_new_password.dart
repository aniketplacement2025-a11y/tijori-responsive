import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_password_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/update_password_success_popup.dart';
import 'package:vkaps_it_solution_project_tijori/services/providers/update_new_password_provider.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/titles.dart';
import 'features/gradient_button.dart';
import '../../utils/responsive_media_query.dart';

class UpdateNewPassword extends StatefulWidget {
  final bool isCommercial;
  List<String> send_otp_phone_number;

  UpdateNewPassword({
   super.key,
   required this.isCommercial,
   required this.send_otp_phone_number,
  });

  @override
  _UpdateNewPasswordState createState() => _UpdateNewPasswordState();
}

class _UpdateNewPasswordState extends State<UpdateNewPassword> {
  bool _obscurePassword = true;
  bool _obscureNewPassword = true;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
        child: Stack(
          children: [
            // Back Button - Responsive positioning
            Positioned(
              top: Responsive.value<double>(
                context,
                mobile: 24,
                tablet: 32,
                desktop: 40,
              ),
              left: Responsive.value<double>(
                context,
                mobile: 12,
                tablet: 16,
                desktop: 20,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: CustomColors.black87,
                  size: Responsive.value<double>(
                    context,
                    mobile: 20,
                    tablet: 22,
                    desktop: 24,
                  ),
                ),
              ),
            ),

            // Main Content - Responsive positioning
            Positioned(
              top: Responsive.value<double>(
                context,
                mobile: 32,
                tablet: 40,
                desktop: 48,
              ),
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.value<double>(
                    context,
                    mobile: 18,
                    tablet: 36,
                    desktop: 48,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title - Responsive
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(
                            top: isTablet || isDesktop ? Constants.getSpacingMedium(context) : 0,
                          ),
                          child: Text(
                            'New Password',
                            style: TextStyle(
                              fontFamily: Constants.primaryfont,
                              fontSize: Responsive.value<double>(
                                context,
                                mobile: Constants.getFontMedium(context),
                                tablet: Constants.getFontMedium(context) * 1.1,
                                desktop: Constants.getFontLarge(context),
                              ),
                              fontWeight: FontWeight.bold,
                              color: CustomColors.black87,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: Constants.getSpacingSmall(context)),

                      // Description - Responsive
                      Center(
                        child: Container(
                          width: Responsive.value<double>(
                            context,
                            mobile: double.infinity,
                            tablet: 400,
                            desktop: 500,
                          ),
                          child: Text(
                            'Please enter a new password',
                            style: TextStyle(
                              fontFamily: Constants.primaryfont,
                              fontSize: Constants.getFontSmall(context),
                              color: CustomColors.blackBS1.withOpacity(0.8),
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      SizedBox(height: Constants.getSpacingHigh(context)),

                      // Reset Password Form
                      Column(
                        children: [
                          // New Password Field - Already responsive via CustomPasswordField
                          CustomPasswordField(
                            label: 'New Password',
                            controller: _passwordController,
                            obscureText: _obscureNewPassword,
                            onToggle: () {
                              setState(() {
                                _obscureNewPassword = !_obscureNewPassword;
                              });
                            },
                          ),

                          SizedBox(height: Constants.getSpacingMedium(context)),

                          // Confirm Password Field - Already responsive via CustomPasswordField
                          CustomPasswordField(
                            label: 'Confirm New Password',
                            controller: _confirmPasswordController,
                            obscureText: _obscurePassword,
                            onToggle: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your new password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: Constants.getSpacingHigh(context)),

                          // Change Password Button - Responsive
                          ChangeNotifierProvider(
                            create: (BuildContext context) => UpdateNewPasswordProvider(),
                            child: Consumer<UpdateNewPasswordProvider>(
                              builder: (context, provider, child) {
                                return GradientButton(
                                  text: 'CHANGE PASSWORD',
                                  width: Responsive.value<double>(
                                    context,
                                    mobile: double.infinity,
                                    tablet: 350,
                                    desktop: 400,
                                  ),
                                  height: Responsive.value<double>(
                                    context,
                                    mobile: 48,
                                    tablet: 52,
                                    desktop: 56,
                                  ),
                                  onPressed: () {
                                    print('CLICKED ON CHANGE PASSWORD BUTTON');
                                    if(!provider.isLoading){
                                     Map requestBody = {
                                       "phone" : {
                                         'country_code' : widget.send_otp_phone_number[0].trim(),
                                         'number' : widget.send_otp_phone_number[1].trim(),
                                       },
                                       "newPassword" : _passwordController.text.trim(),
                                     };
                                     provider.updateNewPassword(requestBody, widget.isCommercial, context);
                                    }},
                                );
                              },
                            ),
                          ),

                          // Extra spacing for larger screens
                          if (isTablet || isDesktop)
                            SizedBox(height: Constants.getSpacingLarge(context) * 2),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}