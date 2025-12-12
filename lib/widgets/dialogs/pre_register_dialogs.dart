import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';

class PreRegisterDialog extends StatelessWidget {
  final Function(String) onUserTypeSelected;

  const PreRegisterDialog({super.key, required this.onUserTypeSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 256),
      child: Container(
        height: Responsive.screenHeight(context) * 0.5,
        // Takes half screen from center to bottom
        decoration: BoxDecoration(
          color: CustomColors.ghostWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: CustomColors.blackBS1,
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Stack(
          // Use Stack instead of Column for absolute positioning
          children: [
            // Main Content
            Column(
              children: [
                //Drag handle
                Container(
                  margin: EdgeInsets.only(top: 8, bottom: 4, left: 150),
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            // Close button positioned at top right
            Positioned(
              right: 4,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close),
                iconSize: Constants.fontMedium,
                color: CustomColors.black87,
                padding: EdgeInsets.all(2),
              ),
            ),

            // Clouds
            Positioned(
              left: 8,
              top: 28,
              // bottom: 148,
              child: Image.asset(
                Images.person_logo,
                width: 348,
                fit: BoxFit.contain,
              ),
            ),

            // Bottom Content Section
            Positioned(
              left: 40,
              bottom: 8,
              child: Container(
                width: 290,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left Button - "PRESONAL USER"
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        height: 40,
                        decoration: BoxDecoration(
                          color: CustomColors.gradientBlue,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.blackBS1,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            print('PRESSED ON PRESONAL BUTTON');
                            onUserTypeSelected('personal');
                            // Navigator.of(context).pop();
                          },
                          child: Text(
                            'PERSONAL USER',
                            style: TextStyle(
                              fontSize: Constants.fontLittle,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.ghostWhite,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Right Button - "COMMERCIAL USER"
                    Expanded(
                      // Use Expanded to share available space
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
                        // Add spacing between buttons
                        height: 40,
                        decoration: BoxDecoration(
                          color: CustomColors.black87,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.blackBS1,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            print("PRESSED COMMRECIAL BUTTON");
                            onUserTypeSelected('commercial');
                            // Navigator.of(context).pop();
                          },
                          child: Text(
                            'COMMERCIAL USER',
                            style: TextStyle(
                              fontSize: Constants.fontLittle,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.ghostWhite,
                            ),
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
