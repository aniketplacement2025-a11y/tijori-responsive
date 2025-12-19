import 'package:flutter/material.dart';
import '../../utils/responsive_media_query.dart';

class ButtonWithThumsup extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback onPressed;
  final double imageWidth;
  final double imageHeight;
  final double buttonWidth;
  final double buttonHeight;
  final double fontSize;
  final List<Color> gradientColors;

  ButtonWithThumsup({
    super.key,
    required this.imagePath,
    required this.buttonText,
    required this.onPressed,
    this.imageWidth = 238,
    this.imageHeight = 156,
    this.buttonWidth = 464,
    this.buttonHeight = 64,
    this.fontSize = 16,
    this.gradientColors = const [
      Color(0xFF31C4EB),
      Color(0xFF0D9D99),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// IMAGE - Centered
        Container(
          width: imageWidth,
          height: imageHeight,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),

        SizedBox(height: Responsive.value<double>(
          context,
          mobile: 20,
          tablet: 24,
          desktop: 28,
        )),

        /// BUTTON - Centered
        SizedBox(
          width: buttonWidth,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Responsive.value<double>(
                    context,
                    mobile: 4,
                    tablet: 5,
                    desktop: 6,
                  ),
                ),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: gradientColors,
                  stops: [-0.5385, 1.5],
                ),
                borderRadius: BorderRadius.circular(
                  Responsive.value<double>(
                    context,
                    mobile: 4,
                    tablet: 5,
                    desktop: 6,
                  ),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Container(
                width: double.infinity,
                height: buttonHeight,
                alignment: Alignment.center,
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}