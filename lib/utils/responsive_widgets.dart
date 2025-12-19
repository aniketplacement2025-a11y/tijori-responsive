// responsive_widgets.dart
import 'package:flutter/material.dart';
import 'responsive_media_query.dart';
import 'constants.dart';

class ResponsiveWidgets {
  // Responsive Container with adaptive padding
  static Container responsiveContainer({
    required BuildContext context,
    required Widget child,
    EdgeInsets? mobilePadding,
    EdgeInsets? tabletPadding,
    EdgeInsets? desktopPadding,
    BoxDecoration? decoration,
  }) {
    return Container(
      padding: Responsive.value<EdgeInsets>(
        context,
        mobile: mobilePadding ?? EdgeInsets.all(Constants.getSpacingMedium(context)),
        tablet: tabletPadding ?? EdgeInsets.all(Constants.getSpacingHigh(context)),
        desktop: desktopPadding ?? EdgeInsets.all(Constants.getSpacingLarge(context)),
      ),
      decoration: decoration,
      child: child,
    );
  }

  // Responsive Text
  static Text responsiveText({
    required BuildContext context,
    required String text,
    TextStyle? mobileStyle,
    TextStyle? tabletStyle,
    TextStyle? desktopStyle,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: Responsive.value<TextStyle>(
        context,
        mobile: mobileStyle ?? TextStyle(
          fontSize: Constants.getFontMedium(context),
          fontFamily: Constants.primaryfont, // Fixed: lowercase 'f'
        ),
        tablet: tabletStyle ?? TextStyle(
          fontSize: Constants.getFontMedium(context),
          fontFamily: Constants.primaryfont, // Fixed: lowercase 'f'
        ),
        desktop: desktopStyle ?? TextStyle(
          fontSize: Constants.getFontLarge(context),
          fontFamily: Constants.primaryfont, // Fixed: lowercase 'f'
        ),
      ),
    );
  }

  // Responsive Button
  static ElevatedButton responsiveButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required Widget child,
    EdgeInsets? mobilePadding,
    EdgeInsets? tabletPadding,
    EdgeInsets? desktopPadding,
    ButtonStyle? style,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: style ?? ElevatedButton.styleFrom(
        padding: Responsive.value<EdgeInsets>(
          context,
          mobile: mobilePadding ?? EdgeInsets.symmetric(
            horizontal: Constants.getSpacingMedium(context),
            vertical: Constants.getSpacingSmall(context),
          ),
          tablet: tabletPadding ?? EdgeInsets.symmetric(
            horizontal: Constants.getSpacingHigh(context),
            vertical: Constants.getSpacingMedium(context),
          ),
          desktop: desktopPadding ?? EdgeInsets.symmetric(
            horizontal: Constants.getSpacingLarge(context),
            vertical: Constants.getSpacingHigh(context),
          ),
        ),
      ),
    );
  }

  // Responsive SizedBox for spacing
  static SizedBox responsiveSizedBox({
    required BuildContext context,
    double? width,
    double? height,
    bool useHeightForSpacing = true,
  }) {
    if (useHeightForSpacing && height != null) {
      return SizedBox(
        width: width,
        height: height * (Responsive.isMobile(context) ? 1.0 : 1.2),
      );
    }
    return SizedBox(width: width, height: height);
  }

  // Simple responsive padding
  static EdgeInsets responsivePadding({
    required BuildContext context,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    final double multiplier = Responsive.isMobile(context) ? 1.0 : 1.2;

    return EdgeInsets.only(
      top: (top ?? vertical ?? all ?? 0) * multiplier,
      bottom: (bottom ?? vertical ?? all ?? 0) * multiplier,
      left: (left ?? horizontal ?? all ?? 0) * multiplier,
      right: (right ?? horizontal ?? all ?? 0) * multiplier,
    );
  }
}