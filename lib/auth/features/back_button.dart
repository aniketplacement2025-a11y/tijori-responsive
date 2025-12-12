import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomBackButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.fontMedium,
      height: Constants.fontMedium,
      decoration: BoxDecoration(
        color: CustomColors.lightWhite,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back),
        padding: const EdgeInsets.only(
          top: 8,
          right: 4,
          bottom: 8,
          left: 4,
        ),
      ),
    );
  }
}