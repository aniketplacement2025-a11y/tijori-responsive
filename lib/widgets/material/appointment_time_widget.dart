import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';

import '../../utils/Images.dart';

class AppointmentTimeWidget extends StatelessWidget {
  const AppointmentTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row - Label
          Container(
            width: 335,
            height: Constants.fontMedium,
            alignment: Alignment.centerLeft,
            child: Text(
              'Appointment time',
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: Constants.fontSmall,
                color: CustomColors.littleWhite,
              ),
            ),
          ),
          const SizedBox(height: 5),

          // Second Row - Input fields
          Container(
            width: 350,
            height: 56,
            child: Row(
              children: [
                // Hours TextField
                Container(
                  width: 108,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0x0A000000), // #00000005
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Hours',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 5),

                // Colon Text
                Container(
                  height: 56,
                  alignment: Alignment.center,
                  child: const Text(
                    ':',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 5),

                // Minutes TextField
                Container(
                  width: 108,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0x0A000000), // #00000005
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Minutes',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 5),

                // AM/PM Box
                Container(
                  width: 95,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'AM',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 1.0, // line-height: 100%
                          letterSpacing: 0,
                        ),
                      ),
                      Image.asset(
                        Images.bottomarrowIcon,
                        fit: BoxFit.contain,
                      )
                    ],
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