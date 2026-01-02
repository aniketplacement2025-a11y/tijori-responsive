import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/gradient_button.dart';
import 'package:vkaps_it_solution_project_tijori/auth/signin_login_page.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/profile_page.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/companies_and_branches_list.dart';

import '../../services/functions/storage_area_of_access_token.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';
import '../../widgets/dialogs/success_dialog.dart';

class CommercialPremiumPage extends StatefulWidget {
  final bool isCommercial;

  CommercialPremiumPage({
    super.key,
    required this.isCommercial,
  });

  @override
  State<CommercialPremiumPage> createState() => _CommercialPremiumPageState();
}

class _CommercialPremiumPageState extends State<CommercialPremiumPage> {

  String checkName(){
    print("Name : ${StorageAreaOfAccessToken.instance.getName()}");
    String name = StorageAreaOfAccessToken.instance.getName();
    List<String> firstName = name.split(" ");
    name = firstName[0];
    return name;
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors.gradientBlue,
              CustomColors.lightBlue,
            ],
            stops: const [0.25, 1.0],
          ),
          // Responsive border radius
          borderRadius: BorderRadius.circular(
            Responsive.isMobile(context) ? 20 : 40,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              offset: Offset(0, Responsive.isMobile(context) ? 2 : 0),
            ),
          ],
        ),
        child: Stack(
          children: [

            // Header Fixed at top - Responsive positioning
            Positioned(
              top: Responsive.value<double>(
                context,
                mobile: 44,
                tablet: 52,
                desktop: 58,
              ),
              left: isMobile ? 8 : 12,
              right: isMobile ? 8 : 12,
              child: SizedBox(
                height: Responsive.value<double>(
                  context,
                  mobile: 44,
                  tablet: 48,
                  desktop: 52,
                ),
                width: Responsive.screenWidth(context) * (isMobile ? 0.95 : 0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // LEFT SIDE: Profile Image + Welcome Text
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                  isCommercial: widget.isCommercial,
                                ),
                            ),
                        );
                      },
                      child: Row(
                        children: [
                          // Profile Image
                           Container(
                              width: Responsive.value<double>(
                                context,
                                mobile: 48,
                                tablet: 52,
                                desktop: 56,
                              ),
                              height: Responsive.value<double>(
                                context,
                                mobile: 48,
                                tablet: 52,
                                desktop: 56,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColors.ghostWhite,
                                image: DecorationImage(
                                  image: AssetImage(Images.profile),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  color: CustomColors.lightWhite,
                                  width: 2,
                                ),
                              ),
                            ),

                          SizedBox(width: Constants.getSpacingLittle(context)),

                          // Welcome Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.getFontSmall(context),
                                  color: CustomColors.ghostWhite,
                                ),
                              ),
                              Text(
                                checkName(),
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.getFontSmall(context),
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.ghostWhite,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: Constants.getSpacingMedium(context)),

                    // MIDDLE: Create Reminder Button (Bell + Text)
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
                              Images.whitebell,
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
                                color: CustomColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // RIGHT SIDE: Popup Menu Button
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColors.ghostWhite.withOpacity(0.5),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: CustomColors.lightWhite,
                          width: 1,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          print("Clicked on Cross Button");
                          Navigator.pop(context);
                        },
                        child: Text(
                          'X',
                          style: TextStyle(
                            fontSize: Constants.fontMedium,
                            fontWeight: .bold,
                            color: CustomColors.ghostWhite,
                            fontFamily: Constants.primaryfont,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
                top: Responsive.value<double>(
                  context,
                  mobile: 196,
                  tablet: 200,
                  desktop: 204,
                ),
                left: isMobile ? 12 : 16,
                right: isMobile ? 12 : 16,
                child: CompaniesAndBranchesList(),
            ),

            Positioned(
                top: Responsive.value<double>(
                  context,
                  mobile: 544,
                  tablet: 546,
                  desktop: 548,
                ),
                left: isMobile ? 8 : 12,
                right: isMobile ? 8 : 12,
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    Gbutton(
                      text: 'LOGOUT',
                      width: Responsive.value<double>(
                        context,
                        mobile: 375,
                        tablet: 425,
                        desktop: 475,
                      ),
                      height: Responsive.value<double>(
                        context,
                        mobile: 55,
                        tablet: 60,
                        desktop: 65,
                      ),
                      onPressed: () async {
                        print("PRESSED ON LOGOUT BUTTON");
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
                      },
                    ),

                    SizedBox(height: Constants.getSpacingMedium(context)),

                    Gbutton(
                      text: 'DELETE ACCOUNT',
                      width: Responsive.value<double>(
                        context,
                        mobile: 375,
                        tablet: 425,
                        desktop: 475,
                      ),
                      height: Responsive.value<double>(
                        context,
                        mobile: 55,
                        tablet: 60,
                        desktop: 65,
                      ),
                      onPressed: () {
                        print("PRESSED ON DELETE ACCOUNT BUTTON");
                      },
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  Widget Gbutton({
    required String text,
    required VoidCallback onPressed,
    required double width,
    required double height,
   }){
   return SizedBox(
     width: width,
     height: height,
     child: ElevatedButton(
       onPressed: onPressed,
       style: ElevatedButton.styleFrom(
         backgroundColor: Colors.transparent,
         foregroundColor: CustomColors.black87,
         shadowColor: Colors.transparent,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(4),
         ),
         padding: EdgeInsets.symmetric(
           horizontal: Constants.spacingSmall,
         ),
       ),
         child: Container(
           width: double.infinity,
           height: height,
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
           alignment: Alignment.center,
           child: Text(
             text,
             style: TextStyle(
               fontFamily: Constants.primaryfont,
               fontWeight: FontWeight.w700,
               fontSize: Constants.fontSmall,
               color: CustomColors.black87,
             ),
           ),
         ),
     ),
   );
  }
}
