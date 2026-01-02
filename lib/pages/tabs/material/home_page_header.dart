import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/commercial_premium_page.dart';
import 'package:vkaps_it_solution_project_tijori/services/functions/storage_area_of_access_token.dart';
import '../../../utils/Images.dart';
import '../../../utils/constants.dart';
import '../../../utils/custom_colors.dart';
import '../../../utils/responsive_media_query.dart';
import '../../features/profile_page.dart';

class HomePageHeader extends StatefulWidget {
  final bool isCommercial;

  HomePageHeader({
    super.key,
    required this.isCommercial,
  });

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {

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

    // Update constants
    Constants.updateFromContext(context);

    return SizedBox(
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
          Row(
            children: [
              // Profile Image
              GestureDetector(
                onTap: () {
                  print("Clicked on Profile Image");
                },
                child: Container(
                  width: Responsive.value<double>(
                    context,
                    mobile: 44,
                    tablet: 48,
                    desktop: 52,
                  ),
                  height: Responsive.value<double>(
                    context,
                    mobile: 44,
                    tablet: 48,
                    desktop: 52,
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
                      color: CustomColors.black87,
                    ),
                  ),
                  Text(
                    checkName(),
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.getFontSmall(context),
                      fontWeight: FontWeight.bold,
                      color: CustomColors.black87,
                    ),
                  ),
                ],
              ),
            ],
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
                  mobile: 12,
                  tablet: 14,
                  desktop: 16,
                ),
                vertical: Responsive.value<double>(
                  context,
                  mobile: 6,
                  tablet: 7,
                  desktop: 8,
                ),
              ),
              decoration: BoxDecoration(
                color: CustomColors.ghostWhite,
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
                    color: CustomColors.blackBS1,
                    blurRadius: Responsive.value<double>(
                      context,
                      mobile: 8,
                      tablet: 9,
                      desktop: 10,
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
                      mobile: 24,
                      tablet: 28,
                      desktop: 32,
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

          // RIGHT SIDE: Popup Menu Button
          Container(
            decoration: BoxDecoration(
              color: CustomColors.ghostWhite,
              shape: BoxShape.circle,
              border: Border.all(
                color: CustomColors.lightWhite,
                width: 1,
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.menu_outlined,
                color: CustomColors.black87,
                size: Responsive.value<double>(
                  context,
                  mobile: 24,
                  tablet: 28,
                  desktop: 32,
                ),
              ),
              onPressed: () {
                print("Clicked on Menu Button");
                if(widget.isCommercial){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommercialPremiumPage(
                        isCommercial: widget.isCommercial,
                    )),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage(
                      isCommercial: widget.isCommercial,
                    )),
                  );
                }
              },
              padding: EdgeInsets.all(
                Responsive.value<double>(
                  context,
                  mobile: 6,
                  tablet: 7,
                  desktop: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}