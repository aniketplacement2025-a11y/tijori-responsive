import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/Images.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';

class CustomPhoneField extends StatelessWidget{
  // CustomPhoneField({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
         children: [
          Text(
            'Phone Number',
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
          ),
         ],
        ),

        SizedBox(height: Constants.spacingLittle),

        Container(
          height: 40, // Fixed height for better control
          decoration: BoxDecoration(
            color: CustomColors.lightWhite,
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(
            //   color: Colors.grey[300]!,
            //   width: 1,
            // )
          ),
          child: Row(
          children: [
            // Country Code Section
           Container(
             width: 96,
             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
             decoration: BoxDecoration(
               color: CustomColors.lightWhite,
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(8),
                 bottomLeft: Radius.circular(8),
               ),
               // border: Border(
               //   right: BorderSide(
               //     color: Colors.grey[300]!,
               //     width: 1,
               //   ),
               // ),
             ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Images.flagAsset,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: Constants.spacingSmall),
                Text(
                  '+965',
                  style: TextStyle(
                    fontSize: Constants.fontSmall,
                    color: CustomColors.black87,
                  ),
                ),
              ],
            ),
          ),

            // Phone Number Input Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.phone),
                    border: InputBorder.none,
                    hintText: '000 0000',
                    hintStyle: TextStyle(
                      fontSize: Constants.fontSmall,
                      color: Colors.black87,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  style: TextStyle(
                    fontSize: Constants.fontSmall,
                    color: CustomColors.black87,
                  ),
                  keyboardType: TextInputType.phone,
                ),
               ),
           ),
         ],
        ),
        ),
      ],
    );
  }
}