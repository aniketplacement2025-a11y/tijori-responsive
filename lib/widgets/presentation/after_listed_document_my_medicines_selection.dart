import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/gradient_button.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/features/home_category_card.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import '../../pages/official_landing_page.dart';
import '../../utils/Images.dart';

import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../dialogs/success_dialog.dart';
import '../material/positioned_header_back_icon.dart';

class MedicinesTimePeriodData {
  static final List<Map<String, String>> time = [
    {'icon': Images.circleright, 'title': 'Daily'},
    {'icon': Images.circleright, 'title': 'Weekly'},
    {'icon': Images.circleright, 'title': 'Monthly'},
    {'icon': Images.circleright, 'title': 'Annual'},
  ];
}

class AfterListedDocumentMyMedicinesSelection extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isCommercial;

  const AfterListedDocumentMyMedicinesSelection({
    super.key,
    required this.isCommercial,
    required this.title,
    required this.subtitle,
  });

  @override
  State<AfterListedDocumentMyMedicinesSelection> createState() =>
      _AfterListedDocumentMyMedicinesSelectionState();
}

class _AfterListedDocumentMyMedicinesSelectionState
    extends State<AfterListedDocumentMyMedicinesSelection> {
  TextEditingController _controller = TextEditingController();
  bool? _acceptItems = false;
  int? _selectedCategoryIndex; // Track selected Category index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // FIXED HEADER WITH BELL ICON
            PositionedHeaderBackIcon(
              context: context,
              top: 20,
              left: 4,
              right: 0,
              onBackPressed: () {
                print('Custom back action');
                Navigator.pop(context);
              },
              onReminderPressed: () {
                print('Custom reminder action');
                // Show reminder dialog
              },
            ),

            // Title + SubTitle Box
            Positioned(
              top: 72,
              left: 10,
              right: 10,
              child: Container(
                alignment: .center,
                height: 96,
                padding: EdgeInsets.only(
                  top: 20,
                  right: 10,
                  bottom: 20,
                  left: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: .circular(16),
                  border: Border.all(color: CustomColors.black87, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    // Row 1: Bucket name with icon
                    SizedBox(
                      width: 330,
                      height: 22,
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          // SizedBox(width: Constants.spacingHigh),

                          // Icon/Image
                          Container(
                            width: Constants.fontMedium,
                            height: Constants.fontMedium,
                            child: Image.asset(
                              Images.projectIcon,
                              fit: BoxFit.contain,
                            ),
                          ),

                          SizedBox(width: Constants.spacingSmall),

                          // Bucket Text
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: 286, // Maximum width
                              minWidth: 100, // Minimum width if needed
                            ),
                            height: Constants.fontSmall,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Bucket: ',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.fontSmall,
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${widget.title}',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.fontSmall,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Row 2: Type
                    SizedBox(
                      width: 280,
                      height: 20,
                      child: Align(
                        alignment: Alignment.center, // Align to right
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Type: ',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.black87,
                                ),
                              ),
                              TextSpan(
                                text: '${widget.subtitle.toLowerCase()}',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontSmall,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // MAIN SCROLLABLE CONTENT
            Positioned(
              top: 175,
              left: 0,
              right: 0,
              bottom: 10,
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.spacingLittle,
                  ),
                  child: Column(
                    crossAxisAlignment: .center,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          // Left: "About the Medicine" Title
                          Flexible(
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 220),
                              child: Text(
                                'About the Medicine',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: 18,
                                  fontWeight: .bold,
                                  color: CustomColors.black87,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: Constants.spacingHigh,
                            height: Constants.spacingLarge,
                            child: Image.asset(
                              Images.twoofthree,
                              width: Constants.spacingHigh,
                              height: Constants.spacingLarge,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),

                      // "Fill out below the informations about the medicine"
                      Container(
                        width: double.infinity,
                        child: Text(
                          'Fill out below the informations about the medicine',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Constants.fontLittle,
                            fontWeight: .w500,
                            color: CustomColors.littleWhite,
                          ),
                        ),
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      Container(
                        height: 52,
                        padding: EdgeInsets.all(Constants.spacingMedium),
                        decoration: BoxDecoration(
                          color: CustomColors.ghostWhite,
                          borderRadius: .circular(Constants.spacingMedium),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.blackBS1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),

                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: .start,
                              mainAxisAlignment: .start,
                              children: [
                                // Top: Icon
                                Container(
                                  width: Constants.spacingHigh,
                                  height: Constants.spacingHigh,
                                  child: Image.asset(
                                    Images.circleright,
                                    width: Constants.spacingHigh,
                                    height: Constants.spacingHigh,
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                SizedBox(width: Constants.spacingLittle),

                                // Bottom: title
                                Container(
                                  width: 164,
                                  height: 36,
                                  child: Text(
                                    'MY MEDICINES',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.fontSmall,
                                      fontWeight: .bold,
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      // "Details of My Medicine" Text
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text(
                              'Details of My Medicine',
                              style: TextStyle(
                                fontFamily: Constants.primaryfont,
                                fontSize: Constants.fontSmall,
                                fontWeight: .bold,
                                color: CustomColors.darkPink,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      // 'Name the Midecine *' FORM FIELD
                      CustomFormField(
                        label: 'Name the Midecine',
                        hintText: 'Medecine name',
                        controller: _controller,
                      ),

                      SizedBox(height: Constants.spacingSmall),

                      // 'Add reminder'
                      _buildTextLabel(
                        label: 'Add reminder',
                        sublabel: 'Remind me - One Day before',
                        Imagepath: Images.bottomarrowIcon,
                      ),

                      SizedBox(height: Constants.spacingSmall),

                      // Notes
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Notes',
                                style: TextStyle(
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.littleWhite,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: Constants.spacingMedium),
                              SizedBox(
                                width: 350,
                                child: Container(
                                  width: 320,
                                  height: 108,
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    right: 20,
                                    bottom: 5,
                                    left: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFF000000,
                                    ).withOpacity(0.05), // #00000005
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Write some notes to memorize your Medicine..',
                                            style: TextStyle(
                                              fontSize: Constants.fontLittle,
                                              fontFamily: Constants.primaryfont,
                                              color: CustomColors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      // 'Medical receipt document' Text
                      CustomFormField(
                        label: 'Medical receipt document',
                        hintText: 'Upload documents (PDF, Docx...)',
                        controller: _controller,
                        suffixIcon: Icon(Icons.arrow_upward),
                      ),

                      // Scan Ai Ocr Proccess to extract informations.
                      Row(
                        children: [
                          Checkbox(
                            value: _acceptItems,
                            onChanged: (bool? value) {
                              setState(() {
                                _acceptItems = value ?? false;
                              });
                            },
                            activeColor: CustomColors.darkPink,
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print('CLICKED ON TERMS AND CONDITIONS');
                              },
                              child: Text(
                                'Scan Ai Ocr Proccess to extract informations.',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontLittle,
                                  color: CustomColors.black87,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      // Add multiple records
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(), // This pushes the button to the right

                          Material(
                            color: Colors.transparent,
                            child: GestureDetector(
                              onTap: () {
                                print("Clicked on Add New Bucket");
                              },
                              child: Container(
                                height: 36,
                                constraints: BoxConstraints(maxWidth: 150),
                                padding: EdgeInsets.symmetric(
                                  horizontal: Constants.fontLittle,
                                  vertical: Constants.spacingLittle,
                                ),
                                decoration: BoxDecoration(
                                  color: CustomColors.blackBS1,
                                  borderRadius: BorderRadius.circular(
                                    Constants.spacingMedium,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.blackBS1,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: Constants.fontLittle,
                                      height: Constants.fontLittle,
                                      child: Image.asset(
                                        Images.plusIcon,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(width: Constants.spacingLittle),
                                    Text(
                                      'Add multiple records',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontSize: Constants.spacingSmall,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      GradientButton(
                        text: 'ADD MY MEDICINES',
                        onPressed: () {},
                        width: 350,
                      ),

                      SizedBox(height: Constants.spacingSmall),

                      Container(
                        height: 52,
                        padding: EdgeInsets.all(Constants.spacingMedium),
                        decoration: BoxDecoration(
                          color: CustomColors.ghostWhite,
                          borderRadius: .circular(Constants.spacingMedium),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.blackBS1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),

                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: .start,
                              mainAxisAlignment: .start,
                              children: [
                                // Top: Icon
                                Container(
                                  width: Constants.spacingHigh,
                                  height: Constants.spacingHigh,
                                  child: Image.asset(
                                    Images.circleright,
                                    width: Constants.spacingHigh,
                                    height: Constants.spacingHigh,
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                SizedBox(width: Constants.spacingLittle),

                                // Bottom: title
                                Container(
                                  width: 164,
                                  height: 36,
                                  child: Text(
                                    'PATIENT NAME',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.fontSmall,
                                      fontWeight: .bold,
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      // "DDetails of Patient" Text
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text(
                              'Details of Patient',
                              style: TextStyle(
                                fontFamily: Constants.primaryfont,
                                fontSize: Constants.fontSmall,
                                fontWeight: .bold,
                                color: CustomColors.darkPink,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: Constants.spacingSmall),

                      // 'Name the Patient' FORM TEXT
                      CustomFormField(
                        label: 'Name the Patient',
                        hintText: 'Patient name',
                        controller: _controller,
                      ),

                      SizedBox(height: Constants.spacingSmall),

                      // 'Date of Birth' FORM TEXT
                      CustomFormField(
                        label: 'Date of Birth',
                        hintText: 'Date of Birth',
                        controller: _controller,
                        suffixIcon: Icon((Icons.calendar_month)),
                      ),

                      SizedBox(height: Constants.spacingSmall),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Notes',
                                style: TextStyle(
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.littleWhite,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: Constants.spacingMedium),
                              SizedBox(
                                width: 350,
                                child: Container(
                                  width: 320,
                                  height: 108,
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    right: 20,
                                    bottom: 5,
                                    left: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFF000000,
                                    ).withOpacity(0.05), // #00000005
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Write some notes to memorize your Medicine..',
                                            style: TextStyle(
                                              fontSize: Constants.fontLittle,
                                              fontFamily: Constants.primaryfont,
                                              color: CustomColors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      // Add multiple records
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(), // This pushes the button to the right

                          Material(
                            color: Colors.transparent,
                            child: GestureDetector(
                              onTap: () {
                                print("Clicked on Add New Bucket");
                              },
                              child: Container(
                                height: 36,
                                constraints: BoxConstraints(maxWidth: 150),
                                padding: EdgeInsets.symmetric(
                                  horizontal: Constants.fontLittle,
                                  vertical: Constants.spacingLittle,
                                ),
                                decoration: BoxDecoration(
                                  color: CustomColors.blackBS1,
                                  borderRadius: BorderRadius.circular(
                                    Constants.spacingMedium,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.blackBS1,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: Constants.fontLittle,
                                      height: Constants.fontLittle,
                                      child: Image.asset(
                                        Images.plusIcon,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(width: Constants.spacingLittle),
                                    Text(
                                      'Add multiple records',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontSize: Constants.spacingSmall,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      GradientButton(
                        text: 'ADD MY MEDICINES',
                        onPressed: () {},
                        width: 350,
                      ),

                      SizedBox(height: Constants.spacingSmall),

                      // 'MEDICINE NAME'
                      Container(
                        height: 52,
                        padding: EdgeInsets.all(Constants.spacingMedium),
                        decoration: BoxDecoration(
                          color: CustomColors.ghostWhite,
                          borderRadius: .circular(Constants.spacingMedium),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.blackBS1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),

                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: .start,
                              mainAxisAlignment: .start,
                              children: [
                                // Top: Icon
                                Container(
                                  width: Constants.spacingHigh,
                                  height: Constants.spacingHigh,
                                  child: Image.asset(
                                    Images.circleright,
                                    width: Constants.spacingHigh,
                                    height: Constants.spacingHigh,
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                SizedBox(width: Constants.spacingLittle),

                                // Bottom: title
                                Container(
                                  width: 164,
                                  height: 36,
                                  child: Text(
                                    'MEDICINE NAME',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.fontSmall,
                                      fontWeight: .bold,
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      // "Details of Medicine" Text
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text(
                              'Details of Medicine',
                              style: TextStyle(
                                fontFamily: Constants.primaryfont,
                                fontSize: Constants.fontSmall,
                                fontWeight: .bold,
                                color: CustomColors.darkPink,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      // "Photo of Medicine" Text
                      CustomFormField(
                        label: 'Photo of Medicine',
                        hintText: 'Upload Photo (jpg, png...)',
                        controller: _controller,
                        suffixIcon: Icon(Icons.arrow_upward),
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      // "Start date of Medicine" Text
                      CustomFormField(
                        label: 'Start date of Medicine',
                        hintText: 'Start date Medicine',
                        controller: _controller,
                        suffixIcon: Icon(Icons.calendar_month),
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      // "End date of Medicine" Text
                      CustomFormField(
                        label: 'End date of Medicine',
                        hintText: 'End date Medicine',
                        controller: _controller,
                        suffixIcon: Icon(Icons.calendar_month),
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 2),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.transparent, // Make it transparent
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: Constants.fontLittle,
                          ),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'When to use',
                                    style: TextStyle(
                                      fontSize: Constants.fontSmall,
                                      color: CustomColors.littleWhite,
                                    ),
                                  ),
                                ],
                              ),

                              // Vertical Scrollable Card
                              Container(
                                alignment: .center,
                                height: 240,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 2,
                                  vertical: 2,
                                ),
                                child: GridView.count(
                                  crossAxisCount: 2, // 2 Items per Row
                                  crossAxisSpacing: Constants.spacingSmall,
                                  mainAxisSpacing: Constants.spacingSmall,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  childAspectRatio: 175 / 99,
                                  children: MedicinesTimePeriodData.time
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                        int index = entry.key;
                                        Map<String, String> time = entry.value;
                                        String child_sub_title = time['title']!;
                                        String icon = time['icon']!;

                                        return Container(
                                          child: HomeCategoryCard(
                                            onTap: () {
                                              setState(() {
                                                // Toggle selection - if already selected, deselect
                                                _selectedCategoryIndex =
                                                    _selectedCategoryIndex ==
                                                        index
                                                    ? null
                                                    : index;
                                              });
                                              print('$child_sub_title tapped');
                                            },
                                            imageAsset: icon,
                                            title: child_sub_title,
                                            isSelected:
                                                _selectedCategoryIndex == index,
                                          ),
                                        );
                                      })
                                      .toList(),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),

                      // Dosage (if exist)
                      CustomFormField(
                        label: 'Dosage (if exist)',
                        hintText: 'Dosage of Medicine',
                        controller: _controller,
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      // Notes
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Notes',
                                style: TextStyle(
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.littleWhite,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: Constants.spacingMedium),
                              SizedBox(
                                width: 350,
                                child: Container(
                                  height: 108,
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    right: 20,
                                    bottom: 5,
                                    left: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFF000000,
                                    ).withOpacity(0.05), // #00000005
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Write some notes to memorize your Medicine..',
                                            style: TextStyle(
                                              fontSize: Constants.fontLittle,
                                              fontFamily: Constants.primaryfont,
                                              color: CustomColors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      // Add multiple records
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(), // This pushes the button to the right

                          Material(
                            color: Colors.transparent,
                            child: GestureDetector(
                              onTap: () {
                                print("Clicked on Add New Bucket");
                              },
                              child: Container(
                                height: 36,
                                constraints: BoxConstraints(maxWidth: 150),
                                padding: EdgeInsets.symmetric(
                                  horizontal: Constants.fontLittle,
                                  vertical: Constants.spacingLittle,
                                ),
                                decoration: BoxDecoration(
                                  color: CustomColors.blackBS1,
                                  borderRadius: BorderRadius.circular(
                                    Constants.spacingMedium,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.blackBS1,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: Constants.fontLittle,
                                      height: Constants.fontLittle,
                                      child: Image.asset(
                                        Images.plusIcon,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(width: Constants.spacingLittle),
                                    Text(
                                      'Add multiple records',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontSize: Constants.spacingSmall,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Constants.spacingLittle),

                      GradientButton(
                        text: 'ADD TO MEDICINE NAME',
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return SuccessDialog(
                                initialHeight: 200,
                                onComplete: () {
                                  Navigator.pop(
                                    context,
                                  ); // Close the dialog
                                  ScaffoldMessenger.of(
                                    context,
                                  ).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Medicine successfull Added',
                                      ),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OfficialLandingPage(
                                            isCommercial: widget.isCommercial,
                                          ),
                                    ),
                                  );
                                },
                                imageAsset:
                                Images.medicine_successfull,
                                title:
                                'Medicine successfull Added',
                                subtitle:
                                'Congrats! Your Medicine was added to ‘My Diabets’ Bucket.',
                                buttonText:
                                'Go back to My Homepage',
                              );
                            },
                          );
                        },
                        width: 350,
                      ),


                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget _buildTextLabel({
    required String label,
    required String sublabel,
    required String Imagepath,
  }) {
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
          ],
        ),
        SizedBox(height: Constants.spacingLittle),

        Container(
          width: 350,
          height: 36,
          padding: const EdgeInsets.only(
            top: 5,
            right: 20,
            bottom: 5,
            left: 20,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF000000).withOpacity(0.05), // #00000005
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: .center,
            children: [
              Text(
                sublabel,
                style: TextStyle(
                  fontSize: Constants.fontSmall,
                  fontFamily: Constants.primaryfont,
                  color: CustomColors.black87,
                ),
              ),

              // Bell Image
              Image.asset(Imagepath, width: 16, height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
