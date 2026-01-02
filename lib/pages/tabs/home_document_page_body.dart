import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/projects_list_titles.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/add_bucket_click_event.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';
import '../../widgets/presentation/list_of_documents_selection.dart';
import 'features/grid_view_project_card.dart';
import 'features/list_view_project_card.dart';

class HomeDocumentPageBody extends StatefulWidget {
  final bool isCommercial;
  HomeDocumentPageBody({
    super.key,
    required this.isCommercial,
  });

  @override
  State<HomeDocumentPageBody> createState() => _HomeDocumentPageBodyState();
}

class _HomeDocumentPageBodyState extends State<HomeDocumentPageBody> {
  bool _isGridView = false;
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants
    Constants.updateFromContext(context);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 2),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.value<double>(
            context,
            mobile: Constants.getFontLittle(context),
            tablet: Constants.getSpacingSmall(context),
            desktop: Constants.getSpacingMedium(context),
          ),
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
                      maxWidth: Responsive.value<double>(
                        context,
                        mobile: 172,
                        tablet: 184,
                        desktop: 196,
                      ),
                    ),
                    child: Text(
                      'List of documents',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Responsive.value<double>(
                          context,
                          mobile: 20,
                          tablet: 22,
                          desktop: 24,
                        ),
                        fontWeight: FontWeight.bold,
                        color: CustomColors.black87,
                      ),
                    ),
                  ),
                ),

                // Right: Image + Divider + Add Button
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: Responsive.value<double>(
                        context,
                        mobile: 164,
                        tablet: 172,
                        desktop: 184,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Menu Image
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isGridView = !_isGridView;
                            });
                            print(
                              _isGridView
                                  ? 'Switched to Grid View'
                                  : 'Switched to List View',
                            );
                          },
                          child: Container(
                            width: Constants.getSpacingHigh(context),
                            height: Responsive.value<double>(
                              context,
                              mobile: 24,
                              tablet: 28,
                              desktop: 32,
                            ),
                            child: Image.asset(
                              _isGridView
                                  ? Images.gridIcon
                                  : Images.menuIcon,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        SizedBox(width: Constants.getSpacingSmall(context)),

                        // Vertical Line Divider
                        Container(
                          width: 1,
                          height: Constants.getFontLarge(context),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: CustomColors.blackBS1,
                                width: 1,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: Constants.getSpacingSmall(context)),

                        // Add Bucket Button
                        Material(
                          color: Colors.transparent,
                          child: GestureDetector(
                            onTap: () {
                              print('Context mounted: ${context.mounted}');
                              if (context.mounted) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AddBucketClickEvent(),
                                  ),
                                );
                              } else {
                                print('Context is not mounted!');
                              }
                            },
                            child: Container(
                              height: Responsive.value<double>(
                                context,
                                mobile: 40,
                                tablet: 42,
                                desktop: 44,
                              ),
                              constraints: BoxConstraints(
                                maxWidth: Responsive.value<double>(
                                  context,
                                  mobile: 130,
                                  tablet: 140,
                                  desktop: 150,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: Constants.getFontLittle(context),
                                vertical: Responsive.value<double>(
                                  context,
                                  mobile: 6,
                                  tablet: 7,
                                  desktop: 8,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: CustomColors.ghostWhite,
                                borderRadius: BorderRadius.circular(
                                  Responsive.value<double>(
                                    context,
                                    mobile: 6,
                                    tablet: 7,
                                    desktop: 8,
                                  ),
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
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Constants.getFontSmall(context),
                                    height: Constants.getFontSmall(context),
                                    child: Image.asset(
                                      Images.plusIcon,
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  SizedBox(width: Constants.getSpacingLittle(context)),

                                  Text(
                                    'Add Bucket',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.getFontLittle(context),
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
              ],
            ),

            // Row 2: "My documents created" text
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: Responsive.value<double>(
                  context,
                  mobile: 4,
                  tablet: 6,
                  desktop: 8,
                ),
              ),
              child: Text(
                'My documents created',
                style: TextStyle(
                  fontFamily: Constants.primaryfont,
                  fontSize: Constants.getFontLittle(context),
                  fontWeight: FontWeight.w500,
                  color: CustomColors.littleWhite,
                ),
              ),
            ),

            SizedBox(height: Constants.getSpacingMedium(context)),

            // PROJECT CARDS - DYNAMIC LAYOUT BASED ON _isGridView
            _isGridView
                ? GridViewProjectCard() // Grid Layout after click
                : Column(
              children: ProjectsListTitles.projects.asMap().entries.map((entry) {
                final index = entry.key;
                final project = entry.value;
                String title = project['title']!;

                return ListViewProjectCard(
                  project: project,
                  isExpanded: _expandedIndex == index,
                  onToggle: () {
                    setState(() {
                      if (_expandedIndex == index) {
                        _expandedIndex = null;
                      } else {
                        _expandedIndex = index;
                      }
                    });
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListOfDocumentsSelection(
                          isCommercial: widget.isCommercial,
                          bucket_title: title,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            // Extra bottom spacing for larger screens
            if (isTablet || isDesktop)
              SizedBox(height: Constants.getSpacingLarge(context) * 2),
          ],
        ),
      ),
    );
  }
}