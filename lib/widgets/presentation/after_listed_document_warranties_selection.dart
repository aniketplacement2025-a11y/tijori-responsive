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
  final bool isCommercial;

  AfterListedDocumentWarrantiesSelection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isCommercial,
  });

  @override
  State<AfterListedDocumentWarrantiesSelection> createState() =>
      _AfterListedDocumentWarrantiesSelectionState();
}

class _AfterListedDocumentWarrantiesSelectionState
    extends State<AfterListedDocumentWarrantiesSelection> {
  int? _selectedCategoryIndex;
  bool _acceptItems = false;

  void _navigateToChildCategoryOfProjectPage(
      String child_sub_title,
      String subtitle,
      String title,
      BuildContext context,
      ) {
    switch (child_sub_title) {
      case 'WATCHES':
      case 'JEWELARIES':
      case 'BAGS':
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
          isCommercial: widget.isCommercial,
        ),
      ),
    );
  }

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

    final double headerTop = Responsive.value<double>(
      context,
      mobile: 20,
      tablet: 24,
      desktop: 28,
    );

    final double titleTop = Responsive.value<double>(
      context,
      mobile: 72,
      tablet: 80,
      desktop: 88,
    );

    final double contentTop = Responsive.value<double>(
      context,
      mobile: 172,
      tablet: 188,
      desktop: 204,
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
              },
            ),

            // Title + SubTitle Box
            Positioned(
              top: titleTop,
              left: isMobile ? 12 : 20,
              right: isMobile ? 12 : 20,
              child: Container(
                alignment: Alignment.center,
                height: Responsive.value<double>(
                  context,
                  mobile: 96,
                  tablet: 104,
                  desktop: 112,
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
                    color: CustomColors.black87,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Row 1: Bucket name with icon
                    SizedBox(
                      width: mainWidth - 70,
                      height: Responsive.value<double>(
                        context,
                        mobile: 22,
                        tablet: 24,
                        desktop: 26,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: mainWidth - 140,
                            ),
                            height: Constants.getFontSmall(context),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Bucket: ',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.getFontSmall(context),
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${widget.title}',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.getFontSmall(context),
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
                      width: mainWidth - 120,
                      height: Responsive.value<double>(
                        context,
                        mobile: 20,
                        tablet: 22,
                        desktop: 24,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Type: ',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.getFontSmall(context),
                                  color: CustomColors.black87,
                                ),
                              ),
                              TextSpan(
                                text: '${widget.subtitle.toLowerCase()}',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.getFontSmall(context),
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
              top: contentTop,
              left: isMobile ? 12 : 20,
              right: isMobile ? 12 : 20,
              bottom: Responsive.value<double>(
                context,
                mobile: 10,
                tablet: 12,
                desktop: 14,
              ),
              child: Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.getSpacingSmall(context),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Add Bucket Text and Icon
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 2),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Left: Title
                                Flexible(
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: Responsive.value<double>(
                                        context,
                                        mobile: 184,
                                        tablet: 200,
                                        desktop: 216,
                                      ),
                                    ),
                                    child: Text(
                                      'Category of Warranty',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontSize: Responsive.value<double>(
                                          context,
                                          mobile: 18,
                                          tablet: 19,
                                          desktop: 20,
                                        ),
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.black87,
                                      ),
                                    ),
                                  ),
                                ),

                                // Progress icon
                                Container(
                                  width: Constants.getSpacingHigh(context),
                                  height: Constants.getSpacingLarge(context),
                                  child: Image.asset(
                                    Images.twoofthree,
                                    width: Constants.getSpacingHigh(context),
                                    height: Constants.getSpacingLarge(context),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),

                            // "Choose from below type of your contract" text
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                top: Constants.getSpacingLittle(context),
                              ),
                              child: Text(
                                'Choose from below type of your contract',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.getFontLittle(context),
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.littleWhite,
                                ),
                              ),
                            ),

                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // Vertical Scrollable Card
                            Container(
                              width: mainWidth,
                              height: Responsive.value<double>(
                                context,
                                mobile: 225,
                                tablet: 250,
                                desktop: 275,
                              ),
                              margin: EdgeInsets.symmetric(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              child: GridView.count(
                                crossAxisCount: Responsive.value<int>(
                                  context,
                                  mobile: 2,
                                  tablet: 2,
                                  desktop: 3,
                                ),
                                crossAxisSpacing: Constants.getSpacingSmall(context),
                                mainAxisSpacing: Constants.getSpacingSmall(context),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                childAspectRatio: Responsive.value<double>(
                                  context,
                                  mobile: 194 / 108,
                                  tablet: 200 / 112,
                                  desktop: 180 / 100,
                                ),
                                children: WarrantyCategoriesData.warranty
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int index = entry.key;
                                  Map<String, String> contract = entry.value;
                                  String child_sub_title = contract['title']!;
                                  String icon = contract['icon']!;

                                  return Container(
                                    child: HomeCategoryCard(
                                      onTap: () {
                                        setState(() {
                                          _selectedCategoryIndex = _selectedCategoryIndex == index
                                              ? null
                                              : index;
                                        });
                                        print('$child_sub_title tapped');

                                        _navigateToChildCategoryOfProjectPage(
                                          child_sub_title,
                                          widget.subtitle,
                                          widget.title,
                                          context,
                                        );
                                      },
                                      imageAsset: icon,
                                      title: child_sub_title,
                                      isSelected: _selectedCategoryIndex == index,
                                    ),
                                  );
                                })
                                    .toList(),
                              ),
                            ),

                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // Description text
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                bottom: Constants.getSpacingMedium(context),
                              ),
                              child: Text(
                                'This type of contract is about construction projects type of contract is about construction projects.',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.getFontLittle(context),
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.littleWhite,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            // Terms and Conditions
                            Container(
                              width: mainWidth,
                              margin: EdgeInsets.only(
                                bottom: Constants.getSpacingMedium(context),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: .start,
                                children: [
                                  Checkbox(
                                    value: _acceptItems,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _acceptItems = value ?? false;
                                      });
                                    },
                                    activeColor: CustomColors.gradientBlue,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),

                                  SizedBox(width: Constants.getSpacingSmall(context)),

                                  Text(
                                      'Scan Ai Ocr Proccess to extract informations.',
                                      style: TextStyle(
                                        fontSize: Constants.getFontLittle(context),
                                        color: CustomColors.black87,
                                        fontFamily: Constants.primaryfont,
                                        height: 1.4,
                                      ),
                                    ),
                                ],
                              ),
                            ),

                            SizedBox(height: Constants.getSpacingLittle(context)),

                            // Add Contract Button
                            GradientButton(
                              text: 'Add the contract',
                              onPressed: () {
                                print("CLICKED ON ADD THE CONTRACT");
                              },
                              width: mainWidth - 50,
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
}