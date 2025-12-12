import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/material/appointment_time_widget.dart';

import '../../auth/features/gradient_button.dart';
import '../../pages/official_landing_page.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../dialogs/success_dialog.dart';
import '../material/positioned_header_back_icon.dart';

class AfterListedDocumentAppointmentsSelection extends StatefulWidget {
  final String title;
  final String subtitle;

  const AfterListedDocumentAppointmentsSelection({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<AfterListedDocumentAppointmentsSelection> createState() =>
      _AfterListedDocumentAppointmentsSelectionState();
}

class _AfterListedDocumentAppointmentsSelectionState
    extends State<AfterListedDocumentAppointmentsSelection> {
  TextEditingController _companyNameController = TextEditingController();
  bool? _acceptItems = false;

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
              left: 5,
              child: Container(
                width: 350,
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
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.spacingLittle,
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      // 'About the Appointement' and icon
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
                                  // Use Flexible instead of Fixed Width
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 220),
                                    child: Text(
                                      'About the Appointement',
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

                            // "Fill out below the informations about the appointement" Text
                            Container(
                              width: double.infinity,
                              child: Text(
                                'Fill out below the informations about the appointement',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontLittle,
                                  fontWeight: .w500,
                                  color: CustomColors.littleWhite,
                                ),
                              ),
                            ),

                            SizedBox(height: Constants.spacingLittle),

                            // "Details of My Appointment" Text
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text(
                                    'Details of My Appointment',
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

                            Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  // "Name the Appointment *" FORM FIELD
                                  CustomFormField(
                                    label: 'Name the Appointment',
                                    hintText: 'Appointment name',
                                    controller: _companyNameController,
                                  ),

                                  // "Date" FORM FIELD
                                  CustomFormField(
                                    label: 'Date',
                                    hintText: 'Appointment Date',
                                    controller: _companyNameController,
                                  ),

                                  // AppointMent Time Widget
                                  AppointmentTimeWidget(),

                                  SizedBox(height: Constants.spacingLittle),

                                  _buildTextLabel(
                                    label: 'Add reminder',
                                    sublabel: 'Remind me - One Day before',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

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

                                      Row(
                                        children: [
                                          SizedBox(
                                            width: Constants.spacingMedium,
                                          ),
                                          Container(
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
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              crossAxisAlignment: .start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Write some notes to memorize your appointment..',
                                                      style: TextStyle(
                                                        fontSize: Constants
                                                            .fontLittle,
                                                        fontFamily: Constants
                                                            .primaryfont,
                                                        color: CustomColors
                                                            .black87,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  // "Location" Text
                                  _buildTextLabel(
                                    label: 'Location',
                                    sublabel: 'Location link',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  SizedBox(height: Constants.spacingLittle),

                                  // 'Appointment document' Text
                                  CustomFormField(
                                    label: 'Appointment document',
                                    hintText: 'Upload documents (PDF, Docx...)',
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

                                  SizedBox(height: Constants.spacingLittle),

                                  GradientButton(
                                    text: 'ADD MY APPOINTMENTS',
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
                                            imageAsset:
                                                Images.appointment_successfull,
                                            title:
                                                'Appointment successfull Added',
                                            subtitle:
                                                'Congrats! Your trip was added to ‘Medical Appointenment August’ Bucket.',
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
