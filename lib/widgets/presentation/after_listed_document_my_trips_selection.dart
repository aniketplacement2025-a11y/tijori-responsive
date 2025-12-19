import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/outline_button.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';

import '../../auth/features/gradient_button.dart';
import '../../auth/fields/custom_form_field.dart';
import '../../pages/official_landing_page.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../dialogs/success_dialog.dart';
import '../material/positioned_header_back_icon.dart';

class AfterListedDocumentMyTripsSelection extends StatefulWidget {
  final String title;
  final String subtitle;

  const AfterListedDocumentMyTripsSelection({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<AfterListedDocumentMyTripsSelection> createState() =>
      _AfterListedDocumentMyTripsSelectionState();
}

class _AfterListedDocumentMyTripsSelectionState
    extends State<AfterListedDocumentMyTripsSelection> {
  TextEditingController _companyNameController = TextEditingController();
  bool _acceptItems = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // Header Fixed at top
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

            // "About the Trip" Text + Grid View Options
            Positioned(
              top: 172,
              left: 0,
              right: 0,
              bottom: 10,
              child: Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.spacingSmall,
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      // Add Bucket Text and Icon
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 2),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: .circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                // Left: Title
                                Flexible(
                                  // Use Flexible instead of fixed width
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 184),
                                    child: Text(
                                      'About the Trip',
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

                            // "Fill out below the informations about the Trip" text
                            Container(
                              width: double.infinity,
                              child: Text(
                                'Fill out below the informations about the Trip',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontLittle,
                                  fontWeight: .w500,
                                  color: CustomColors.littleWhite,
                                ),
                              ),
                            ),

                            SizedBox(height: Constants.spacingLittle),

                            // "Details of Trip" Text
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text(
                                    'Details of Trip',
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

                            Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  // NAME OF COMPANY FORM FIELD
                                  CustomFormField(
                                    label: 'Name the trip',
                                    hintText: 'Add a Name to the trip',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  // "Number of traveler" Form Field
                                  CustomFormField(
                                    label: 'Name the traveler',
                                    hintText: 'E.g. 1 person',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  _buildTextLabel(
                                    label: 'Type of travel',
                                    sublabel: 'International',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  Container(
                                    alignment: .center,
                                    height: 255,
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      right: 10,
                                      bottom: 20,
                                      left: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: CustomColors.blackBS1,
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: .center,
                                      crossAxisAlignment: .center,
                                      children: [
                                        // "Requiered document" Text
                                        _buildTextLabel(
                                          label: 'Requiered document',
                                          sublabel: 'Visa Entry',
                                          Imagepath: Images.bottomarrowIcon,
                                        ),

                                        // "Upload permission document" Text
                                        CustomFormField(
                                          label: 'Upload permission document',
                                          hintText:
                                              'Required document (PDF, Docx...)',
                                          suffixIcon: Icon(Icons.arrow_upward),
                                          controller: _companyNameController,
                                        ),

                                        // "Upload insurance document" Text
                                        CustomFormField(
                                          label: 'Upload insurance document',
                                          hintText:
                                              'Required document (PDF, Docx...)',
                                          suffixIcon: Icon(Icons.arrow_upward),
                                          controller: _companyNameController,
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  // Add Traveler
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            constraints: BoxConstraints(
                                              maxWidth: 150,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: Constants.fontLittle,
                                              vertical: Constants.spacingLittle,
                                            ),
                                            decoration: BoxDecoration(
                                              color: CustomColors.blackBS1,
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                SizedBox(
                                                  width:
                                                      Constants.spacingLittle,
                                                ),
                                                Text(
                                                  'Add Traveler',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.primaryfont,
                                                    fontSize:
                                                        Constants.spacingSmall,
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

                                  // Start Date of the Trip
                                  _buildTextLabel(
                                    label: 'Start Date of the Trip',
                                    sublabel: 'Select a Start date',
                                    Imagepath: Images.calenderIcon,
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  // Return Date
                                  _buildTextLabel(
                                    label: 'Return Date',
                                    sublabel: 'Select a Return Date',
                                    Imagepath: Images.calenderIcon,
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  Container(
                                    alignment: .center,
                                    height: 36,
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                      right: 20,
                                      bottom: 5,
                                      left: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          CustomColors.ghostWhite, // #00000005
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: .center,
                                      children: [
                                        Text(
                                          'Duration of the trip',
                                          style: TextStyle(
                                            fontSize: Constants.fontSmall,
                                            fontFamily: Constants.primaryfont,
                                            color: CustomColors.black87,
                                          ),
                                        ),

                                        Row(
                                          mainAxisAlignment: .start,
                                          crossAxisAlignment: .center,
                                          children: [
                                            Text(
                                              '08',
                                              style: TextStyle(
                                                fontSize: Constants.fontLittle,
                                                fontFamily:
                                                    Constants.primaryfont,
                                                color: CustomColors.darkPink,
                                              ),
                                            ),
                                            Text(
                                              'Days',
                                              style: TextStyle(
                                                fontSize: Constants.fontLittle,
                                                fontFamily:
                                                    Constants.primaryfont,
                                                color: CustomColors.littleWhite,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  // 'Upload Invoice' Text
                                  CustomFormField(
                                    label: 'Upload Invoice',
                                    hintText:
                                        'Invoice of the trip (e.g. Travel agency Invoice)',
                                    suffixIcon: Icon(Icons.arrow_upward),
                                    controller: _companyNameController,
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
                                            print(
                                              'CLICKED ON TERMS AND CONDITIONS',
                                            );
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

                                  // "Transportation" Text
                                  Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Transportation',
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

                                  // "Type of transportation" Text
                                  _buildTextLabel(
                                    label: 'Type of transportation',
                                    sublabel:
                                        'Choose an option (Flight, Boat, Car...)',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  // "Ticket" Text
                                  _buildTextLabel(
                                    label: 'Ticket',
                                    sublabel: 'Upload Ticket',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  // Add more reservations
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            constraints: BoxConstraints(
                                              maxWidth: 150,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: Constants.fontLittle,
                                              vertical: Constants.spacingLittle,
                                            ),
                                            decoration: BoxDecoration(
                                              color: CustomColors.blackBS1,
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                SizedBox(
                                                  width:
                                                      Constants.spacingLittle,
                                                ),
                                                Text(
                                                  'Add more reservations',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.primaryfont,
                                                    fontSize:
                                                        Constants.spacingSmall,
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

                                  // "Car rental" Text
                                  Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Car rental',
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

                                  _buildTextLabel(
                                    label: 'Start date of rent',
                                    sublabel: 'Start date rental',
                                    Imagepath: Images.calenderIcon,
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  _buildTextLabel(
                                    label: 'End date of rent',
                                    sublabel: 'End date rental',
                                    Imagepath: Images.calenderIcon,
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  _buildTextLabel(
                                    label: 'Insurance',
                                    sublabel: 'Car Insurance',
                                    Imagepath: Images.thumsUp,
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  // Add more Car rental
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            constraints: BoxConstraints(
                                              maxWidth: 150,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: Constants.fontLittle,
                                              vertical: Constants.spacingLittle,
                                            ),
                                            decoration: BoxDecoration(
                                              color: CustomColors.blackBS1,
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                SizedBox(
                                                  width:
                                                      Constants.spacingLittle,
                                                ),
                                                Text(
                                                  'Add more Car rental',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.primaryfont,
                                                    fontSize:
                                                        Constants.spacingSmall,
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

                                  SizedBox(),

                                  // "Clubs reservation" Text
                                  Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Clubs reservation',
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

                                  // 'Type of Club' Text
                                  _buildTextLabel(
                                    label: 'Type of Club',
                                    sublabel: 'Choose option (Sport, Games...)',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  // 'Store location' Text
                                  _buildTextLabel(
                                    label: 'Reservation Invoice',
                                    sublabel: 'Upload reservation invoice',
                                    Imagepath: Images.right,
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  // Add more reservations
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            constraints: BoxConstraints(
                                              maxWidth: 150,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: Constants.fontLittle,
                                              vertical: Constants.spacingLittle,
                                            ),
                                            decoration: BoxDecoration(
                                              color: CustomColors.blackBS1,
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                SizedBox(
                                                  width:
                                                      Constants.spacingLittle,
                                                ),
                                                Text(
                                                  'Add more Clubs reservations',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.primaryfont,
                                                    fontSize: 7,
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

                                  // "Matches reservation" Text
                                  Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Matches reservation',
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

                                  // 'Type of Sport' Text
                                  _buildTextLabel(
                                    label: 'Type of Sport',
                                    sublabel:
                                        'Choose option (Football, hand Ball...)',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  // 'Reservation Invoice' Text
                                  _buildTextLabel(
                                    label: 'Reservation Invoice',
                                    sublabel: 'Upload Ticket',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  // Add more Matches reservations
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            constraints: BoxConstraints(
                                              maxWidth: 150,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: Constants.fontLittle,
                                              vertical: Constants.spacingLittle,
                                            ),
                                            decoration: BoxDecoration(
                                              color: CustomColors.blackBS1,
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                SizedBox(
                                                  width:
                                                      Constants.spacingLittle,
                                                ),
                                                Text(
                                                  'Add Matches reservations',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.primaryfont,
                                                    fontSize:
                                                        Constants.spacingSmall,
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

                                  // 'Add new reservation' Button
                                  CustomOutlineButton(
                                    text: 'ADD NEW RESERVATION',
                                    onPressed: () {
                                      print('Clicked on Add New Preservation');
                                    },
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  _buildTextLabel(
                                    label: 'Add reminder',
                                    sublabel: 'Remind me - One Day before',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      SizedBox(height: Constants.spacingLittle),

                                      Container(
                                        alignment: .center,
                                        height: 96,
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
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: .start,
                                          children: [
                                            Text(
                                              'Write some notes to memorize your appointment...',
                                              style: TextStyle(
                                                fontSize: Constants.fontLittle,
                                                fontFamily:
                                                    Constants.primaryfont,
                                                color: CustomColors.black87,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  GradientButton(
                                    text: 'ADD MY BUCKET',
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
                                                    'ADD BUCKET SUCCESSFULL',
                                                  ),
                                                ),
                                              );
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      OfficialLandingPage(),
                                                ),
                                              );
                                            },
                                            imageAsset: Images.trip_successfull,
                                            title: 'Trip successfull Added',
                                            subtitle:
                                                'Congrats! Your trip was added to ‘Summer trip 2025’ Bucket.',
                                            buttonText:
                                                'Go back to My Homepage',
                                          );
                                        },
                                      );
                                    },
                                    width: 400,
                                  ),
                                ],
                              ),
                            ),
                          ],
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
          alignment: .center,
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
