import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/gradient_button.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/categories_data.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/contract_categories_data.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/features/home_category_card.dart';
import 'package:vkaps_it_solution_project_tijori/services/providers/provider/get_subcategory_by_category_id_provider.dart';
import 'package:vkaps_it_solution_project_tijori/services/providers/provider/my_categories_provider.dart';
import 'package:vkaps_it_solution_project_tijori/services/settings/loadingIndicator.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/after_category_of_contract_construction_selection.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';
import '../material/positioned_header_back_icon.dart';

class AfterListedDocumentContractSelection extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isCommercial;
  final String? UpdateFile;
  final String folderName;
  final String id;

  AfterListedDocumentContractSelection({
    super.key,
    required this.isCommercial,
    required this.title,
    required this.subtitle,
    required this.UpdateFile,
    required this.folderName,
    required this.id,
  });

  @override
  State<AfterListedDocumentContractSelection> createState() =>
      _AfterListedDocumentContractSelectionState();
}

class _AfterListedDocumentContractSelectionState
    extends State<AfterListedDocumentContractSelection> {
  int? _selectedCategoryIndex;
  bool _acceptItems = false;
  late GetSubcategoryByCategoryIdProvider _getSubcategoryByCategoryIdProvider;

  @override
  void initState() {
    super.initState();
    _getSubcategoryByCategoryIdProvider = GetSubcategoryByCategoryIdProvider();
    _fetchCategories();
  }

  void _fetchCategories() async {
    await _getSubcategoryByCategoryIdProvider.fetchSubcategories(widget.id);
  }

  void _navigateToChildCategoryOfProjectPage(
      String child_sub_title,
      String subtitle,
      String title,
      BuildContext context,
      ) {
    switch (child_sub_title) {
      case 'CONSTRUCTION':
      case 'RENT':
      case 'FOUNDATION':
      case 'AIR CONDITIONING':
      case 'DESIGN':
        _navigatetoNextPage(
          title: title,
          subtitle: subtitle,
          child_sub_title: child_sub_title,
        );
        break;
      case 'OTHERS':
        break;
      default:
        print('No navigation defined for $title');
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
        builder: (context) => AfterCategoryOfContractConstructionSelection(
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

    final double gridViewheight = Responsive.value<double>(
      context,
      mobile: 348,
      tablet: 380,
      desktop: 412,
    );

    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // Header Fixed at top
            PositionedHeaderBackIcon(
              context: context,
              top: headerTop,
              left: isMobile ? 4 : 8,
              right: isMobile ? 0 : 8,
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
              left: isMobile ? 10 : 20,
              right: isMobile ? 10 : 20,
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
                        mobile: 330,
                        tablet: 360,
                        desktop: 390,
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
                              maxWidth: Responsive.value<double>(
                                context,
                                mobile: 286,
                                tablet: 306,
                                desktop: 326,
                              ),
                              minWidth: 100,
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
                      width: Responsive.value<double>(
                        context,
                        mobile: 280,
                        tablet: 300,
                        desktop: 320,
                      ),
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

            // "Category of Contract" Text + Grid View Options
            Positioned(
              top: Responsive.value<double>(
                context,
                mobile: 172,
                tablet: 184,
                desktop: 196,
              ),
              left: 0,
              right: 0,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                      'Category of Contract',
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

                            // Vertical Scrollable Card Using GridView.builder
                            ChangeNotifierProvider.value(
                              value: _getSubcategoryByCategoryIdProvider,
                              child: Consumer<GetSubcategoryByCategoryIdProvider>(
                              builder: (context, getSubcategoryByCategoryIdProvider,child) {

                                //  Show Loading Indicator
                                if(getSubcategoryByCategoryIdProvider.isLoading){
                                  return Container(
                                    width: mainWidth,
                                    height: gridViewheight,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: Constants.getSpacingLittle(context),
                                      vertical: Constants.getSpacingLittle(context),
                                    ),
                                    child: loadingIndicator(),
                                  );
                                }

                                // Show error if any
                                if(getSubcategoryByCategoryIdProvider.error != null){
                                  return Container(
                                    width: mainWidth,
                                    height: gridViewheight,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: Constants.getSpacingLittle(context),
                                      vertical: Constants.getSpacingLittle(context),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Error loading categories',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  );
                                }

                                final subCategoriesList = getSubcategoryByCategoryIdProvider.subcategories.isNotEmpty
                                    ? getSubcategoryByCategoryIdProvider.subcategories : CategoriesData.categories;

                                return
                                Container(
                                  width: mainWidth,
                                  height: gridViewheight,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: Constants.getSpacingLittle(context),
                                    vertical: Constants.getSpacingLittle(context),
                                  ),
                                  child: GridView.count(
                                    crossAxisCount: Responsive.value<int>(
                                      context,
                                      mobile: 2,
                                      tablet: 3,
                                      desktop: 4,
                                    ),
                                    crossAxisSpacing: Constants.getSpacingSmall(
                                        context),
                                    mainAxisSpacing: Constants.getSpacingSmall(
                                        context),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    childAspectRatio: Responsive.value<double>(
                                      context,
                                      mobile: 194 / 108,
                                      tablet: 200 / 112,
                                      desktop: 206 / 116,
                                    ),
                                    children: subCategoriesList
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      int index = entry.key;
                                      Map<String, dynamic> contract = entry.value;
                                      String child_sub_title = contract['name']!;
                                      String icon = Images.circleright;

                                      return Container(
                                        child: HomeCategoryCard(
                                          isSelected: _selectedCategoryIndex ==
                                              index,
                                          imageAsset: icon,
                                          title: child_sub_title,
                                          onTap: () {
                                            setState(() {
                                              _selectedCategoryIndex =
                                              _selectedCategoryIndex == index
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
                                        ),
                                      );
                                    })
                                        .toList(),
                                  ),
                                );
                              }, ),
                            ),

                            // Description Text
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
                                      fontSize: Constants.getFontLittle(context),
                                      color: CustomColors.black87,
                                      fontFamily: Constants.primaryfont,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: Constants.getSpacingLittle(context)),

                            GradientButton(
                              text: 'Add the contract',
                              onPressed: () {
                                print("CLICKED ON ADD THE CONTRACT");
                              },
                              width: Responsive.value<double>(
                                context,
                                mobile: 350,
                                tablet: 380,
                                desktop: 410,
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
}