// constants.dart
import 'package:flutter/material.dart';
import 'responsive_media_query.dart';

class Constants {
 // Keep OLD static variables (for backward compatibility)
 static double screenWidth = 0;
 static double screenHeight = 0;
 static String primaryfont = 'Cairo'; // Note: lowercase 'f'
 static double fontLarge = 32;
 static double fontMedium = 24;
 static double fontSmall = 16;
 static double fontLittle = 12;
 static double spacingLittle = 4;
 static double spacingSmall = 8;
 static double spacingMedium = 16;
 static double spacingHigh = 24;
 static double spacingLarge = 32;
 static double FlagSizeLarge = 32;
 static double FlagSizeSmall = 16;
 static double headerHeight = 80;

 // NEW: Responsive getters (FIXED VERSION)
 static double getFontLarge(BuildContext context) =>
     Responsive.isMobile(context) ? 28 : fontLarge;

 static double getFontMedium(BuildContext context) =>
     Responsive.isMobile(context) ? 20 : fontMedium;

 static double getFontSmall(BuildContext context) =>
     Responsive.isMobile(context) ? 14 : fontSmall;

 static double getFontLittle(BuildContext context) =>
     Responsive.isMobile(context) ? 10 : fontLittle;

 static double getSpacingLittle(BuildContext context) =>
     Responsive.isMobile(context) ? 4 : 6;

 static double getSpacingSmall(BuildContext context) =>
     Responsive.isMobile(context) ? 8 : 12;

 static double getSpacingMedium(BuildContext context) =>
     Responsive.isMobile(context) ? 16 : 20;

 static double getSpacingHigh(BuildContext context) =>
     Responsive.isMobile(context) ? 20 : 24;

 static double getSpacingLarge(BuildContext context) =>
     Responsive.isMobile(context) ? 28 : 32;

 static double getFlagSizeLarge(BuildContext context) =>
     Responsive.isMobile(context) ? 28 : 32;

 static double getFlagSizeSmall(BuildContext context) =>
     Responsive.isMobile(context) ? 14 : 16;

 static double getHeaderHeight(BuildContext context) =>
     Responsive.isMobile(context) ? 60 : 80;

 // Helper to update all static values (call once in main.dart)
 static void updateFromContext(BuildContext context) {
  screenWidth = MediaQuery.of(context).size.width;
  screenHeight = MediaQuery.of(context).size.height;

  // Optionally update static values based on screen size
  if (screenWidth < 600) { // Mobile
   fontLarge = 28;
   fontMedium = 20;
   fontSmall = 14;
   fontLittle = 10;
   spacingMedium = 16;
   spacingLarge = 28;
   headerHeight = 60;
  } else if (screenWidth < 1200) { // Tablet
   fontLarge = 32;
   fontMedium = 24;
   fontSmall = 16;
   fontLittle = 12;
   spacingMedium = 20;
   spacingLarge = 32;
   headerHeight = 70;
  } else { // Desktop
   fontLarge = 36;
   fontMedium = 28;
   fontSmall = 18;
   fontLittle = 14;
   spacingMedium = 24;
   spacingLarge = 36;
   headerHeight = 80;
  }
 }
}