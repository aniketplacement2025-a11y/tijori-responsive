import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/gradient_button.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_phone_field.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/material/reusable_payment_card.dart';

import '../../auth/fields/custom_form_field.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';
import '../material/positioned_header_back_icon.dart';

class ContractPageAfterDocument extends StatefulWidget {
  const ContractPageAfterDocument({super.key});

  @override
  State<ContractPageAfterDocument> createState() =>
      _ContractPageAfterDocumentState();
}

class _ContractPageAfterDocumentState extends State<ContractPageAfterDocument> {
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

            Positioned(
              top: 72,
              left: 10,
              right: 10,
              child: Container(
                alignment: .center,
                height: 112,
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
                      width: 315,
                      height: 22,
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          SizedBox(width: Constants.spacingMedium),

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
                          SizedBox(
                            width: 268,
                            height: Constants.fontSmall,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Bucket: ',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Constants.fontSmall,
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Construction Villa Hazmi',
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.black87,
                                ),
                              ),
                              TextSpan(
                                text: 'Contract',
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.black87,
                                ),
                              ),
                              TextSpan(
                                text: 'Construction',
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
              top: 188,
              left: 0,
              right: 0,
              bottom: 20,
              child: Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.spacingSmall,
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      // Your Scrollable content Container
                      Container(
                        constraints: BoxConstraints(maxWidth: 184),
                        child: Text(
                          'About Contract',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Constants.fontMedium,
                            fontWeight: .bold,
                            color: CustomColors.black87,
                          ),
                        ),
                      ),

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
                          crossAxisAlignment: .start,
                          children: [
                            // NAME OF COMPANY FORM FIELD
                            _buildCustomFormField(
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
                            _buildCustomFormField(
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
                              suffixIcon: Icon(Icons.email), // Custom icon
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

                            SizedBox(height: Constants.spacingLittle),

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
                            _buildCustomFormField(
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

                            // Date of the Company
                            _buildCustomFormField(
                              label: 'Date of the Company',
                              hintText: 'Enter Date of the Company',
                              controller: _companyNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),

                            // Amount of the Contract
                            _buildCustomFormField(
                              label: 'Amount of the Contract',
                              hintText: 'Enter Amount of the Contract(in Kd)',
                              controller: _companyNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: Constants.spacingLittle),

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
                            _buildCustomFormField(
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
                            _buildCustomFormField(
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

                            // First payment card
                            ReusablePaymentCard(
                              amount: '20.000',
                              dueDate: '01 September 2025',
                              notificationTime: 'Get notified 1 week before',
                            ),

                            SizedBox(height: Constants.spacingSmall),

                            // Second payment card (without Kd suffix)
                            ReusablePaymentCard(
                              amount: '20.000',
                              dueDate: '01 December 2025',
                              notificationTime: 'Get notified 1 week before',
                              showKdSuffix: false,
                            ),

                            SizedBox(height: Constants.spacingSmall),

                            // Third payment card
                            ReusablePaymentCard(
                              amount: '20.000',
                              dueDate: '01 February 2025',
                              notificationTime: 'Get notified 1 week before',
                            ),

                            SizedBox(height: Constants.spacingSmall),

                            // Fourth payment card
                            ReusablePaymentCard(
                              amount: '20.000',
                              dueDate: '01 March 2025',
                              notificationTime: 'Get notified 1 week before',
                            ),

                            SizedBox(height: Constants.spacingSmall),

                            // Fifth payment card
                            ReusablePaymentCard(
                              amount: '20.000',
                              dueDate: '01 June 2025',
                              notificationTime: 'Get notified 1 week before',
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

                            SizedBox(height: Constants.spacingSmall),

                            // Due date of payment
                            _buildTextLabel(
                              label: 'Get notified',
                              sublabel: 'Monthly notifications',
                            ),

                            SizedBox(height: Constants.spacingSmall),

                            Container(
                              width: 350,
                              height: 232,
                              padding: EdgeInsets.only(
                                top: 20,
                                right: 10,
                                bottom: 20,
                                left: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: .circular(16),
                                border: Border.all(
                                  color: CustomColors.blackBS1,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: .center,
                                crossAxisAlignment: .center,
                                children: [
                                  // Due date of payment
                                  _buildTextLabel(
                                    label: 'Due date of payment',
                                    sublabel: '01 September 2025',
                                  ),

                                  // When i get Notified
                                  _buildTextLabel(
                                    label: 'When I get notified',
                                    sublabel: 'Get notified 1 week before',
                                  ),

                                  // Percentage of achievement
                                  _buildTextLabel(
                                    label: 'Percentage of achievement',
                                    sublabel: '20 %',
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: Constants.spacingSmall),

                            GradientButton(
                              text: 'EDIT',
                              onPressed: () {
                                print("CLICKED ON EDIT BUTTON");
                              },
                              width: 400,
                            ),

                            SizedBox(height: Constants.spacingSmall),

                            GradientButton(
                              text: 'SHARE AS PDF',
                              onPressed: () {
                                print("CLICKED ON SHARE AS PDF BUTTON");
                              },
                              width: 400,
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
}

Widget _buildTextLabel({required String label, required String sublabel}) {
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
        padding: const EdgeInsets.only(top: 5, right: 20, bottom: 5, left: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF000000).withOpacity(0.05), // #00000005
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(width: Constants.spacingLittle),
            Text(
              sublabel,
              style: TextStyle(
                fontSize: Constants.fontSmall,
                fontWeight: .bold,
                color: CustomColors.littleWhite,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
