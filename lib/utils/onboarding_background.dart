import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'responsive_media_query.dart';

class OnboardingBackground extends StatelessWidget {
  final Widget child;
  final BorderRadiusGeometry? borderRadius;

  const OnboardingBackground({
    super.key,
    required this.child,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.screenWidth(context),
      height: Responsive.screenHeight(context),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors.white,
            CustomColors.lightBlue,
          ],
          stops: [0.25, 1.0], // 25% white, 100% light blue at bottom
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}