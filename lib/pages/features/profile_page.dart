import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/outline_button.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/dart_pink_button.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';

import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBackground(
          child: Stack(
            children: [

              // FIXED HEADER
              Positioned(
                top: 20,
                left: 5,
                  right: 5,
                  child: Container(
                    width: Responsive.screenWidth(context) * (0.88),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      crossAxisAlignment: .center,
                      children: [

                        // Reminder Button
                        GestureDetector(
                          onTap: () {
                            print('CLICKED ON BELL IMAGE');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: CustomColors.ghostWhite,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: CustomColors.blackBS1,
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Image.asset(Images.bell, width: 16, height: 16),
                                SizedBox(width: Constants.spacingLittle),
                                Text(
                                  'Create reminder',
                                  style: TextStyle(
                                    fontFamily: Constants.primaryfont,
                                    fontSize: Constants.fontSmall,
                                    color: CustomColors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),


                        // Popup Menu
                        Container(
                          decoration: BoxDecoration(
                            color: CustomColors.ghostWhite,
                            shape: BoxShape.circle,
                            border: Border.all(color: CustomColors.lightWhite, width: 1),
                          ),
                          child: PopupMenuButton<String>(
                            icon: Icon(
                              Icons.menu_outlined,
                              color: CustomColors.black87,
                              size: 16,
                            ),
                            onSelected: (value) {
                              // Handle menu item selection
                              if (value == 'profile') {
                                print('Profile selected');
                              } else if (value == 'settings') {
                                print('Settings selected');
                              } else if (value == 'Back') {
                                print('Back Button');
                                Navigator.pop(context);
                              }
                            },
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItem<String>(
                                value: 'Back',
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_back, size: 12),
                                    SizedBox(width: 4),
                                    Text('Back'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
              ),

              // MAIN CONTENT
              Positioned(
                top: 66,
                right: 5,
                left: 5,
                bottom: 10,
                  child: Container(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: Constants.spacingSmall,
                      ), // EdgeInsets.symmetric
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          // Profile Image + Details of User
                          Container(
                            width: 333,
                            height: 216,
                            child: Column(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                // 1st Row - Profile Image
                                Container(
                                  width: 88,
                                  height: 88,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.littleWhite, // Placeholder color
                                    image: DecorationImage(
                                        image: AssetImage(Images.profile),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // 2nd Row - Name
                                Container(
                                 width: 138,
                                 height: 21,
                                 alignment: Alignment.center,
                                 child: Text(
                                   'Said Abderahman',
                                   style: TextStyle(
                                     fontFamily: Constants.primaryfont,
                                     fontWeight: FontWeight.bold,
                                     fontSize: Constants.fontSmall,
                                   ),
                                  ),
                                ),

                                // 3rd Row - Phone Number
                                Container(
                                 width: 175,
                                 height: Constants.fontMedium,
                                 decoration: BoxDecoration(
                                   color: Colors.transparent,
                                   borderRadius: .circular(4),
                                 ),
                                 alignment: Alignment.center,
                                 child: RichText(
                                     textAlign: TextAlign.center,
                                   text: TextSpan(
                                     children: [
                                       TextSpan(
                                         text: 'Phone number: ',
                                         style: TextStyle(
                                           fontFamily: Constants.primaryfont,
                                           fontSize: Constants.fontLittle,
                                           color: CustomColors.black87,
                                         ),
                                       ),
                                       TextSpan(
                                         text: '+965 356 6689',
                                         style: TextStyle(
                                           fontFamily: Constants.primaryfont,
                                           fontWeight: .bold,
                                           fontSize: Constants.fontLittle,
                                           color: CustomColors.black87,
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),),

                                // 4th Row - Email
                                Container(
                                  width: 184,
                                  height: Constants.fontMedium,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  alignment: Alignment.center,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [

                                        TextSpan(
                                          text: 'Email: ',
                                          style: TextStyle(
                                           fontFamily: Constants.primaryfont,
                                           fontSize: Constants.fontLittle,
                                           color: CustomColors.black87,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 's.abderahman@yahoo.ae',
                                          style: TextStyle(
                                            fontFamily: Constants.primaryfont,
                                            fontSize: Constants.fontLittle,
                                            color: CustomColors.black87,
                                            fontWeight: .bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Button - Change Password
                                CustomOutlineButton(
                                  text: 'Change password',
                                  onPressed: () {
                                    print('CLICKED ON CHANGED PASSWORD');
                                  },
                                ),
                              ],
                            ),
                          ),

                          // Settings Container Layout
                          Container(
                           width: 400,
                           height: 250,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               // 1st Row - Title
                               Container(
                                width: 400,
                                height: 52,
                                color: Colors.transparent,
                                padding: EdgeInsets.symmetric(horizontal: Constants.spacingLittle),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Settings',
                                  style: TextStyle(
                                    fontFamily: Constants.primaryfont,
                                    fontWeight: .bold,
                                    fontSize: Constants.fontMedium,
                                    color: CustomColors.black87,
                                  ),
                                ),
                               ),

                               // 2nd Row - Language Setting
                               _buildSettingRow(
                                 icon: Icons.language, // You can change this icon
                                 title: 'Language',
                                 subtitle: 'English',
                               ),

                               SizedBox(height: Constants.spacingSmall),

                               // 3rd Row - Another Setting (same as 2nd row)
                               _buildSettingRow(
                                 icon: Icons.notifications, // Example icon
                                 title: 'Notifications',
                                 subtitle: 'Enabled',
                               ),

                               SizedBox(height: Constants.spacingSmall),

                               // 4th Row - Privacy Policy
                               _buildSupportRow(
                                   icon: Icons.privacy_tip_outlined,
                                   title: 'Privacy Policy',
                               ),

                             ],
                           ),
                          ),

                          SizedBox(height: Constants.spacingSmall),

                          // Settings Container Layout
                          Container(
                            width: 400,
                            height: 186,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                // 1st Row - Title
                                Container(
                                  width: 400,
                                  height: 52,
                                  color: Colors.transparent,
                                  padding: EdgeInsets.symmetric(horizontal: Constants.spacingLittle),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Support',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontWeight: .bold,
                                      fontSize: Constants.fontMedium,
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // 4th Row - Privacy Policy
                                _buildSupportRow(
                                  icon: Icons.question_mark,
                                  title: 'Who we are?',
                                ),

                                SizedBox(height: Constants.spacingSmall),

                                _buildSupportRow(
                                    icon: Icons.headset_mic_rounded,
                                    title: 'Contact us',
                                ),
                              ],
                            ),
                          ),

                          CustomOutlineButton(
                              text: 'Logout'.toUpperCase(),
                              onPressed: (){
                                Navigator.pop(context);
                                print('CLICKED ON LOGOUT BUTTON');
                              }
                          ),

                          SizedBox(height: Constants.spacingSmall),

                          DarKPinkButton(
                            text: 'Delete account'.toUpperCase(),
                            onPressed: () {
                              print('Clicked on Delete account'.toUpperCase());
                            },
                            width: 400,
                            height: 52,
                          ),
                        ],
                      ),
                    ),
                  )
              ),


            ],
          ),
      ), );
  }

  Widget _buildSettingRow({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: 400,
      height: 56,
      decoration: BoxDecoration(
        color: CustomColors.ghostWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side container
          Container(
            width: 204,
            height: 36,
            child: Row(
              children: [
                // Icon
                Container(
                  width: 24,
                  height: 24,
                  child: Icon(
                    icon,
                    size: 24,
                    color: const Color(0xFF34362D),
                  ),
                ),

                SizedBox(width: Constants.spacingLittle),

                // Text column
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 24,
                      child: Text(
                        title.toUpperCase(),
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontWeight: FontWeight.w700,
                          fontSize: Constants.fontSmall,
                          color: CustomColors.black87,
                        ),
                      ),
                    ),

                    Container(
                      height: 13,
                      child: Text(
                        subtitle.toUpperCase(),
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontSize: Constants.fontLittle,
                          color: Color(0xFF34362D),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Right side icon (chevron)
          Container(
            width: 24,
            height: 24,
            child: const Icon(
              Icons.chevron_right,
              size: 24,
              color: Color(0xFF34362D),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportRow({
    required IconData icon,
    required String title,
  }){
    return Container(
      width: 400,
      height: 56,
      decoration: BoxDecoration(
        color: CustomColors.ghostWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side container
          Container(
            width: 204,
            height: 36,
            child: Row(
              children: [
                // Icon
                Container(
                  width: 24,
                  height: 24,
                  child: Icon(
                    icon,
                    size: 24,
                    color: const Color(0xFF34362D),
                  ),
                ),

                SizedBox(width: Constants.spacingLittle),

                // Text column
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 24,
                      child: Text(
                        title.toUpperCase(),
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontWeight: FontWeight.w700,
                          fontSize: Constants.fontSmall,
                          color: CustomColors.black87,
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),

          // Right side icon (chevron)
          Container(
            width: 24,
            height: 24,
            child: const Icon(
              Icons.chevron_right,
              size: 24,
              color: Color(0xFF34362D),
            ),
          ),
        ],
      ),
    );
  }
}
