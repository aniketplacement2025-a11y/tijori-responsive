import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/features/pre_subscription_controller.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/material/plan_card_billing.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';

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
  void initState(){
    super.initState();
    _controller = PreSubscriptionController(context);
  }

  int _selectedPlanIndex = 2;
   // Default selected: Yearly (-15%)

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
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.spacingSmall,
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            // Your Scrollable content Containers here.
            Container(
             width: 400,
             height: 112,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: .spaceBetween,
                children: [
                  // Row 1: Choose Your plan
                  Container(
                   width: 400,
                    height: Constants.fontLarge,
                    alignment: Alignment.center,
                    child: Text(
                      'Choose your plan',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontWeight: .bold,
                        fontSize: Constants.fontMedium,
                        color: CustomColors.black87,
                      ),
                    ),
                  ),

                  // Row 2: Billing cycle
                  Container(
                    width: 335,
                    height: Constants.fontSmall,
                    alignment: .center,
                    child: Text(
                      'Billing cycle',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.fontLittle,
                        color: CustomColors.black87,
                      ),
                    ),
                  ),

                  // Row 3: Plan Selection Buttons
                  Container(
                    width: 332,
                    height: Constants.fontLarge,
                    decoration: BoxDecoration(
                      borderRadius: .circular(10),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [

                        // Monthly Button
                        Expanded(
                            child:
                             GestureDetector(
                               onTap: (){
                                 setState(() {
                                   _selectedPlanIndex = 0;
                                 });
                               },
                               child: Container(
                                 height: Constants.fontLarge,
                                 decoration: BoxDecoration(
                                   color: _selectedPlanIndex == 0
                                       ? CustomColors.ghostWhite
                                        : CustomColors.lightWhite,
                                   borderRadius: const BorderRadius.only(
                                     topLeft: Radius.circular(10),
                                     bottomLeft: Radius.circular(10),
                                   ),
                                   border: _selectedPlanIndex == 0
                                     ? null : Border(
                                     right: BorderSide(
                                      color:  Colors.grey.shade300,
                                      width: 1,
                                     ),
                                   ),
                                   boxShadow: _selectedPlanIndex == 0
                                     ? [
                                       BoxShadow(
                                         color: CustomColors.blackBS1,
                                         blurRadius: 1,
                                         offset: const Offset(0, 1),
                                       ),
                                   ] : null,
                                 ),
                                 padding: const EdgeInsets.only(
                                   top: 5,
                                   right: 20,
                                   bottom: 5,
                                   left: 20,
                                 ),
                                 alignment: .center,
                                 child: Text(
                                   'Monthly',
                                   style: TextStyle(
                                     fontFamily: Constants.primaryfont,
                                     fontWeight: _selectedPlanIndex == 0
                                         ? FontWeight.w700
                                         : FontWeight.w400,
                                     fontSize: 14,
                                     color: CustomColors.black87,
                                   ),
                                 ),
                               ),
                             ),
                        ),

                        Expanded(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedPlanIndex = 1;
                                });
                              },
                              child: Container(
                                height: Constants.fontMedium,
                                decoration: BoxDecoration(
                                  color: _selectedPlanIndex == 1
                                      ? CustomColors.ghostWhite
                                      : CustomColors.lightWhite,
                                  border: Border(
                                  left: _selectedPlanIndex == 1
                                      ? BorderSide.none
                                      : BorderSide(
                                        color:  Colors.grey.shade300,
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
                                      blurRadius: 1,
                                      offset: const Offset(0, 1),
                                    ),
                                  ] : null,
                                ),
                                padding: const EdgeInsets.only(
                                  top: 5,
                                  right: 12,
                                  bottom: 5,
                                  left: 12,
                                ),
                                alignment: .center,
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
                                           fontSize: Constants.fontLittle,
                                           color: CustomColors.black87,
                                         ),
                                      ),
                                      WidgetSpan(
                                       child: SizedBox(width: 1),
                                      ),
                                      TextSpan(
                                       text: '(-10%)',
                                        style: TextStyle(
                                          fontFamily: Constants.primaryfont,
                                          fontWeight: _selectedPlanIndex == 1
                                              ? FontWeight.w700
                                              : FontWeight.w400,
                                          fontSize: 10,
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
              height: 36,
              decoration: BoxDecoration(
                color: _selectedPlanIndex == 2
                    ? Colors.white
                    : const Color(0xFFF2F2F2),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
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
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ]
                    : null,
              ),
              padding: const EdgeInsets.only(
                top: 5,
                right: 20,
                bottom: 5,
                left: 20,
              ),
              alignment: Alignment.center,
              child:RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Yearly ',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: _selectedPlanIndex == 2
                            ? FontWeight.w700
                            : FontWeight.w400,
                        fontSize: Constants.fontLittle,
                        height: 1.0,
                        letterSpacing: 0,
                        color: const Color(0xFF34362D),
                      ),
                    ),
                    WidgetSpan(
                      child: SizedBox(width: 1),
                    ),
                    TextSpan(
                      text: '(-15%)',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: _selectedPlanIndex == 2
                            ? FontWeight.w700
                            : FontWeight.w400,
                        fontSize: 10,
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
            SizedBox(height: Constants.spacingLittle),


            Container(
              width: 400,
              height: 646,
              padding: EdgeInsets.only(
                right: 40,
                left: 40,
              ),
              child: Column(
                children: [

                  SizedBox(height: Constants.spacingLittle),

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
                    onPressed: (){
                      print('PRESSED ON Subscription');
                      _controller.handleSubscriptionPress(
                          planName: 'BASIC',
                          planPrice: '320'
                      );
                    },
                  ),

                   SizedBox(height: Constants.spacingMedium),

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
                          planPrice: '450');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
