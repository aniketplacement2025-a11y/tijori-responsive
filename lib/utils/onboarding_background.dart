// onboarding_background.dart
import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'responsive_media_query.dart';

class OnboardingBackground extends StatelessWidget {
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final bool useSafeArea;

  const OnboardingBackground({
    super.key,
    required this.child,
    this.borderRadius,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    final double width = Responsive.screenWidth(context);
    final double height = Responsive.screenHeight(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors.white,
            CustomColors.lightBlue,
          ],
          stops: const [0.25, 1.0],
        ),
        // Responsive border radius
        borderRadius: borderRadius ?? BorderRadius.circular(
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
      child: useSafeArea
          ? SafeArea(child: child)
          : child,
    );
  }
}