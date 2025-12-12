import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/material/reusable_payment_card_with_icon.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/after_category_of_contract_construction_selection_show_add_documents.dart';

import '../../auth/features/gradient_button.dart';
import '../../auth/fields/custom_form_field.dart';
import '../../auth/fields/custom_phone_field.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/onboarding_background.dart';
import '../../utils/responsive_media_query.dart';
import '../material/positioned_header_back_icon.dart';
import '../material/reusable_payment_card_field.dart';

class AfterCategoryOfContractConstructionSelectionShow extends StatefulWidget {
  final String title;
  final String subtitle;
  final String child_sub_title;

  const AfterCategoryOfContractConstructionSelectionShow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child_sub_title,
  });

  @override
  State<AfterCategoryOfContractConstructionSelectionShow> createState() =>
      _AfterCategoryOfContractConstructionSelectionShowState();
}

class _AfterCategoryOfContractConstructionSelectionShowState
    extends State<AfterCategoryOfContractConstructionSelectionShow> {
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

            // Title + Subtitle + ChildTitle Box
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
                                crossAxisAlignment: .start,
                                children: [
                                  // NAME OF COMPANY FORM FIELD
                                  _buildTextLabel(
                                    label: 'Name of the Company',
                                    sublabel: 'Domna',
                                    Imagepath: Images.right,
                                  ),

                                  // REPRESENTATIVE OF COMPANY FORM FIELD
                                  _buildTextLabel(
                                    label: 'Representative Company Name',
                                    sublabel: 'Hazmi',
                                    Imagepath: Images.right,
                                  ),

                                  CustomPhoneField(),

                                  // FORM FIELD FOR EMAIL
                                  _buildTextLabel(
                                    label: 'Email of the Company',
                                    sublabel: 'h.awad@gmail.com',
                                    Imagepath: Images.mail,
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
                                  _buildTextLabel(
                                    label: 'Name of The Contract',
                                    sublabel: 'Contract Villa Hazmi',
                                    Imagepath: Images.right,
                                  ),

                                  // Date of the Contract
                                  _buildTextLabel(
                                    label: 'Date of the Contract',
                                    sublabel: '12 July 2025',
                                    Imagepath: Images.calenderIcon,
                                  ),

                                  // Amount of the Contract
                                  _buildTextLabel(
                                    label: 'Amount of the Contract',
                                    sublabel: '100.000(in Kd)',
                                    Imagepath: Images.right,
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
                                  _buildTextLabel(
                                    label: 'Number of the payments',
                                    sublabel: '2',
                                    Imagepath: Images.right,
                                  ),

                                  // Method of the Payment
                                  _buildTextLabel(
                                    label: 'Method of the payment',
                                    sublabel: 'Bank Transfer',
                                    Imagepath: Images.bottomarrowIcon,
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  ReusablePaymentCardWithIcon(
                                    amount: '20.000',
                                    dueDate: '01 September 2025',
                                    notificationTime:
                                        'Get notified 1 week before',
                                  ),

                                  SizedBox(height: Constants.spacingSmall),

                                  ReusablePaymentCardWithIcon(
                                    amount: '20.000',
                                    dueDate: '01 December 2025',
                                    notificationTime:
                                        'Get notified 1 week before',
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
                                  _buildTextLabel(
                                    label: 'Get notified',
                                    sublabel: 'Monthly notifications',
                                    Imagepath: Images.bottomarrowIcon,
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
                                        _buildTextLabel(
                                          label: 'Due date of Payment',
                                          sublabel: '15 August 2025',
                                          Imagepath: Images.calenderIcon,
                                        ),

                                        //When I get notified
                                        _buildTextLabel(
                                          label: 'When I get notified',
                                          sublabel: 'Get notified 1 Day before',
                                          Imagepath: Images.bottomarrowIcon,
                                        ),

                                        // Amount of the Payment
                                        _buildTextLabel(
                                          label: 'Percentage of achievement',
                                          sublabel: '20',
                                          Imagepath: Images.circlepercentIcon,
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
                                    text: 'CONFIRM AND ADD',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AfterCategoryOfContractConstructionSelectionShowAddDocuments(
                                                title: widget.title,
                                                sub_title: widget.subtitle,
                                                child_sub_title:
                                                    widget.child_sub_title,
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
