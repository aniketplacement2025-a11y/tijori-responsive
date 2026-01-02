import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';

class DocumentUploadButton extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? fileName;
  final VoidCallback onPressed;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment? rowAlignment;

  const DocumentUploadButton({
    Key? key,
    this.labelText,
    this.hintText,
    this.fileName,
    required this.onPressed,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.borderRadius,
    this.padding,
    this.rowAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          borderRadius ?? Responsive.value<double>(
            context,
            mobile: 8,
            tablet: 10,
            desktop: 12,
          ),
        ),
        border: Border.all(
          color: borderColor ?? CustomColors.lightWhite,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                labelText!,
                style: TextStyle(
                  fontSize: Constants.getFontSmall(context),
                  color: CustomColors.littleWhite,
                  fontFamily: Constants.primaryfont,
                ),
              ),
              Text(
                ' *',
                style: TextStyle(
                  fontSize: Constants.getFontSmall(context),
                  color: CustomColors.red,
                  fontFamily: Constants.primaryfont,
                ),
              )
            ],
          ),

          SizedBox(height: Constants.getSpacingLittle(context)),

          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: padding ?? EdgeInsets.symmetric(
                horizontal: Responsive.value<double>(
                  context,
                  mobile: 16,
                  tablet: 20,
                  desktop: 24,
                ),
                vertical: Responsive.value<double>(
                  context,
                  mobile: 12,
                  tablet: 14,
                  desktop: 16,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: rowAlignment ?? MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Text showing file name or label
                Expanded(
                  child: Text(
                    fileName ?? hintText ?? 'Upload Document',
                    style: TextStyle(
                      fontSize: Constants.getFontLittle(context),
                      color: textColor ?? CustomColors.littleWhite,
                      fontFamily: Constants.primaryfont,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}