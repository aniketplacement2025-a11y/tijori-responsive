import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/signin_login_page.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/pre_register_controller.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import '../../utils/onboarding_background.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/titles.dart';
import '../../pages/others/custom_header_1.dart';
import '../../pages/others/logo_container.dart';
import 'onboarding_screen.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>{
  late PreRegisterController _controller;

  @override
  void initState(){
    super.initState();
    _controller = PreRegisterController(context);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: OnboardingBackground(
        // Using the reusable background
        child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                  child: Center(
                    child: CustomHeader1(
                        title: Titles.header_title,
                        flagAsset: Images.flagAsset,
                    ),
                  ),
              ),

              Positioned(
                  top: 150,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: LogoContainer(
                        width: 200,
                        height: 210,
                        logoAsset: Images.logoAsset,
                    ),
                  ),
              ),

              // Subtitle "All in one place"
              Positioned(
                top: 376,
                right: 0,
                left: 0,
                child: Center(
                  child: Text(
                    'All in one place!',
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.fontSmall,
                      color: CustomColors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Bottom Content Section with 3 buttons
              Positioned(
                bottom: 20,
                left: 35,
                right: 35,
                  child: Container(
                    height: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Title "GetAccess to Your App"
                        Text(
                          'Get Access to your App',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Constants.fontSmall,
                            color: CustomColors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        // REGISTER Button
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: CustomColors.gradientBlue,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: CustomColors.blackBS1,
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextButton(
                              onPressed: (){
                                print('PRESSED ON REGISTER');
                                _controller.handleRegisterPress();
                              },
                              child: Text(
                                'REGISTER',
                                style: TextStyle(
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.ghostWhite,
                                ),
                              ),
                          ),
                        ),

                        // LOG IN Button
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: CustomColors.black87,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                               color: CustomColors.blackBS1,
                               blurRadius: 8,
                               offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextButton(
                              onPressed: (){
                                print('CLICKED ON LOGIN PAGE');
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => SigninLoginPage(),));
                              },
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.ghostWhite,
                                ),
                              ),
                          ),
                        ),

                        // ENTER AS A GUEST BUTTON
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: CustomColors.ghostWhite,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: CustomColors.ghostWhite,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: CustomColors.blackBS1,
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextButton(
                              onPressed: (){
                                 print('PRESSED ENTER AS A GUEST');
                              },
                              child: Text(
                                'ENTER AS A GUEST',
                                style: TextStyle(
                                  fontSize: Constants.fontSmall,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.black87,
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