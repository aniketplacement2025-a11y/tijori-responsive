import 'package:vkaps_it_solution_project_tijori/auth/features/button_with_thumsup.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';

import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import 'package:flutter/material.dart';

class OtpSuccessPopup extends StatelessWidget {
  OtpSuccessPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.spacingMedium),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Arrow
              SizedBox(height: Constants.spacingLarge),
              Container(
                width: Constants.fontMedium,
                height: Constants.fontMedium,
                decoration: BoxDecoration(
                  color: CustomColors.lightWhite,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                  padding: const EdgeInsets.only(
                    top: 8,
                    right: 4,
                    bottom: 8,
                    left: 4,
                  ),
                ),
              ),

              // Title and Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // OTP title
                      SizedBox(
                        width: 200,
                        height: 36,
                        child: Text(
                          'Account Created',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.fontMedium,
                            color: CustomColors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: Constants.spacingSmall),

                      // Description Text
                      SizedBox(
                        width: 240,
                        height: 40,
                        child: Text(
                          'Your Account was successfully created',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: 13,
                            color: CustomColors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      ButtonWithThumsup(
                        imagePath: Images.thumsUp,
                        buttonText: "GET ACCESS TO THE APP",
                        onPressed: () {
                          // String otpValue = otp.getOtp();
                          // print("OTP Entered: $otpValue");
                          print("Successfully Done Sign Up");

                          // You can add API call or navigation here
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
