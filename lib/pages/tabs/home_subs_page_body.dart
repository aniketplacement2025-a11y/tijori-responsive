import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/pre_subscription_controller.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/material/plan_card_billing.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import '../../utils/Images.dart';

class HomeSubsPageBody extends StatefulWidget {
  const HomeSubsPageBody({super.key});

  @override
  State<HomeSubsPageBody> createState() => _HomeSubsPageBodyState();
}

class BillingPlan {
  final String title;
  final String discount;
  bool isSelected;

  BillingPlan({
    required this.title,
    required this.discount,
    required this.isSelected,
  });
}

class _HomeSubsPageBodyState extends State<HomeSubsPageBody> {
  late PreSubscriptionController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PreSubscriptionController(context);
  }

  int _selectedPlanIndex = 2; // Default selected: Yearly (-15%)

  final List<BillingPlan> _billingPlans = [
    BillingPlan(
      title: 'Monthly',
      discount: '',
      isSelected: false,
    ),
    BillingPlan(
      title: 'Quarterly',
      discount: '(-10%)',
      isSelected: false,
    ),
    BillingPlan(
      title: 'Yearly',
      discount: '(-15%)',
      isSelected: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants
    Constants.updateFromContext(context);

    // Responsive dimensions
    final double mainWidth = Responsive.value<double>(
      context,
      mobile: 400,
      tablet: 450,
      desktop: 500,
    );

    final double containerPadding = Responsive.value<double>(
      context,
      mobile: Constants.getSpacingSmall(context),
      tablet: Constants.getSpacingMedium(context),
      desktop: Constants.getSpacingHigh(context),
    );

    final double planCardsPadding = Responsive.value<double>(
      context,
      mobile: 40,
      tablet: 60,
      desktop: 80,
    );

    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: containerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Billing Plan Selection Container
            Container(
              width: mainWidth,
              height: Responsive.value<double>(
                context,
                mobile: 112,
                tablet: 120,
                desktop: 128,
              ),
              padding: EdgeInsets.all(
                Responsive.value<double>(
                  context,
                  mobile: 10,
                  tablet: 12,
                  desktop: 14,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row 1: Choose Your plan
                  Container(
                    width: mainWidth,
                    height: Constants.getFontLarge(context),
                    alignment: Alignment.center,
                    child: Text(
                      'Choose your plan',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.getFontMedium(context),
                        color: CustomColors.black87,
                      ),
                    ),
                  ),

                  // Row 2: Billing cycle
                  Container(
                    width: mainWidth - 65,
                    height: Constants.getFontSmall(context),
                    alignment: Alignment.center,
                    child: Text(
                      'Billing cycle',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.getFontLittle(context),
                        color: CustomColors.black87,
                      ),
                    ),
                  ),

                  // Row 3: Plan Selection Buttons
                  Container(
                    width: mainWidth - 68,
                    height: Constants.getFontLarge(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Responsive.value<double>(
                          context,
                          mobile: 10,
                          tablet: 12,
                          desktop: 14,
                        ),
                      ),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        // Monthly Button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedPlanIndex = 0;
                              });
                            },
                            child: Container(
                              height: Constants.getFontLarge(context),
                              decoration: BoxDecoration(
                                color: _selectedPlanIndex == 0
                                    ? CustomColors.ghostWhite
                                    : CustomColors.lightWhite,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    Responsive.value<double>(
                                      context,
                                      mobile: 10,
                                      tablet: 12,
                                      desktop: 14,
                                    ),
                                  ),
                                  bottomLeft: Radius.circular(
                                    Responsive.value<double>(
                                      context,
                                      mobile: 10,
                                      tablet: 12,
                                      desktop: 14,
                                    ),
                                  ),
                                ),
                                border: _selectedPlanIndex == 0
                                    ? null
                                    : Border(
                                  right: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                boxShadow: _selectedPlanIndex == 0
                                    ? [
                                  BoxShadow(
                                    color: CustomColors.blackBS1,
                                    blurRadius: Responsive.value<double>(
                                      context,
                                      mobile: 1,
                                      tablet: 1.5,
                                      desktop: 2,
                                    ),
                                    offset: const Offset(0, 1),
                                  ),
                                ]
                                    : null,
                              ),
                              padding: EdgeInsets.only(
                                top: Responsive.value<double>(
                                  context,
                                  mobile: 5,
                                  tablet: 6,
                                  desktop: 7,
                                ),
                                right: Responsive.value<double>(
                                  context,
                                  mobile: 20,
                                  tablet: 22,
                                  desktop: 24,
                                ),
                                bottom: Responsive.value<double>(
                                  context,
                                  mobile: 5,
                                  tablet: 6,
                                  desktop: 7,
                                ),
                                left: Responsive.value<double>(
                                  context,
                                  mobile: 20,
                                  tablet: 22,
                                  desktop: 24,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Monthly',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: _selectedPlanIndex == 0
                                      ? FontWeight.w700
                                      : FontWeight.w400,
                                  fontSize: Responsive.value<double>(
                                    context,
                                    mobile: 14,
                                    tablet: 15,
                                    desktop: 16,
                                  ),
                                  color: CustomColors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Quarterly Button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedPlanIndex = 1;
                              });
                            },
                            child: Container(
                              height: Constants.getFontMedium(context),
                              decoration: BoxDecoration(
                                color: _selectedPlanIndex == 1
                                    ? CustomColors.ghostWhite
                                    : CustomColors.lightWhite,
                                border: Border(
                                  left: _selectedPlanIndex == 1
                                      ? BorderSide.none
                                      : BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                  right: _selectedPlanIndex == 1
                                      ? BorderSide.none
                                      : BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                boxShadow: _selectedPlanIndex == 1
                                    ? [
                                  BoxShadow(
                                    color: CustomColors.blackBS1,
                                    blurRadius: Responsive.value<double>(
                                      context,
                                      mobile: 1,
                                      tablet: 1.5,
                                      desktop: 2,
                                    ),
                                    offset: const Offset(0, 1),
                                  ),
                                ]
                                    : null,
                              ),
                              padding: EdgeInsets.only(
                                top: Responsive.value<double>(
                                  context,
                                  mobile: 5,
                                  tablet: 6,
                                  desktop: 7,
                                ),
                                right: Responsive.value<double>(
                                  context,
                                  mobile: 12,
                                  tablet: 14,
                                  desktop: 16,
                                ),
                                bottom: Responsive.value<double>(
                                  context,
                                  mobile: 5,
                                  tablet: 6,
                                  desktop: 7,
                                ),
                                left: Responsive.value<double>(
                                  context,
                                  mobile: 12,
                                  tablet: 14,
                                  desktop: 16,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Quarterly ',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontWeight: _selectedPlanIndex == 1
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                        fontSize: Constants.getFontLittle(context),
                                        color: CustomColors.black87,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: SizedBox(
                                        width: Responsive.value<double>(
                                          context,
                                          mobile: 1,
                                          tablet: 2,
                                          desktop: 3,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: '(-10%)',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontWeight: _selectedPlanIndex == 1
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                        fontSize: Responsive.value<double>(
                                          context,
                                          mobile: 10,
                                          tablet: 11,
                                          desktop: 12,
                                        ),
                                        color: CustomColors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Yearly Button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedPlanIndex = 2;
                              });
                            },
                            child: Container(
                              height: Responsive.value<double>(
                                context,
                                mobile: 36,
                                tablet: 38,
                                desktop: 40,
                              ),
                              decoration: BoxDecoration(
                                color: _selectedPlanIndex == 2
                                    ? Colors.white
                                    : const Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                    Responsive.value<double>(
                                      context,
                                      mobile: 10,
                                      tablet: 12,
                                      desktop: 14,
                                    ),
                                  ),
                                  bottomRight: Radius.circular(
                                    Responsive.value<double>(
                                      context,
                                      mobile: 10,
                                      tablet: 12,
                                      desktop: 14,
                                    ),
                                  ),
                                ),
                                border: _selectedPlanIndex == 2
                                    ? null
                                    : Border(
                                  left: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                boxShadow: _selectedPlanIndex == 2
                                    ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: Responsive.value<double>(
                                      context,
                                      mobile: 1,
                                      tablet: 1.5,
                                      desktop: 2,
                                    ),
                                    offset: const Offset(0, 1),
                                  ),
                                ]
                                    : null,
                              ),
                              padding: EdgeInsets.only(
                                top: Responsive.value<double>(
                                  context,
                                  mobile: 5,
                                  tablet: 6,
                                  desktop: 7,
                                ),
                                right: Responsive.value<double>(
                                  context,
                                  mobile: 20,
                                  tablet: 22,
                                  desktop: 24,
                                ),
                                bottom: Responsive.value<double>(
                                  context,
                                  mobile: 5,
                                  tablet: 6,
                                  desktop: 7,
                                ),
                                left: Responsive.value<double>(
                                  context,
                                  mobile: 20,
                                  tablet: 22,
                                  desktop: 24,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Yearly ',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontWeight: _selectedPlanIndex == 2
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                        fontSize: Constants.getFontLittle(context),
                                        height: 1.0,
                                        letterSpacing: 0,
                                        color: const Color(0xFF34362D),
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: SizedBox(
                                        width: Responsive.value<double>(
                                          context,
                                          mobile: 1,
                                          tablet: 2,
                                          desktop: 3,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: '(-15%)',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontWeight: _selectedPlanIndex == 2
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                        fontSize: Responsive.value<double>(
                                          context,
                                          mobile: 10,
                                          tablet: 11,
                                          desktop: 12,
                                        ),
                                        height: 1.0,
                                        letterSpacing: 0,
                                        color: CustomColors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), // Billing Plan Container Complete Here

            // Some Space
            SizedBox(height: Constants.getSpacingLittle(context)),

            // Plan Cards Container
            Container(
              width: mainWidth,
              height: Responsive.value<double>(
                context,
                mobile: 646,
                tablet: 680,
                desktop: 714,
              ),
              padding: EdgeInsets.only(
                right: planCardsPadding,
                left: planCardsPadding,
              ),
              child: Column(
                children: [
                  SizedBox(height: Constants.getSpacingLittle(context)),

                  // Basic Plan Card
                  PlanCardBilling(
                    planName: 'BASIC',
                    price: '320',
                    pricePeriod: 'Paid annually',
                    features: [
                      {'icon': Images.right, 'title': 'Storage capacity limits 2GB'},
                      {'icon': Images.right, 'title': '10 OCR docs quota per month'},
                      {'icon': Images.wrong, 'title': 'Live support and direct chat'},
                    ],
                    buttonText: 'SUBSCRIBE',
                    onPressed: () {
                      print('PRESSED ON Subscription');
                      _controller.handleSubscriptionPress(
                        planName: 'BASIC',
                        planPrice: '320',
                      );
                    },
                  ),

                  SizedBox(height: Constants.getSpacingMedium(context)),

                  // PRO Plan Card
                  PlanCardBilling(
                    planName: 'PRO',
                    price: '450',
                    pricePeriod: 'Paid annually',
                    features: [
                      {'icon': Images.right, 'title': 'Storage capacity limits 10GB'},
                      {'icon': Images.right, 'title': '30 OCR docs quota per month'},
                      {'icon': Images.right, 'title': 'Live support and direct chat'},
                    ],
                    buttonText: 'SUBSCRIBE',
                    onPressed: () {
                      print('PRESSED ON Subscription');
                      _controller.handleSubscriptionPress(
                        planName: 'PRO',
                        planPrice: '450',
                      );
                    },
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
    );
  }
}