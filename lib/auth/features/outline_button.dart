import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;

  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 400,
    this.height = 52,
    this.backgroundColor = CustomColors.ghostWhite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: backgroundColor,
          side: BorderSide(
            color: backgroundColor,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Constants.spacingSmall,
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: Constants.primaryfont,
            fontSize: Constants.fontSmall,
            color: CustomColors.black87,
          ),
        ),
      ),
    );
  }
}