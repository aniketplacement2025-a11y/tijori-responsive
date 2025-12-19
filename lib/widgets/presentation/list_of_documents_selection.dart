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

  ListOfDocumentsSelection({
    super.key,
    required this.bucket_title,
  });

  @override
  State<ListOfDocumentsSelection> createState() => _ListOfDocumentsSelectionState();
}

class _ListOfDocumentsSelectionState extends State<ListOfDocumentsSelection> {

  int? _selectedCategoryIndex; // Track selected Category index
  TextEditingController controller = TextEditingController();


  // Navigation method based on category title
  void _navigateToProjectPage(String subtitle, String title ,BuildContext context){
    switch(subtitle){
      case 'CONTRACTS':
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => AfterListedDocumentContractSelection(
              subtitle: subtitle,
              title: title,
            )
          ), );
        break;
      case 'WARRANTIES':
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => AfterListedDocumentWarrantiesSelection(
              subtitle: subtitle,
              title: title,
            )
        ), );
        break;
      case 'INSURANCE':
        break;
      case 'PERSONAL DOC':
        break;
      case 'MY TRIPS':
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => AfterListedDocumentMyTripsSelection(
                title: title,
                subtitle: subtitle,
                ),
            ), );
        break;
      case 'Appointments':
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => AfterListedDocumentAppointmentsSelection(
            title: title,
            subtitle: subtitle,
          ),
        ), );
        break;
      case 'My Medicine':
         Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) => AfterListedDocumentMyMedicinesSelection(
               title: title,
               subtitle: subtitle,
             ),
           ),);
        break;
      default:
        print('No navigation defined for $title');
    }
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

            Positioned(
              top:72,
              left: 10,
              right: 10,
              child: Container(
                alignment: .center,
                height: 112,
                padding: EdgeInsets.only(
                  top: 20,
                  right: 10,
                  bottom: 20,
                  left: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: .circular(16),
                  border: Border.all(
                    color: CustomColors.black87,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [

                    // Row 1: Bucket name with icon
                    SizedBox(
                      width: 350,
                      height: 22,
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [

                          SizedBox(width: Constants.spacingLittle),

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
                        ],
                      ),
                    ),

                    SizedBox(height: Constants.spacingSmall),

                    // Row 2: Type
                    SizedBox(
                      width: 320,
                      height: 20,
                      child:
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${widget.bucket_title}',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),),
                    ),
                  ],
                ),
              ),
            ),



                   Positioned(
                      top: 188,
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

                              // Text and New Category Button
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
                                      crossAxisAlignment: .center,
                                      children: [

                                        // Left: Title
                                        Flexible(
                                          // 'What do you want to add to this Bucket?' Text
                                          child: Text(
                                            'What do you want to add to this Bucket?',
                                            style: TextStyle(
                                              fontFamily: Constants.primaryfont,
                                              fontSize: Constants.fontLittle,
                                              color: CustomColors.black87,
                                              // Adjust color as needed
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: Constants.spacingSmall),

                                        // Add New Category
                                        Material(
                                          color: Colors.transparent,
                                          child: GestureDetector(
                                            onTap: (){
                                              print(" Clicked on Add New Bucket");
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                backgroundColor: Colors.transparent,
                                                builder: (context) {
                                                  return AddNewCategoryResponse(
                                                    onComplete: () {
                                                      Navigator.pop(
                                                        context,
                                                      ); // Close the dialog
                                                      Navigator.push(context,
                                                       MaterialPageRoute(builder:
                                                       (context) => AddNewCategoryClickEvent()
                                                      ));
                                                    }, controller: controller,
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: 36,
                                              constraints: BoxConstraints(
                                                maxWidth: 150,
                                              ), // Reduced max width
                                              padding: EdgeInsets.symmetric(
                                                horizontal: Constants.fontLittle,
                                                vertical: Constants.spacingLittle,
                                              ),
                                              decoration: BoxDecoration(
                                                color: CustomColors.ghostWhite,
                                                borderRadius: BorderRadius.circular(Constants.spacingLittle),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: CustomColors.blackBS1,
                                                    blurRadius: 4,
                                                    offset: Offset(0, 2),
                                                  ),
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment: .center,
                                                mainAxisSize: .min,
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
                                                    width: Constants.spacingLittle,
                                                  ),

                                                  Text(
                                                    'Add New Category',
                                                    style: TextStyle(
                                                      fontFamily: Constants.primaryfont,
                                                      fontSize: Constants.spacingSmall,
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

                                    // Vertical Scrollable Cards Using GridView.builder
                                    Container(
                                      width: 400,
                                      height: 480,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: Constants.spacingLittle,
                                        vertical: Constants.spacingLittle,
                                      ),
                                      child: GridView.count(
                                        crossAxisCount: 2, // 2 Items per Row
                                        crossAxisSpacing: Constants.spacingSmall,
                                        mainAxisSpacing: Constants.spacingSmall,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        childAspectRatio: 194/108,
                                        children: CategoriesData.
                                        categories.asMap().entries.map((entry){
                                          int index = entry.key;
                                          Map<String, String> category = entry.value;
                                          String subtitle = category['title']!;
                                          String icon = category['icon']!;

                                          return Container(
                                            child: HomeCategoryCard(
                                              imageAsset: icon, // Use bracket notation for Map
                                              title: subtitle,
                                              isSelected: _selectedCategoryIndex == index, // Pass selection state
                                              onTap: (){
                                                setState(() {
                                                  // Toggle selection - if already selected, deselect
                                                  _selectedCategoryIndex = _selectedCategoryIndex == index ? null : index;
                                                });
                                                print('$subtitle tapped');

                                                // Naviagate to respective page
                                                _navigateToProjectPage(subtitle, widget.bucket_title , context);
                                              },
                                            ),
                                          );
                                        }).toList(),
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
}
