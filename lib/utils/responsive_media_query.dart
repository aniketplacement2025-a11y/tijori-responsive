// responsive_media_query.dart
import 'package:flutter/material.dart';

class Responsive {
  // Screen dimensions
  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  // Device type detection
  static bool isMobile(BuildContext context) => screenWidth(context) < 600;
  static bool isTablet(BuildContext context) => screenWidth(context) >= 600 && screenWidth(context) < 1200;
  static bool isDesktop(BuildContext context) => screenWidth(context) >= 1200;

  // Safe area handling
  static double safeAreaTop(BuildContext context) => MediaQuery.of(context).padding.top;
  static double safeAreaBottom(BuildContext context) => MediaQuery.of(context).padding.bottom;
  static double safeAreaHeight(BuildContext context) =>
      screenHeight(context) - safeAreaTop(context) - safeAreaBottom(context);

  // Orientation
  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;
  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  // Responsive value getter (useful for different screen sizes)
  static T value<T>(BuildContext context,
      {required T mobile,
        T? tablet,
        T? desktop}) {
    if (isDesktop(context) && desktop != null) return desktop;
    if (isTablet(context) && tablet != null) return tablet;
    return mobile;
  }

  // Responsive text scale factor
  static double textScaleFactor(BuildContext context) =>
      MediaQuery.of(context).textScaleFactor;

  // Platform detection (if needed for OS-specific UI)
  static bool isIOS(BuildContext context) => Theme.of(context).platform == TargetPlatform.iOS;
  static bool isAndroid(BuildContext context) => Theme.of(context).platform == TargetPlatform.android;
}