import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/list_of_documents_selection.dart';

import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../widgets/presentation/add_bucket_click_event.dart';
import '../others/categories_data.dart';
import '../others/projects_list_titles.dart';
import 'features/grid_view_project_card.dart';
import 'features/home_category_card.dart';
import 'features/list_view_project_card.dart';
import 'features/upcoming_project_card.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  bool _isGridView = false;
  int? _expandedIndex;

  // Navigation method based on category title
  // void _navigateToProjectPage(String title, BuildContext context){
  //   switch(title){
  //     case 'Construction Villa Hazmi':
  //       break;
  //     case 'Values assets':
  //       break;
  //     case 'Construction Apartment Fahd':
  //       break;
  //     case 'Summer trip 2025':
  //       break;
  //     case 'MY TRIPS':
  //       break;
  //     default:
  //       print('No navigation defined for $title');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Constants.spacingSmall),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            // Your Scrollable content Containers here..
            Container(
              width: 400,
              height: 96,
              margin: EdgeInsets.only(bottom: Constants.spacingMedium),
              padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
              decoration: BoxDecoration(
                color: CustomColors.white, // rgba(251, 251, 251, 1)
                borderRadius: BorderRadius.circular(20), // 20px border radius
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.blackBS1, // Sybtle shadow
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .start,
                children: [
                  // Row 1: "Available Storage" and "34%"
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'Available Storage',
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontSize: Constants.fontSmall,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.littleWhite,
                        ),
                      ),
                      Text(
                        '34%',
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontSize: Constants.fontSmall,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.littleWhite,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: Constants.spacingSmall),

                  //STORAGE PROCESS BAR
                  Container(
                    width: 360,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: CustomColors.gradientBlue.withOpacity(0.8),
                    ),
                    child: Stack(
                      children: [
                        // Filled part with pink
                        Container(
                          width: 360 * 0.34, // 34% of 360px
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              colors: [
                                CustomColors.darkPink,
                                CustomColors.darkPink.withOpacity(0.8),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: Constants.spacingSmall), // gap: 8px
                  // "753 MB of 2 GB"
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '753 MB ',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Constants.fontSmall,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.littleWhite,
                          ),
                        ),
                        TextSpan(
                          text: 'of ',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Constants.fontSmall,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.littleWhite,
                          ),
                        ),
                        TextSpan(
                          text: '2 GB',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Constants.fontSmall,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.littleWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Advertisement Banner
            Container(
              width: 400,
              height: 148,
              margin: EdgeInsets.only(bottom: Constants.spacingMedium),
              child: ClipRRect(
                borderRadius: .circular(16),
                // Assuming same 16px radius as Container 1
                child: Stack(
                  children: [
                    // Advertisement Image
                    Image.asset(
                      Images.advertisement,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),

            // Horizontal Scrollable Cards Using ListView.builder
            Container(
              width: 400,
              height: 110,
              margin: EdgeInsets.only(bottom: Constants.spacingMedium),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: CategoriesData.categories.length,
                itemBuilder: (context, index) {
                  final category = CategoriesData.categories[index];
                  return Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 0 : 10,
                      right: index == CategoriesData.categories.length - 1
                          ? 20
                          : 0,
                    ),
                    child: HomeCategoryCard(
                      imageAsset:
                          category['icon']!, // Use bracket notation for Map
                      title: category['title']!,
                      onTap: () {}, // Use bracket notation for Map
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: Constants.spacingLittle),

            // Horizontal line
            Container(
              width: double.infinity,
              height: 1,
              color: CustomColors.littleWhite,
            ),

            SizedBox(height: Constants.spacingLittle),

            // Ongoing Projects and Buckets
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 2),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.transparent, // Make it transparent
                borderRadius: BorderRadius.circular(8),
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
                        // Use Flexible instead of fixed width
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 148),
                          child: Text(
                            'Ongoing Projects',
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
                                    print(
                                      'Context mounted: ${context.mounted}',
                                    );
                                    if (context.mounted) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AddBucketClickEvent(),
                                        ),
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
                                      borderRadius: BorderRadius.circular(6),
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
                                          width: Constants.spacingLittle,
                                        ),

                                        Text(
                                          'Add Bucket',
                                          style: TextStyle(
                                            fontFamily: Constants.primaryfont,
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
                      'My documents of actual projects',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.fontLittle,
                        fontWeight: .w500,
                        color:
                            CustomColors.littleWhite, // Adjust color as needed
                      ),
                    ),
                  ),

                  SizedBox(height: Constants.spacingLittle),

                  // // PROJECT CARDS - DYNAMIC LAYOUT BASED ON _isGridView
                  _isGridView
                      ? GridViewProjectCard() // Grid Layout after click
                      : Column(
                          children: ProjectsListTitles.projects
                              .asMap()
                              .entries
                              .map((entry) {
                                final index = entry.key;
                                Map<String, String> project = entry.value;
                                String title = project['title']!;

                                return ListViewProjectCard(
                                  project: project,
                                  isExpanded: _expandedIndex == index,
                                  onToggle: () {
                                    setState(() {
                                      if (_expandedIndex == index) {
                                        _expandedIndex =
                                            null; // Collapse if already expanded
                                      } else {
                                        _expandedIndex =
                                            index; // Expand this one
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
                              })
                              .toList(),
                        ), // List layout before click, // List layout before click
                ],
              ),
            ),

            SizedBox(height: Constants.spacingSmall),

            //Horizontal line
            Container(
              width: double.infinity,
              height: 1,
              color: CustomColors.littleWhite,
            ),

            SizedBox(height: Constants.spacingLittle),

            // Upcoming Milestones and Sub Containers
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 2),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
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
                        // Use Flexible instead of Fixed width
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 184),
                          child: Text(
                            'Upcoming Milestones',
                            style: TextStyle(
                              fontFamily: Constants.primaryfont,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Row 2: "Your next milestones to follow Your project" text
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Your next milestones to follow Your project',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.fontLittle,
                        fontWeight: .w500,
                        color: CustomColors.littleWhite,
                      ),
                    ),
                  ),

                  SizedBox(height: Constants.spacingLittle),

                  UpcomingProjectCard(),

                  SizedBox(height: Constants.spacingLittle),
                ],
              ),
            ),

            SizedBox(height: Constants.spacingLittle),

            //Horizontal line
            Container(
              width: double.infinity,
              height: 1,
              color: CustomColors.littleWhite,
            ),

            SizedBox(height: Constants.spacingLittle),

            // Payment Alerts and Sub Container
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 2),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
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
                        // Use Flexible instead of Fixed width
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 184),
                          child: Text(
                            'Payment Alerts',
                            style: TextStyle(
                              fontFamily: Constants.primaryfont,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: double.infinity,
                    child: Text(
                      'You don’t miss your next payment',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.fontLittle,
                        fontWeight: .w500,
                        color: CustomColors.littleWhite,
                      ),
                    ),
                  ),

                  SizedBox(height: Constants.spacingLittle),

                  Container(
                    width: 400,
                    height: 140,
                    margin: EdgeInsets.only(bottom: Constants.spacingMedium),
                    padding: EdgeInsets.all(Constants.spacingSmall),
                    decoration: BoxDecoration(
                      color: CustomColors.ghostWhite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: CustomColors.blackBS1,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ROW 1: Payment Header with Date
                        Container(
                          width: 360, // width: 360px
                          height: 36, // height: 36px
                          margin: EdgeInsets.only(
                            bottom: Constants.spacingSmall,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left: Payment Button
                              Container(
                                width: 73,
                                height: 36,
                                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                decoration: BoxDecoration(
                                  color: CustomColors.littleWhite,
                                  borderRadius: .circular(40),
                                ),
                                child: Center(
                                  child: Text(
                                    'Payment',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.fontLittle,
                                      fontWeight: .bold,
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                ),
                              ),

                              // Right: Next + Date
                              Container(
                                width: 156,
                                height: 26,
                                child: Row(
                                  children: [
                                    // "Next" Text
                                    Container(
                                      width: 40, // Approximate width for "Next"
                                      height: Constants.fontMedium,
                                      child: Text(
                                        'Next',
                                        style: TextStyle(
                                          fontFamily: Constants.primaryfont,
                                          fontSize: 14,
                                          fontWeight: .bold,
                                          color: CustomColors.darkPink,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: Constants.spacingLittle),

                                    // Date Text
                                    Container(
                                      width: 108,
                                      height: 26,
                                      child: Text(
                                        '11 August 2025',
                                        style: TextStyle(
                                          fontFamily: Constants.primaryfont,
                                          fontSize: 14,
                                          fontWeight:
                                              FontWeight.w400, // Regular
                                          color: Color(
                                            0xFF34362D,
                                          ), // Grey color
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Row 2: Payment Details Card
                        Container(
                          width: 360,
                          height: 54,
                          padding: EdgeInsets.all(Constants.spacingSmall),
                          decoration: BoxDecoration(
                            color: CustomColors.ghostWhite,
                            borderRadius: BorderRadius.circular(
                              Constants.spacingSmall,
                            ),
                            border: Border.all(
                              color: CustomColors.blackBS1,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              // Left: Payment Title
                              Container(
                                width: 156,
                                height: Constants.fontLarge,
                                child: Text(
                                  'Design and Planning',
                                  style: TextStyle(
                                    fontFamily: Constants.primaryfont,
                                    fontSize: Constants.fontSmall,
                                    fontWeight: .bold,
                                    color: CustomColors.black87,
                                  ),
                                ),
                              ),

                              SizedBox(width: Constants.spacingSmall),

                              // Right: Amount + Icon
                              Row(
                                children: [
                                  //Icon
                                  Container(
                                    width: Constants.fontMedium,
                                    height: Constants.fontMedium,
                                    child: Image.asset(
                                      Images.circlepercentIcon,
                                      width: Constants.fontMedium,
                                      height: Constants.fontMedium,
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  // Amount Text
                                  Container(
                                    width: 98,
                                    height: Constants.fontMedium,
                                    margin: EdgeInsets.only(
                                      right: Constants.spacingSmall,
                                    ),
                                    child: Text(
                                      '25,000 Kd (30%)',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontSize: 13,
                                        color: CustomColors.black87,
                                      ),
                                    ),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
