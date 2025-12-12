import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/gradient_button.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/after_category_of_warranties_watch_selection_show.dart';

import '../../auth/fields/custom_phone_field.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';
import '../material/positioned_header_back_icon.dart';

class AfterCategoryOfWarrantiesWatchSelection extends StatefulWidget {
  final String title;
  final String subtitle;
  final String child_sub_title;

  const AfterCategoryOfWarrantiesWatchSelection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child_sub_title,
  });

  @override
  State<AfterCategoryOfWarrantiesWatchSelection> createState() =>
      _AfterCategoryOfWarrantiesWatchSelectionState();
}

class _AfterCategoryOfWarrantiesWatchSelectionState
    extends State<AfterCategoryOfWarrantiesWatchSelection> {
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

            // TITLE + SUB TITLE + CHILD SUB TITLE BOX CONTAINER
            Positioned(
              top: 72,
              left: 5,
              child: Container(
                width: 350,
                height: 104,
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
                                text: '${widget.subtitle.toLowerCase()}',
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

            // "About Warranty" with Detailed Information Getting
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
                      // About Warranty and Icon
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
                                  // Use Flexible instead of Fixed width
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 184),
                                    child: Text(
                                      'About Warranty',
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

                            // "Fill out below the informations about the warranty" Text
                            Container(
                              width: double.infinity,
                              child: Text(
                                'Fill out below the informations about the warranty',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontLittle,
                                  fontWeight: .w500,
                                  color: CustomColors.littleWhite,
                                ),
                              ),
                            ),

                            SizedBox(height: Constants.spacingLittle),

                            // "Details of warranty" Text
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text(
                                    'Details of warranty',
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
                                  // NAME OF Brand FORM FIELD
                                  _buildCustomFormField(
                                    label: 'Name of Brand',
                                    hintText: 'Enter the Name of Brand',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  // Price Text Field
                                  _buildCustomFormField(
                                    label: 'Price',
                                    hintText: 'Enter the Price',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  // Serial Number
                                  _buildCustomFormField(
                                    label: 'Serial Number',
                                    hintText: 'Serial number (Optional)',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  // Seller Name
                                  _buildCustomFormField(
                                    label: 'Seller Name',
                                    hintText: "Enter the Seller Name",
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  // Seller Phone Number
                                  CustomPhoneField(),

                                  SizedBox(height: Constants.spacingLittle),

                                  // "Start date of the warranty" Text
                                  _buildTextLabel(
                                    label: 'Start date of the warranty',
                                    sublabel: 'Select a Start Date',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  // "End date of the warranty" Text
                                  _buildTextLabel(
                                    label: 'End date of the warranty',
                                    sublabel: 'Select a Expiry Date',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  // "Purchase location" Text
                                  _buildTextLabel(
                                    label: 'Purchase location',
                                    sublabel: 'Purchase location',
                                    Imagepath: Images.plusIcon,
                                  ),

                                  // "Country of manufacture" Text
                                  _buildTextLabel(
                                    label: 'Country of manufacture',
                                    sublabel:
                                        'Select of Country of manufacture',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  // "Store location"
                                  CustomFormField(
                                    label: 'Store location',
                                    hintText: 'Store location link',
                                    suffixIcon: Icon(Icons.link),
                                    controller: _companyNameController,
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  // Row Of "Add reminder for expiry date" and Image
                                  SizedBox(
                                    width: 200,
                                    height: 22,
                                    child: Column(
                                      crossAxisAlignment: .start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: .center,
                                          children: [
                                            // Icon/Image
                                            Container(
                                              width: 12,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.pink, // Pink color
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      2,
                                                    ), // 2px border radius
                                              ),
                                            ),

                                            SizedBox(
                                              width: Constants.spacingSmall,
                                            ),

                                            Text(
                                              'Add reminder for expiry date',
                                              style: TextStyle(
                                                fontFamily:
                                                    Constants.primaryfont,
                                                fontSize: Constants.fontLittle,
                                                color: CustomColors.black87,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  // "Country of manufacture" Text
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
                                      color: const Color(
                                        0xFF000000,
                                      ).withOpacity(0.05), // #00000005
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: .center,
                                      children: [
                                        Text(
                                          'Onw Week before',
                                          style: TextStyle(
                                            fontSize: Constants.fontSmall,
                                            fontFamily: Constants.primaryfont,
                                            color: CustomColors.black87,
                                          ),
                                        ),

                                        Image.asset(
                                          Images.bottomarrowIcon,
                                          width: 16,
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Warranty covering',
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

                                  // Covering areas
                                  _buildCustomFormField(
                                    label: 'Covering areas',
                                    hintText: 'Number of Covering areas',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  // "Country of manufacture" Text
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
                                      color: const Color(
                                        0xFF000000,
                                      ).withOpacity(0.05), // #00000005
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: .center,
                                      children: [
                                        Text(
                                          'Choose an option',
                                          style: TextStyle(
                                            fontSize: Constants.fontSmall,
                                            fontFamily: Constants.primaryfont,
                                            color: CustomColors.black87,
                                          ),
                                        ),

                                        Image.asset(
                                          Images.bottomarrowIcon,
                                          width: 16,
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  // Add More
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
                                                  'Add More',
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

                                  GradientButton(
                                    text: 'ADD MY BUCKET',
                                    onPressed: () {
                                      print(" CLICKED ON ADD MY BUCKET");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AfterCategoryOfWarrantiesWatchSelectionShow(
                                                title: widget.title,
                                                subtitle: widget.subtitle,
                                                child_sub_title:
                                                    widget.child_sub_title,
                                              ),
                                        ),
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

  Widget _buildCustomFormField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?)? validator,
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

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: CustomColors.lightWhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ],
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
