import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/gradient_button.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/pages/official_landing_page.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/dialogs/success_dialog.dart';

import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';
import '../material/positioned_header_back_icon.dart';

class AfterCategoryOfContractConstructionSelectionShowAddDocuments
    extends StatefulWidget {
  final String title;
  final String sub_title;
  final String child_sub_title;
  final bool isCommercial;

  AfterCategoryOfContractConstructionSelectionShowAddDocuments({
    super.key,
    required this.title,
    required this.isCommercial,
    required this.sub_title,
    required this.child_sub_title,
  });

  @override
  State<AfterCategoryOfContractConstructionSelectionShowAddDocuments>
  createState() =>
      _AfterCategoryOfContractConstructionSelectionShowAddDocumentsState();
}

class _AfterCategoryOfContractConstructionSelectionShowAddDocumentsState
    extends
        State<AfterCategoryOfContractConstructionSelectionShowAddDocuments> {
  TextEditingController _companyNameController = TextEditingController();

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

            // Title + Sub Title + Child Title
            Positioned(
              top: 72,
              left: 10,
              right: 10,
              child: Container(
                height: 108,
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
                      width: 320,
                      height: 20,
                      child: Center(
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
                                text: '${widget.sub_title.toLowerCase()}',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Row 3: Category
                    SizedBox(
                      width: 340,
                      height: 18,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Category: ',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.black87,
                                ),
                              ),
                              TextSpan(
                                text: '${widget.child_sub_title.toLowerCase()}',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.fontSmall,
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

            Positioned(
              top: 175,
              left: 0,
              right: 0,
              bottom: 10,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.spacingLittle,
                ),
                child: Column(
                  crossAxisAlignment: .center,
                  children: [
                    // About Documents and Icon
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        // Left: Title
                        Flexible(
                          // Use Flexible instead of Fixed width
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 184),
                            child: Text(
                              'About documents',
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

                    // "Fill out below the informations about the contract" Text
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Constants.spacingLittle,
                      ),
                      width: double.infinity,
                      child: Text(
                        'Add more document to your contract',
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontSize: Constants.fontLittle,
                          fontWeight: .w500,
                          color: CustomColors.littleWhite,
                        ),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: .center,
                        children: [
                          // 1st Document
                          Container(
                            alignment: .center,
                            height: 414,
                            padding: const EdgeInsets.only(top: 20, right: 10),
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
                                // "Type of document" FORM FIELD
                                CustomFormField(
                                  label: 'Type of document',
                                  hintText: 'Sponsorship of the Contract',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.arrow_downward),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your full name';
                                    }
                                    return null;
                                  },
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // "Upload the document" FORM FIELD
                                CustomFormField(
                                  label: 'Upload the document',
                                  hintText: 'Upload the file (PDF, Word...)',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.arrow_upward),
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // "Start Date" FORM FIELD
                                CustomFormField(
                                  label: 'Start Date',
                                  hintText: 'Select a Start Date (Optional)',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.calendar_month),
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // "End date" FORM FIELD
                                CustomFormField(
                                  label: 'End date',
                                  hintText: 'Select a End date (Optional)',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.calendar_month),
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // "Extension Date" FORM FIELD
                                CustomFormField(
                                  label: 'Extension date',
                                  hintText:
                                      'Select a Extension date (Optional)',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.calendar_month),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: Constants.spacingMedium),

                          // 2nd Document
                          Container(
                            alignment: .center,
                            height: 414,
                            padding: const EdgeInsets.only(top: 20, right: 10),
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
                                // "Type of document" FORM FIELD
                                _buildTextLabel(
                                  label: 'Type of document',
                                  sublabel: 'Warranty',
                                  Imagepath: Images.bottomarrowIcon,
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // "Upload the document" FORM FIELD
                                CustomFormField(
                                  label: 'Upload the document',
                                  hintText: 'Upload the file (PDF, Word...)',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.arrow_upward),
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // "Start Date" FORM FIELD
                                CustomFormField(
                                  label: 'Start Date',
                                  hintText: 'Select a Start Date (Optional)',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.calendar_month),
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // "End date" FORM FIELD
                                CustomFormField(
                                  label: 'End date',
                                  hintText: 'Select a End date (Optional)',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.calendar_month),
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // "Extension Date" FORM FIELD
                                CustomFormField(
                                  label: 'Extension date',
                                  hintText:
                                      'Select a Extension date (Optional)',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.calendar_month),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: Constants.spacingMedium),

                          // 3rd Document
                          Container(
                            alignment: .center,
                            height: 414,
                            padding: const EdgeInsets.only(top: 20, right: 10),
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
                                // "Type of document" FORM FIELD
                                _buildTextLabel(
                                  label: 'Type of document',
                                  sublabel: 'Personal file',
                                  Imagepath: Images.bottomarrowIcon,
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // "Upload the document" FORM FIELD
                                CustomFormField(
                                  label: 'Upload the document',
                                  hintText: 'Upload the file (PDF, Word...)',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.arrow_upward),
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // "Start Date" FORM FIELD
                                CustomFormField(
                                  label: 'Start Date',
                                  hintText: 'Select a Start Date (Optional)',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.calendar_month),
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // "End date" FORM FIELD
                                CustomFormField(
                                  label: 'End date',
                                  hintText: 'Select a End date (Optional)',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.calendar_month),
                                ),

                                SizedBox(height: Constants.spacingLittle),

                                // "Extension Date" FORM FIELD
                                CustomFormField(
                                  label: 'Extension date',
                                  hintText:
                                      'Select a Extension date (Optional)',
                                  controller: _companyNameController,
                                  suffixIcon: Icon(Icons.calendar_month),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: Constants.spacingSmall),

                          // Add More Document
                          Row(
                            crossAxisAlignment: .center,
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
                                          width: Constants.spacingLittle,
                                        ),
                                        Text(
                                          'Add New Phase',
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

                          SizedBox(height: Constants.spacingSmall),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: Constants.spacingSmall),
                                  Container(
                                    width: 400,
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
                                              'Remark',
                                              style: TextStyle(
                                                fontSize: Constants.fontSmall,
                                                fontFamily:
                                                    Constants.primaryfont,
                                                color: CustomColors.black87,
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

                          SizedBox(height: Constants.spacingSmall),

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
                                              OfficialLandingPage(
                                                isCommercial: widget.isCommercial,
                                              ),
                                        ),
                                      );
                                    },
                                    imageAsset: Images.folder,
                                    title: 'Bucket successfully Added',
                                    subtitle:
                                        'Congrats! Your Bucket was added successfully',
                                    buttonText: 'Go back to My Homepage',
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
