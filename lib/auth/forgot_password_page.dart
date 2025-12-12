import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/email_otp_verification.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/titles.dart';
import 'fields/custom_form_field.dart';

class ForgotPasswordPage extends StatefulWidget{
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
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
                         'Forgot Password',
                         style: TextStyle(
                           fontFamily: Constants.primaryfont,
                           fontSize: Constants.fontMedium,
                           fontWeight: FontWeight.bold,
                           color: CustomColors.black87,
                         ),
                       ),
                     ),

                     SizedBox(height: Constants.spacingLittle),

                     //  Description Text
                     Center(
                       child: Text(
                         'Please enter your email to send an OTP for verification',
                         style: TextStyle(
                           fontFamily: Constants.primaryfont,
                           fontSize: Constants.fontLittle,
                           color: CustomColors.black87,
                         ),
                       ),
                     ),

                    SizedBox(height: Constants.spacingMedium),

                    Container(
                      child: Column(
                        children: [

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

                          SizedBox(height: Constants.spacingMedium),

                          // SEND OTP BUTTON
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
                              onPressed: (){
                                print('CLICKED ON SEND OTP BUTTON');
                                Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => EmailOtpVerification(
                                   email: _emailController.text,
                                 )));
                              },
                              child: Text(
                                'SEND OTP',
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

                          SizedBox(height: Constants.spacingMedium),

                          Column(
                            children: [
                              Text(
                                'I can\'t get access to my email box right now',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontLittle,
                                  color: CustomColors.black87.withOpacity(0.7),
                                ),
                              ),

                              SizedBox(height: Constants.spacingMedium),

                              Container(
                                width: double.infinity,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: CustomColors.ghostWhite,
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
                                  onPressed: (){
                                    print('CLICKED ON SEND OTP BY PHONE BUTTON');
                                  },
                                  child: Text(
                                    'SEND OTP BY PHONE',
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
                        ],
                      ),
                    ),
                   ],
                 ),
               )
           )
         ],
       ),
     ),
   );
  }
}