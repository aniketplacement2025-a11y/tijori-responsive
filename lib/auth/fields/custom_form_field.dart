import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';

class CustomFormField extends StatelessWidget{
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const CustomFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
         children: [
           Text(
            label,
            style: TextStyle(
              fontSize: Constants.fontSmall,
              color: CustomColors.littleWhite,
             ),
           ),

           Text(
             ' *',
             style: TextStyle(
               fontSize: Constants.fontSmall,
               color: CustomColors.red,
             ),
           )
         ],
        ),
        SizedBox(height: Constants.spacingLittle),

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: suffixIcon, // Use the passed icon
            hintText: hintText,
            filled: true,
            fillColor: CustomColors.lightWhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        )
      ],
    );
  }
}