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
  void dispose() {
    _companyNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants
    Constants.updateFromContext(context);

    // Responsive dimensions
    final double headerTop = Responsive.value<double>(
      context,
      mobile: 20,
      tablet: 24,
      desktop: 28,
    );

    final double bucketContainerTop = Responsive.value<double>(
      context,
      mobile: 72,
      tablet: 80,
      desktop: 88,
    );

    final double bucketContainerHeight = Responsive.value<double>(
      context,
      mobile: 112,
      tablet: 120,
      desktop: 128,
    );

    final double contentTop = Responsive.value<double>(
      context,
      mobile: 188,
      tablet: 204,
      desktop: 220,
    );

    final double mainPadding = Responsive.value<double>(
      context,
      mobile: Constants.getSpacingSmall(context),
      tablet: Constants.getSpacingMedium(context),
      desktop: Constants.getSpacingHigh(context),
    );

    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // Header Fixed at top
            PositionedHeaderBackIcon(
              context: context,
              top: headerTop,
              left: isMobile ? 12 : 20,
              right: isMobile ? 12 : 20,
              onBackPressed: () {
                print('Custom back action');
                Navigator.pop(context);
              },
              onReminderPressed: () {
                print('Custom reminder action');
                // Show reminder dialog
              },
            ),

            // Bucket Info Container
            Positioned(
              top: bucketContainerTop,
              left: isMobile ? 12 : 20,
              right: isMobile ? 12 : 20,
              child: Container(
                alignment: Alignment.center,
                height: bucketContainerHeight,
                padding: EdgeInsets.only(
                  top: Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
                  right: Responsive.value<double>(context, mobile: 10, tablet: 12, desktop: 14),
                  bottom: Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
                  left: Responsive.value<double>(context, mobile: 10, tablet: 12, desktop: 14),
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    Responsive.value<double>(
                      context,
                      mobile: 16,
                      tablet: 18,
                      desktop: 20,
                    ),
                  ),
                  border: Border.all(
                    color: CustomColors.black87.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Row 1: Bucket name with icon
                    SizedBox(
                      width: Responsive.value<double>(
                        context,
                        mobile: 315,
                        tablet: 335,
                        desktop: 355,
                      ),
                      height: Responsive.value<double>(
                        context,
                        mobile: 22,
                        tablet: 24,
                        desktop: 26,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: Constants.getSpacingMedium(context)),

                          // Icon/Image
                          Container(
                            width: Constants.getFontMedium(context),
                            height: Constants.getFontMedium(context),
                            child: Image.asset(
                              Images.projectIcon,
                              fit: BoxFit.contain,
                            ),
                          ),

                          SizedBox(width: Constants.getSpacingSmall(context)),

                          // Bucket Text
                          SizedBox(
                            width: Responsive.value<double>(
                              context,
                              mobile: 268,
                              tablet: 288,
                              desktop: 308,
                            ),
                            height: Constants.getFontSmall(context),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Bucket: ',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Constants.getFontSmall(context),
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Construction Villa Hazmi',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Constants.getFontSmall(context),
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

                    SizedBox(height: Constants.getSpacingLittle(context)),

                    // Row 2: Type
                    SizedBox(
                      width: Responsive.value<double>(
                        context,
                        mobile: 320,
                        tablet: 340,
                        desktop: 360,
                      ),
                      height: Responsive.value<double>(
                        context,
                        mobile: 20,
                        tablet: 22,
                        desktop: 24,
                      ),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Type: ',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.getFontSmall(context),
                                  color: CustomColors.black87,
                                ),
                              ),
                              TextSpan(
                                text: 'Contract',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.getFontSmall(context),
                                  color: CustomColors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Constants.getSpacingLittle(context)),

                    // Row 3: Category
                    SizedBox(
                      width: Responsive.value<double>(
                        context,
                        mobile: 340,
                        tablet: 360,
                        desktop: 380,
                      ),
                      height: Responsive.value<double>(
                        context,
                        mobile: 18,
                        tablet: 20,
                        desktop: 22,
                      ),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Category: ',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.getFontSmall(context),
                                  color: CustomColors.black87,
                                ),
                              ),
                              TextSpan(
                                text: 'Construction',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.getFontSmall(context),
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

            // Main Content Scrollable Area
            Positioned(
              top: contentTop,
              left: isMobile ? 12 : 20,
              right: isMobile ? 12 : 20,
              bottom: 20,
              child: Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: mainPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // About Contract Title
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: Responsive.value<double>(
                            context,
                            mobile: 184,
                            tablet: 200,
                            desktop: 216,
                          ),
                        ),
                        child: Text(
                          'About Contract',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Constants.getFontMedium(context),
                            fontWeight: FontWeight.bold,
                            color: CustomColors.black87,
                          ),
                        ),
                      ),

                      SizedBox(height: Constants.getSpacingLittle(context)),

                      // Details of contractor title
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text(
                              'Details of contractor',
                              style: TextStyle(
                                fontFamily: Constants.primaryfont,
                                fontSize: Constants.getFontSmall(context),
                                fontWeight: FontWeight.bold,
                                color: CustomColors.darkPink,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: Constants.getSpacingLittle(context)),

                      // Form Fields Container
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: .center,
                          children: [
                            // NAME OF COMPANY FORM FIELD
                            _buildCustomFormField(
                              context: context,
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

                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // REPRESENTATIVE OF COMPANY FORM FIELD
                            _buildCustomFormField(
                              context: context,
                              label: 'Representative Company Name',
                              hintText: 'Enter Full Name of Representative Company',
                              controller: _companyNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: Constants.getSpacingMedium(context)),

                            CustomPhoneField(),

                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // FORM FIELD FOR EMAIL
                            CustomFormField(
                              label: 'Email of the Company',
                              hintText: 'E.g.: Company@domain.com',
                              controller: _emailController,
                              suffixIcon: Icon(
                                Icons.email,
                                size: Responsive.value<double>(
                                  context,
                                  mobile: 20,
                                  tablet: 22,
                                  desktop: 24,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter company email';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: Constants.getSpacingHigh(context)),

                            // Details of Contract title
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text(
                                    'Details of Contract',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.getFontSmall(context),
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.darkPink,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: Constants.getSpacingLittle(context)),

                            // Name of The Contract Form Field
                            _buildCustomFormField(
                              context: context,
                              label: 'Name of The Contract',
                              hintText: 'Enter Name of The Contract',
                              controller: _companyNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter contract name';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // Date of the Company
                            _buildCustomFormField(
                              context: context,
                              label: 'Date of the Company',
                              hintText: 'Enter Date of the Company',
                              controller: _companyNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter date';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // Amount of the Contract
                            _buildCustomFormField(
                              context: context,
                              label: 'Amount of the Contract',
                              hintText: 'Enter Amount of the Contract (in Kd)',
                              controller: _companyNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter amount';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: Constants.getSpacingHigh(context)),

                            // Details of Payments title
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text(
                                    'Details of Payments',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.getFontSmall(context),
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.darkPink,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: Constants.getSpacingLittle(context)),

                            // Number of the payments
                            _buildCustomFormField(
                              context: context,
                              label: 'Number of the payments',
                              hintText: 'Enter Number of the payments',
                              controller: _companyNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter number of payments';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // Method of the Payment
                            _buildCustomFormField(
                              context: context,
                              label: 'Method of the payment',
                              hintText: 'Enter Method of the payment',
                              controller: _companyNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter payment method';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: Constants.getSpacingHigh(context)),

                            // Payment Cards
                            ReusablePaymentCard(
                              amount: '20.000',
                              dueDate: '01 September 2025',
                              notificationTime: 'Get notified 1 week before',
                            ),

                            SizedBox(height: Constants.getSpacingSmall(context)),

                            ReusablePaymentCard(
                              amount: '20.000',
                              dueDate: '01 December 2025',
                              notificationTime: 'Get notified 1 week before',
                              showKdSuffix: false,
                            ),

                            SizedBox(height: Constants.getSpacingSmall(context)),

                            ReusablePaymentCard(
                              amount: '20.000',
                              dueDate: '01 February 2025',
                              notificationTime: 'Get notified 1 week before',
                            ),

                            SizedBox(height: Constants.getSpacingSmall(context)),

                            ReusablePaymentCard(
                              amount: '20.000',
                              dueDate: '01 March 2025',
                              notificationTime: 'Get notified 1 week before',
                            ),

                            SizedBox(height: Constants.getSpacingSmall(context)),

                            ReusablePaymentCard(
                              amount: '20.000',
                              dueDate: '01 June 2025',
                              notificationTime: 'Get notified 1 week before',
                            ),

                            SizedBox(height: Constants.getSpacingHigh(context)),

                            // Achievements details title
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                top: Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
                                right: Responsive.value<double>(context, mobile: 10, tablet: 12, desktop: 14),
                                bottom: Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
                                left: Responsive.value<double>(context, mobile: 10, tablet: 12, desktop: 14),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Achievements details',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.getFontSmall(context),
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.darkPink,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: Constants.getSpacingLittle(context)),

                          Container(
                            padding: EdgeInsets.only(
                              top: Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
                              right: Responsive.value<double>(context, mobile: 10, tablet: 12, desktop: 14),
                              bottom: Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
                              left: Responsive.value<double>(context, mobile: 10, tablet: 12, desktop: 14),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Get notified',
                                      style: TextStyle(
                                        fontSize: Constants.getFontSmall(context),
                                        color: CustomColors.littleWhite,
                                        fontFamily: Constants.primaryfont,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Constants.getSpacingLittle(context)),

                                Container(
                                  width: Responsive.value<double>(
                                    context,
                                    mobile: 350,
                                    tablet: 380,
                                    desktop: 410,
                                  ),
                                  height: Responsive.value<double>(
                                    context,
                                    mobile: 36,
                                    tablet: 40,
                                    desktop: 44,
                                  ),
                                  padding: EdgeInsets.only(
                                    top: Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
                                    right: Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
                                    bottom: Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
                                    left: Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF000000).withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(
                                      Responsive.value<double>(
                                        context,
                                        mobile: 20,
                                        tablet: 22,
                                        desktop: 24,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: Constants.getSpacingLittle(context)),
                                      Text(
                                        'Monthly notifications',
                                        style: TextStyle(
                                          fontSize: Constants.getFontSmall(context),
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.littleWhite,
                                          fontFamily: Constants.primaryfont,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // Achievements details container
                            Container(
                              width: Responsive.value<double>(
                                context,
                                mobile: 350,
                                tablet: 380,
                                desktop: 410,
                              ),
                              height: Responsive.value<double>(
                                context,
                                mobile: 256,
                                tablet: 272,
                                desktop: 290,
                              ),
                              padding: EdgeInsets.only(
                                top: Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
                                right: Responsive.value<double>(context, mobile: 10, tablet: 12, desktop: 14),
                                bottom: Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
                                left: Responsive.value<double>(context, mobile: 10, tablet: 12, desktop: 14),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                  Responsive.value<double>(
                                    context,
                                    mobile: 16,
                                    tablet: 18,
                                    desktop: 20,
                                  ),
                                ),
                                border: Border.all(
                                  color: CustomColors.blackBS1,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Due date of payment
                                  _buildTextLabel(
                                    context: context,
                                    label: 'Due date of payment',
                                    sublabel: '01 September 2025',
                                  ),

                                  SizedBox(height: Constants.getSpacingMedium(context)),

                                  // When i get Notified
                                  _buildTextLabel(
                                    context: context,
                                    label: 'When I get notified',
                                    sublabel: 'Get notified 1 week before',
                                  ),

                                  SizedBox(height: Constants.getSpacingMedium(context)),

                                  // Percentage of achievement
                                  _buildTextLabel(
                                    context: context,
                                    label: 'Percentage of achievement',
                                    sublabel: '20 %',
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: Constants.getSpacingHigh(context)),

                            // EDIT Button
                            GradientButton(
                              text: 'EDIT',
                              onPressed: () {
                                print("CLICKED ON EDIT BUTTON");
                              },
                              width: Responsive.value<double>(
                                context,
                                mobile: 400,
                                tablet: 450,
                                desktop: 500,
                              ),
                              height: Responsive.value<double>(
                                context,
                                mobile: 48,
                                tablet: 52,
                                desktop: 56,
                              ),
                            ),

                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // SHARE AS PDF Button
                            GradientButton(
                              text: 'SHARE AS PDF',
                              onPressed: () {
                                print("CLICKED ON SHARE AS PDF BUTTON");
                              },
                              width: Responsive.value<double>(
                                context,
                                mobile: 400,
                                tablet: 450,
                                desktop: 500,
                              ),
                              height: Responsive.value<double>(
                                context,
                                mobile: 48,
                                tablet: 52,
                                desktop: 56,
                              ),
                            ),

                            // Extra spacing for larger screens
                            if (isTablet || isDesktop)
                              SizedBox(height: Constants.getSpacingLarge(context)),
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
    required BuildContext context,
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
                fontSize: Constants.getFontSmall(context),
                color: CustomColors.littleWhite,
                fontFamily: Constants.primaryfont,
              ),
            ),
            Text(
              ' *',
              style: TextStyle(
                fontSize: Constants.getFontSmall(context),
                color: CustomColors.red,
                fontFamily: Constants.primaryfont,
              ),
            ),
          ],
        ),
        SizedBox(height: Constants.getSpacingLittle(context)),

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(
            fontSize: Constants.getFontSmall(context),
            color: CustomColors.black87,
            fontFamily: Constants.primaryfont,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: Constants.getFontLittle(context),
              color: CustomColors.littleWhite,
              fontFamily: Constants.primaryfont,
            ),
            filled: true,
            fillColor: CustomColors.lightWhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Responsive.value<double>(
                  context,
                  mobile: 8,
                  tablet: 10,
                  desktop: 12,
                ),
              ),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: Responsive.value<double>(
                context,
                mobile: 12,
                tablet: 14,
                desktop: 16,
              ),
              vertical: Responsive.value<double>(
                context,
                mobile: 14,
                tablet: 16,
                desktop: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildTextLabel({
  required BuildContext context,
  required String label,
  required String sublabel,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: Constants.getFontSmall(context),
              color: CustomColors.littleWhite,
              fontFamily: Constants.primaryfont,
            ),
          ),
        ],
      ),
      SizedBox(height: Constants.getSpacingLittle(context)),

      Container(
        width: Responsive.value<double>(
          context,
          mobile: 350,
          tablet: 380,
          desktop: 410,
        ),
        height: Responsive.value<double>(
          context,
          mobile: 36,
          tablet: 40,
          desktop: 44,
        ),
        padding: EdgeInsets.only(
          top: Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
          right: Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
          bottom: Responsive.value<double>(context, mobile: 5, tablet: 6, desktop: 7),
          left: Responsive.value<double>(context, mobile: 20, tablet: 22, desktop: 24),
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF000000).withOpacity(0.05),
          borderRadius: BorderRadius.circular(
            Responsive.value<double>(
              context,
              mobile: 20,
              tablet: 22,
              desktop: 24,
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: Constants.getSpacingLittle(context)),
            Text(
              sublabel,
              style: TextStyle(
                fontSize: Constants.getFontSmall(context),
                fontWeight: FontWeight.bold,
                color: CustomColors.littleWhite,
                fontFamily: Constants.primaryfont,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}