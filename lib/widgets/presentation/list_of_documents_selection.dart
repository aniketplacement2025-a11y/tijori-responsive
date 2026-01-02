import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/dialogs/add_new_category_response.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/add_new_category_click_event.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/after_listed_document_appointments_selection.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/after_listed_document_contract_selection.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/after_listed_document_my_medicines_selection.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/after_listed_document_my_trips_selection.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/after_listed_document_warranties_selection.dart';

import '../../pages/official_landing_page.dart';
import '../../pages/others/categories_data.dart';
import '../../pages/tabs/features/home_category_card.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';
import '../material/positioned_header_back_icon.dart';

class ListOfDocumentsSelection extends StatefulWidget {
  final String bucket_title;
  final bool isCommercial;

  ListOfDocumentsSelection({
    super.key,
    required this.isCommercial,
    required this.bucket_title,
  });

  @override
  State<ListOfDocumentsSelection> createState() => _ListOfDocumentsSelectionState();
}

class _ListOfDocumentsSelectionState extends State<ListOfDocumentsSelection> {
  int? _selectedCategoryIndex; // Track selected Category index
  TextEditingController controller = TextEditingController();

  // Navigation method based on category title
  void _navigateToProjectPage(String subtitle, String title, BuildContext context) {
    switch (subtitle) {
      case 'CONTRACTS':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AfterListedDocumentContractSelection(
              subtitle: subtitle,
              isCommercial: widget.isCommercial,
              title: title,
            ),
          ),
        );
        break;
      case 'WARRANTIES':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AfterListedDocumentWarrantiesSelection(
              subtitle: subtitle,
              isCommercial: widget.isCommercial,
              title: title,
            ),
          ),
        );
        break;
      case 'INSURANCE':
        break;
      case 'PERSONAL DOC':
        break;
      case 'MY TRIPS':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AfterListedDocumentMyTripsSelection(
              title: title,
              isCommercial: widget.isCommercial,
              subtitle: subtitle,
            ),
          ),
        );
        break;
      case 'Appointments':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AfterListedDocumentAppointmentsSelection(
              title: title,
              subtitle: subtitle,
              isCommercial: widget.isCommercial,
            ),
          ),
        );
        break;
      case 'My Medicine':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AfterListedDocumentMyMedicinesSelection(
              title: title,
              isCommercial: widget.isCommercial,
              subtitle: subtitle,
            ),
          ),
        );
        break;
      default:
        print('No navigation defined for $title');
    }
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

    final double topContainerHeight = Responsive.value<double>(
      context,
      mobile: 112,
      tablet: 120,
      desktop: 128,
    );

    final double headerTop = Responsive.value<double>(
      context,
      mobile: 72,
      tablet: 80,
      desktop: 88,
    );

    final double gridViewHeight = Responsive.value<double>(
      context,
      mobile: 480,
      tablet: 520,
      desktop: 560,
    );

    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // Header Fixed at top - Already responsive via PositionedHeaderBackIcon
            PositionedHeaderBackIcon(
              context: context,
              top: 20,
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

            // Top Container with Bucket Info
            Positioned(
              top: headerTop,
              left: isMobile ? 12 : 20,
              right: isMobile ? 12 : 20,
              child: Container(
                alignment: Alignment.center,
                height: topContainerHeight,
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
                      width: mainWidth - 50,
                      height: Responsive.value<double>(
                        context,
                        mobile: 22,
                        tablet: 24,
                        desktop: 26,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: Constants.getSpacingLittle(context)),

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
                        ],
                      ),
                    ),

                    SizedBox(height: Constants.getSpacingSmall(context)),

                    // Row 2: Type
                    SizedBox(
                      width: mainWidth - 80,
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
                                text: '${widget.bucket_title}',
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

            // Main Content Area
            Positioned(
              top: headerTop + topContainerHeight + Responsive.value<double>(
                context,
                mobile: 4,
                tablet: 8,
                desktop: 12,
              ),
              left: isMobile ? 12 : 20,
              right: isMobile ? 12 : 20,
              bottom: 10,
              child: Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.value<double>(
                      context,
                      mobile: Constants.getSpacingSmall(context),
                      tablet: Constants.getSpacingMedium(context),
                      desktop: Constants.getSpacingHigh(context),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text and New Category Button
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 2),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Left: Title
                                Flexible(
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: mainWidth * 0.6,
                                    ),
                                    child: Text(
                                      'What do you want to add to this Bucket?',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontSize: Constants.getFontLittle(context),
                                        color: CustomColors.black87,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(width: Constants.getSpacingSmall(context)),

                                // Add New Category Button
                                Material(
                                  color: Colors.transparent,
                                  child: GestureDetector(
                                    onTap: () {
                                      print("Clicked on Add New Bucket");
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return AddNewCategoryResponse(
                                            onComplete: () {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => AddNewCategoryClickEvent(),
                                                ),
                                              );
                                            },
                                            controller: controller,
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: Responsive.value<double>(
                                        context,
                                        mobile: 36,
                                        tablet: 38,
                                        desktop: 40,
                                      ),
                                      constraints: BoxConstraints(
                                        maxWidth: Responsive.value<double>(
                                          context,
                                          mobile: 150,
                                          tablet: 165,
                                          desktop: 180,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Constants.getFontLittle(context),
                                        vertical: Constants.getSpacingLittle(context),
                                      ),
                                      decoration: BoxDecoration(
                                        color: CustomColors.ghostWhite,
                                        borderRadius: BorderRadius.circular(
                                          Constants.getSpacingLittle(context),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: CustomColors.blackBS1,
                                            blurRadius: Responsive.value<double>(
                                              context,
                                              mobile: 4,
                                              tablet: 5,
                                              desktop: 6,
                                            ),
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: Constants.getFontLittle(context),
                                            height: Constants.getFontLittle(context),
                                            child: Image.asset(
                                              Images.plusIcon,
                                              fit: BoxFit.contain,
                                            ),
                                          ),

                                          SizedBox(width: Constants.getSpacingLittle(context)),

                                          Text(
                                            'Add New Category',
                                            style: TextStyle(
                                              fontFamily: Constants.primaryfont,
                                              fontSize: Constants.getSpacingSmall(context),
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

                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // Vertical Scrollable Cards Using GridView.builder
                            Container(
                              width: mainWidth,
                              height: gridViewHeight,
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
                                crossAxisSpacing: Constants.getSpacingSmall(context),
                                mainAxisSpacing: Constants.getSpacingSmall(context),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                childAspectRatio: Responsive.value<double>(
                                  context,
                                  mobile: 194 / 108,
                                  tablet: 200 / 110,
                                  desktop: 210 / 115,
                                ),
                                children: CategoriesData.categories.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  Map<String, String> category = entry.value;
                                  String subtitle = category['title']!;
                                  String icon = category['icon']!;

                                  return Container(
                                    child: HomeCategoryCard(
                                      imageAsset: icon,
                                      title: subtitle,
                                      isSelected: _selectedCategoryIndex == index,
                                      onTap: () {
                                        setState(() {
                                          _selectedCategoryIndex = _selectedCategoryIndex == index ? null : index;
                                        });
                                        print('$subtitle tapped');
                                        _navigateToProjectPage(subtitle, widget.bucket_title, context);
                                      },
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Extra spacing for larger screens
                      if (isTablet || isDesktop)
                        SizedBox(height: Constants.getSpacingLarge(context)),
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