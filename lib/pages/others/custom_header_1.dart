import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';

class CustomHeader1 extends StatelessWidget {
  final String title; // Arabic text
  final String flagAsset; // Image path

  const CustomHeader1({
    super.key,
    required this.title,
    required this.flagAsset,
  });

  @override
  Widget build(BuildContext context) {
   return Container(
     height: Constants.headerHeight,
     //width: double.infinity,
     padding: EdgeInsets.symmetric(horizontal: Constants.spacingSmall),

     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       mainAxisSize: MainAxisSize.min, // Important: Don't expand infinity
       children: [
         //Arabic Text
         Text(
           title,
           style: TextStyle(
             fontSize: Constants.fontSmall,
             fontWeight: FontWeight.bold,
             color: CustomColors.black87,
             fontFamily: 'Arial', // Use a font that supports Arabic
           ),
           textAlign: TextAlign.center,
         ),
         SizedBox(width: Constants.spacingSmall),

         // Kuwait Flag - using asset image
         Image.asset(
           flagAsset,
           width: Constants.FlagSizeSmall,
           height: Constants.FlagSizeSmall,
           fit: BoxFit.contain,
         ),
       ],
     ),
   );
  }
}