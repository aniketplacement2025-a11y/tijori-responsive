import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/material/reusable_payment_card_field.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/after_category_of_contract_construction_selection_show.dart';
import '../../auth/features/gradient_button.dart';
import '../../auth/fields/custom_form_field.dart';

import '../../auth/fields/custom_phone_field.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';
import '../material/positioned_header_back_icon.dart';

class AfterCategoryOfContractConstructionSelection extends StatefulWidget {
  final String title;
  final String subtitle;
  final String child_sub_title;
  final bool isCommercial;

  const AfterCategoryOfContractConstructionSelection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isCommercial,
    required this.child_sub_title,
  });

  @override
  State<AfterCategoryOfContractConstructionSelection> createState() =>
      _AfterCategoryOfContractConstructionSelectionState();
}

class _AfterCategoryOfContractConstructionSelectionState
    extends State<AfterCategoryOfContractConstructionSelection> {
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
              left: 10,
              right: 10,
              child: Container(
                alignment: .center,
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

            // "About Contract" with Detailed Information Getting
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
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    children: [
                      // About Contract and Icon
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
                                      'About contract',
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
                              width: double.infinity,
                              child: Text(
                                'Fill out below the informations about the contract',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontLittle,
                                  fontWeight: .w500,
                                  color: CustomColors.littleWhite,
                                ),
                              ),
                            ),

                            SizedBox(height: Constants.spacingLittle),

                            // "Details of contractor" Text
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text(
                                    'Details of contractor',
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
                                crossAxisAlignment: .center,
                                children: [
                                  // NAME OF COMPANY FORM FIELD
                                  CustomFormField(
                                    label: 'Name of the Company',
                                    hintText: 'Enter Full Name of the Company',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  // REPRESENTATIVE OF COMPANY FORM FIELD
                                  CustomFormField(
                                    label: 'Representative Company Name',
                                    hintText:
                                        'Enter Full Name of Representative Company',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  CustomPhoneField(),

                                  // FORM FIELD FOR EMAIL
                                  CustomFormField(
                                    label: 'Email of the Company',
                                    hintText: 'E.g.: Company@domain.com',
                                    controller: _emailController,
                                    suffixIcon: Icon(
                                      Icons.email,
                                    ), // Custom icon
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      if (!RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                      ).hasMatch(value)) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  // "Details of Contract" Text
                                  Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Details of Contract',
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

                                  //Name of The Contract Form Field
                                  CustomFormField(
                                    label: 'Name of The Contract',
                                    hintText: 'Enter Name of The Contract',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  // Date of the Contract
                                  CustomFormField(
                                    label: 'Date of the Contract',
                                    hintText: 'Enter Date of the Contract',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  // Amount of the Contract
                                  CustomFormField(
                                    label: 'Amount of the Contract',
                                    hintText:
                                        'Enter Amount of the Contract(in Kd)',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Details of Payments',
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

                                  // Number of the payments
                                  CustomFormField(
                                    label: 'Number of the payments',
                                    hintText: 'Enter Number of the payments',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  // Method of the Payment
                                  CustomFormField(
                                    label: 'Method of the payment',
                                    hintText: 'Enter Method of the payment',
                                    controller: _companyNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  ReusablePaymentCardField(
                                    controller: _companyNameController,
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  ReusablePaymentCardField(
                                    controller: _companyNameController,
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  // "Achievements details" Text
                                  Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Achievements details',
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

                                  // Due Date of payment
                                  CustomFormField(
                                    label: 'Get notified',
                                    hintText: 'Monthly notifications',
                                    controller: _companyNameController,
                                    suffixIcon: Icon(Icons.arrow_downward),
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  Container(
                                    width: 350,
                                    height: 268,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Due Date of Payment
                                        CustomFormField(
                                          label: 'Due date of Payment',
                                          hintText: 'Due date',
                                          controller: _companyNameController,
                                          suffixIcon: Icon(
                                            Icons.calendar_month,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your full name';
                                            }
                                            return null;
                                          },
                                        ),

                                        //When I get notified
                                        CustomFormField(
                                          label: 'When I get notified',
                                          hintText: 'Get notified 1 Day before',
                                          controller: _companyNameController,
                                          suffixIcon: Icon(
                                            Icons.arrow_downward,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your full name';
                                            }
                                            return null;
                                          },
                                        ),

                                        // Amount of the Payment
                                        CustomFormField(
                                          label: 'Percentage of achievement',
                                          hintText: 'Enter Your Achievement',
                                          suffixIcon: Icon(Icons.percent),
                                          controller: _companyNameController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your full name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  // Add New Category
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
                                                  'Add New Phase',
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

                                  SizedBox(height: Constants.spacingSmall),

                                  GradientButton(
                                    text: 'NEXT',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AfterCategoryOfContractConstructionSelectionShow(
                                                title: widget.title,
                                                subtitle: widget.subtitle,
                                                child_sub_title:
                                                    widget.child_sub_title,
                                                isCommercial: widget.isCommercial,
                                              ),
                                        ),
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
}
