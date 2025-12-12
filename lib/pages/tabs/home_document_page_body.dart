import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/projects_list_titles.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/add_bucket_click_event.dart';

import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../widgets/presentation/list_of_documents_selection.dart';
import 'features/grid_view_project_card.dart';
import 'features/list_view_project_card.dart';

class HomeDocumentPageBody extends StatefulWidget {
  const HomeDocumentPageBody({super.key});

  @override
  State<HomeDocumentPageBody> createState() => _HomeDocumentPageBodyState();
}

class _HomeDocumentPageBodyState extends State<HomeDocumentPageBody> {
  bool _isGridView = false;
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 2),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.transparent, // Make it transparent
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Constants.fontLittle),
       child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            crossAxisAlignment: .center,
            children: [
              // Left: Title
              Flexible(
                // Use Flexible instead of fixed width
                child: Container(
                  constraints: BoxConstraints(maxWidth: 160),
                  child: Text(
                    'List of documents',
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.black87,
                    ),
                  ),
                ),
              ),

              // Right: Image + Divider + Add Button
              Flexible(
                // Use Flexible here too
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 140,
                  ), // Limit max width
                  child: Row(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    mainAxisSize: .min,
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
                          width: Constants.spacingHigh,
                          height: 18,
                          child: Image.asset(
                            _isGridView
                                ? Images.gridIcon
                                : Images.menuIcon,
                            width: Constants.spacingHigh,
                            height: 18,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      SizedBox(width: Constants.spacingSmall),

                      // Vertical Line Divider
                      Container(
                        width: 1,
                        height: Constants.fontLarge,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: CustomColors.blackBS1,
                              width: 1,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: Constants.spacingSmall),

                      // Add Bucket Button
                   Material(
                    color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () {
                          print('Context mounted: ${context.mounted}');
                          if (context.mounted) {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AddBucketClickEvent()
                                )
                            );
                          } else {
                            print('Context is not mounted!');
                          }
                        },
                        child: Container(
                          height: 36,
                          constraints: BoxConstraints(
                            maxWidth: 120,
                          ), // Reduced max width
                          // width: 140,
                          padding: EdgeInsets.symmetric(
                            horizontal: Constants.fontLittle,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: CustomColors.ghostWhite,
                            borderRadius:
                            BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: CustomColors.blackBS1,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: .min,
                            mainAxisAlignment: .center,
                            crossAxisAlignment: .center,
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
                                'Add Bucket',
                                style: TextStyle(
                                  fontFamily:
                                  Constants.primaryfont,
                                  fontSize: 10,
                                  fontWeight: .bold,
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

          // Row 2: "My documents of actual projects" text
          Container(
            width: double.infinity,
            //height: 26,
            child: Text(
              'My documents created',
              style: TextStyle(
                fontFamily: Constants.primaryfont,
                fontSize: Constants.fontLittle,
                fontWeight: .w500,
                color: CustomColors
                    .littleWhite, // Adjust color as needed
              ),
            ),
          ),

          SizedBox(height: Constants.spacingLittle),

          // // PROJECT CARDS - DYNAMIC LAYOUT BASED ON _isGridView
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
                      _expandedIndex = null; // Collapse if already expanded
                    } else {
                      _expandedIndex = index; // Expand this one
                    }
                  });
                },
                  onTap: (){
                    // Naviagate to respective page
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ListOfDocumentsSelection(
                            bucket_title: title
                        )
                    ));
                  }
              );
            }).toList(),
          ), // List layout before click
        ],
       ),
      ),
    );
  }
}
