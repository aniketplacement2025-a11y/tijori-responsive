import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/warranty_categories_data.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/features/home_category_card.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/after_category_of_warranties_watch_selection.dart';

import '../../auth/features/gradient_button.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';
import '../material/positioned_header_back_icon.dart';

class AfterListedDocumentWarrantiesSelection extends StatefulWidget {
  final String title;
  final String subtitle;

  AfterListedDocumentWarrantiesSelection({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<AfterListedDocumentWarrantiesSelection> createState() =>
      _AfterListedDocumentWarrantiesSelectionState();
}

class _AfterListedDocumentWarrantiesSelectionState
    extends State<AfterListedDocumentWarrantiesSelection> {
  int? _selectedCategoryIndex; // Track selected Category index
  bool _acceptItems = false;

  void _navigateToChildCategoryOfProjectPage(
    String child_sub_title,
    String subtitle,
    String title,
    BuildContext context,
  ) {
    switch (child_sub_title) {
      case 'WATCHES':
        _navigatetoNextPage(
          title: title,
          subtitle: subtitle,
          child_sub_title: child_sub_title,
        );
        break;
      case 'JEWELARIES':
        _navigatetoNextPage(
          title: title,
          subtitle: subtitle,
          child_sub_title: child_sub_title,
        );
        break;
      case 'BAGS':
        _navigatetoNextPage(
          title: title,
          subtitle: subtitle,
          child_sub_title: child_sub_title,
        );
        break;
      case 'OTHERS':
        _navigatetoNextPage(
          title: title,
          subtitle: subtitle,
          child_sub_title: child_sub_title,
        );
        break;
    }
  }

  void _navigatetoNextPage({
    required String title,
    required String subtitle,
    required String child_sub_title,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AfterCategoryOfWarrantiesWatchSelection(
          subtitle: subtitle,
          title: title,
          child_sub_title: child_sub_title,
        ),
      ),
    );
  }

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

            // "Category of Warranty" Text + Grid View Options
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
                                      'Category of Warranty',
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

                            // "Choose from below type of your contract" text
                            Container(
                              width: double.infinity,
                              child: Text(
                                'Choose from below type of your contract',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontLittle,
                                  fontWeight: .w500,
                                  color: CustomColors.littleWhite,
                                ),
                              ),
                            ),

                            // Vertical Scrollable Card
                            Container(
                              width: 400,
                              height: 225,
                              margin: EdgeInsets.symmetric(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              child: GridView.count(
                                crossAxisCount: 2, // 2 Items per Row
                                crossAxisSpacing: Constants.spacingSmall,
                                mainAxisSpacing: Constants.spacingSmall,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                childAspectRatio: 194 / 108,
                                children: WarrantyCategoriesData.warranty
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                      int index = entry.key;
                                      Map<String, String> contract =
                                          entry.value;
                                      String child_sub_title =
                                          contract['title']!;
                                      String icon = contract['icon']!;

                                      return Container(
                                        child: HomeCategoryCard(
                                          onTap: () {
                                            setState(() {
                                              // Toggle selection - if already selected, deselect
                                              _selectedCategoryIndex =
                                                  _selectedCategoryIndex ==
                                                      index
                                                  ? null
                                                  : index;
                                            });
                                            print('$child_sub_title tapped');

                                            // Navigate to respective page
                                            _navigateToChildCategoryOfProjectPage(
                                              child_sub_title,
                                              widget.subtitle,
                                              widget.title,
                                              context,
                                            );
                                          },
                                          imageAsset: icon,
                                          title: child_sub_title,
                                          isSelected:
                                              _selectedCategoryIndex == index,
                                        ),
                                      );
                                    })
                                    .toList(),
                              ),
                            ),

                            // "This type of contract is about construction projects type of contract is about construction projects." Text
                            Container(
                              width: double.infinity,
                              child: Text(
                                'This type of contract is about construction projects type of contract is about construction projects.',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.fontLittle,
                                  fontWeight: .w500,
                                  color: CustomColors.littleWhite,
                                  // Adjust color as needed
                                ),
                              ),
                            ),

                            // Terms and Conditions
                            Row(
                              children: [
                                Checkbox(
                                  value: _acceptItems,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _acceptItems = value ?? false;
                                    });
                                  },
                                  activeColor: CustomColors.gradientBlue,
                                ),

                                Expanded(
                                  child: Text(
                                    'Scan Ai Ocr Proccess to extract informations.',
                                    style: TextStyle(
                                      fontSize: Constants.fontLittle,
                                      color: CustomColors.black87,
                                      fontFamily: Constants.primaryfont,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: Constants.spacingLittle),

                            GradientButton(
                              text: 'Add the contract',
                              onPressed: () {
                                print("CLICKED ON ADD THE CONTRACT");
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
            ),
          ],
        ),
      ),
    );
  }
}
