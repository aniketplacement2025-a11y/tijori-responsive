import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class DarKPinkButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const DarKPinkButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     child: ElevatedButton(
         onPressed: onPressed,
         style: ElevatedButton.styleFrom(
           backgroundColor: const Color(0xFFFA3A63), // var(--Purple)
           foregroundColor: Colors.white,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(100),
           ),
           shadowColor: Colors.transparent,
           padding: EdgeInsets.symmetric(
             horizontal: Constants.spacingSmall,
           ),
         ),
         child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Text(
           text,
           style: TextStyle(
             fontFamily: Constants.primaryfont,
             fontWeight: FontWeight.bold,
             fontSize: Constants.fontSmall,
           ),
         ),
      ),
     ),
    );
  }
}
