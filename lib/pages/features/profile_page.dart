import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/outline_button.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/dart_pink_button.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';

import '../../auth/signin_login_page.dart';
import '../../services/functions/storage_area_of_access_token.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../widgets/dialogs/success_dialog.dart';

class ProfilePage extends StatefulWidget {
  final bool isCommercial;

  ProfilePage({
    super.key,
    required this.isCommercial,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String checkName(){
    print("Name : ${StorageAreaOfAccessToken.instance.getName()}");
    String name = StorageAreaOfAccessToken.instance.getName();
    return name;
  }

  String checkEmail(){
    print("Email : ${StorageAreaOfAccessToken.instance.getEmail()}");
    String name = StorageAreaOfAccessToken.instance.getEmail();
    return name;
  }

  List<String> checkPhone(){
    print("Phone: ${StorageAreaOfAccessToken.instance.getPhone()}");
    List<String> phone = StorageAreaOfAccessToken.instance.getPhone();
    return phone;
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      body: OnboardingBackground(
          child: Stack(
            children: [

              // FIXED HEADER
              Positioned(
                top: Responsive.value<double>(
                  context,
                  mobile: 28,
                  tablet: 32,
                  desktop: 36,
                ),
                left: isMobile ? 8 : 12,
                right: isMobile ? 8 : 12,
                  child: Container(
                    height: Responsive.value<double>(
                      context,
                      mobile: 44,
                      tablet: 48,
                      desktop: 52,
                    ),
                    width: Responsive.screenWidth(context) * (isMobile ? 0.95 : 0.9),
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
                              horizontal: Responsive.value<double>(
                                context,
                                mobile: 16,
                                tablet: 18,
                                desktop: 20,
                              ),
                              vertical: Responsive.value<double>(
                                context,
                                mobile: 10,
                                tablet: 12,
                                desktop: 14,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: CustomColors.ghostWhite.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                Responsive.value<double>(
                                  context,
                                  mobile: 16,
                                  tablet: 18,
                                  desktop: 20,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: CustomColors.blackBS1.withOpacity(0.05),
                                  blurRadius: Responsive.value<double>(
                                    context,
                                    mobile: 12,
                                    tablet: 14,
                                    desktop: 16,
                                  ),
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                // Bell Image
                                Image.asset(
                                  Images.bell,
                                  width: Responsive.value<double>(
                                    context,
                                    mobile: 28,
                                    tablet: 32,
                                    desktop: 36,
                                  ),
                                  height: Responsive.value<double>(
                                    context,
                                    mobile: 28,
                                    tablet: 32,
                                    desktop: 36,
                                  ),
                                ),

                                SizedBox(width: Constants.getSpacingLittle(context)),

                                // "Create reminder" text
                                Text(
                                  'Create reminder',
                                  style: TextStyle(
                                    fontFamily: Constants.primaryfont,
                                    fontSize: Constants.getFontSmall(context),
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
                              size: Responsive.value<double>(
                                context,
                                mobile: 16,
                                tablet: 18,
                                desktop: 20,
                              ),
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
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .center,
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
                                   checkName(),
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
                                         text: "${checkPhone()[0]}  ${checkPhone()[1]}",
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
                                          text: checkEmail(),
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
                                print('CLICKED ON LOGOUT BUTTON');
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return SuccessDialog(
                                      initialHeight: 200,
                                      onComplete: () async {
                                        await StorageAreaOfAccessToken.instance.logout();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SigninLoginPage(
                                                isCommercial: widget.isCommercial
                                            ),
                                          ),
                                        );
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'To Login Again U Have to Sign In',
                                            ),
                                          ),
                                        );
                                      },
                                      imageAsset: Images.Logout,
                                      title: 'Confirm Logout',
                                      subtitle:
                                      'Are U Sure U Want to log out?',
                                      buttonText:
                                      'OK',
                                    );
                                  },
                                );
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
