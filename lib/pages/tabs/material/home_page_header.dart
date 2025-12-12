import 'package:flutter/material.dart';

import '../../../utils/Images.dart';
import '../../../utils/constants.dart';
import '../../../utils/custom_colors.dart';
import '../../../utils/responsive_media_query.dart';
import '../../features/profile_page.dart';

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({super.key});

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: Responsive.screenWidth(context) * 0.88,
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Changed from spaceAround
        crossAxisAlignment:
        CrossAxisAlignment.center, // Changed from start
        children: [
          // 1. LEFT SIDE: Profile Image + Welcome Text
          Row(
            children: [
              // Profile Image
              GestureDetector(
                onTap: () {
                  print("Clicked on Profile Image");
                },
                child: Container(
                  width: 36,
                  height: 36,
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

              SizedBox(width: Constants.spacingLittle),

              // Welcome Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.fontLittle,
                      color: CustomColors.black87,
                    ),
                  ),
                  Text(
                    'Abderahman',
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.fontLittle,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(width: Constants.spacingHigh),

          // 2. MIDDLE: Create Reminder Button (Bell + Text)
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
                  // Bell Image
                  Image.asset(Images.bell, width: 16, height: 16),

                  SizedBox(width: Constants.spacingLittle),

                  // "Create reminder" text
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

          // 3. RIGHT SIDE: Popup Menu Button
          Container(
            decoration: BoxDecoration(
              color: CustomColors.ghostWhite,
              shape: BoxShape.circle,
              border: Border.all(color: CustomColors.lightWhite, width: 1),
            ),
            child: IconButton(
              icon: Icon(Icons.menu_outlined, color: CustomColors.black87, size: 16),
              onPressed: () {
                print("Clicked on Menu Button");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
