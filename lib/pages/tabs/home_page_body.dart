import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/list_of_documents_selection.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/responsive_media_query.dart';
import '../../widgets/presentation/add_bucket_click_event.dart';
import '../others/categories_data.dart';
import '../others/projects_list_titles.dart';
import 'features/grid_view_project_card.dart';
import 'features/home_category_card.dart';
import 'features/list_view_project_card.dart';
import 'features/upcoming_project_card.dart';

class HomePageBody extends StatefulWidget {
  final bool isCommercial;

  HomePageBody({super.key, required this.isCommercial});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  bool _isGridView = false;
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants
    Constants.updateFromContext(context);

    // Responsive widths
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

    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: containerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Storage Container
            Container(
              width: mainWidth,
              height: Responsive.value<double>(
                context,
                mobile: 96,
                tablet: 100,
                desktop: 104,
              ),
              margin: EdgeInsets.only(
                bottom: Constants.getSpacingMedium(context),
              ),
              padding: EdgeInsets.fromLTRB(
                Responsive.value<double>(
                  context,
                  mobile: 20,
                  tablet: 22,
                  desktop: 24,
                ),
                Responsive.value<double>(
                  context,
                  mobile: 13,
                  tablet: 14,
                  desktop: 15,
                ),
                Responsive.value<double>(
                  context,
                  mobile: 20,
                  tablet: 22,
                  desktop: 24,
                ),
                Responsive.value<double>(
                  context,
                  mobile: 13,
                  tablet: 14,
                  desktop: 15,
                ),
              ),
              decoration: BoxDecoration(
                color: CustomColors.white,
                borderRadius: BorderRadius.circular(
                  Responsive.value<double>(
                    context,
                    mobile: 20,
                    tablet: 22,
                    desktop: 24,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row 1: "Available Storage" and "34%"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Available Storage',
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontSize: Constants.getFontSmall(context),
                          fontWeight: FontWeight.bold,
                          color: CustomColors.littleWhite,
                        ),
                      ),
                      Text(
                        '34%',
                        style: TextStyle(
                          fontFamily: Constants.primaryfont,
                          fontSize: Constants.getFontSmall(context),
                          fontWeight: FontWeight.bold,
                          color: CustomColors.littleWhite,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: Constants.getSpacingSmall(context)),

                  // STORAGE PROGRESS BAR
                  Container(
                    width: mainWidth - 40,
                    height: Responsive.value<double>(
                      context,
                      mobile: 8,
                      tablet: 9,
                      desktop: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Responsive.value<double>(
                          context,
                          mobile: 8,
                          tablet: 9,
                          desktop: 10,
                        ),
                      ),
                      color: CustomColors.gradientBlue.withOpacity(0.8),
                    ),
                    child: Stack(
                      children: [
                        // Filled part with pink
                        Container(
                          width: (mainWidth - 40) * 0.34,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Responsive.value<double>(
                                context,
                                mobile: 8,
                                tablet: 9,
                                desktop: 10,
                              ),
                            ),
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

                  SizedBox(height: Constants.getSpacingSmall(context)),

                  // "753 MB of 2 GB"
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '753 MB ',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Constants.getFontSmall(context),
                            fontWeight: FontWeight.bold,
                            color: CustomColors.littleWhite,
                          ),
                        ),
                        TextSpan(
                          text: 'of ',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Constants.getFontSmall(context),
                            fontWeight: FontWeight.w500,
                            color: CustomColors.littleWhite,
                          ),
                        ),
                        TextSpan(
                          text: '2 GB',
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Constants.getFontSmall(context),
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
              width: mainWidth,
              height: Responsive.value<double>(
                context,
                mobile: 160,
                tablet: 172,
                desktop: 184,
              ),
              margin: EdgeInsets.only(
                bottom: Constants.getSpacingMedium(context),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  Responsive.value<double>(
                    context,
                    mobile: 16,
                    tablet: 18,
                    desktop: 20,
                  ),
                ),
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
              width: mainWidth,
              height: Responsive.value<double>(
                context,
                mobile: 120,
                tablet: 130,
                desktop: 140,
              ),
              margin: EdgeInsets.only(
                bottom: Constants.getSpacingMedium(context),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: CategoriesData.categories.length,
                itemBuilder: (context, index) {
                  final category = CategoriesData.categories[index];
                  return Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 0 : Constants.getSpacingSmall(context),
                      right: index == CategoriesData.categories.length - 1
                          ? Constants.getSpacingMedium(context)
                          : 0,
                    ),
                    child: HomeCategoryCard(
                      imageAsset: category['icon']!,
                      title: category['title']!,
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: Constants.getSpacingLittle(context)),

            // Horizontal line
            Container(
              width: double.infinity,
              height: 1,
              color: CustomColors.littleWhite.withOpacity(0.5),
            ),

            SizedBox(height: Constants.getSpacingSmall(context)),

            // Ongoing Projects and Buckets
            Container(
              width: double.infinity,
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
                            maxWidth: Responsive.value<double>(
                              context,
                              mobile: 164,
                              tablet: 172,
                              desktop: 184,
                            ),
                          ),
                          child: Text(
                            'Ongoing Projects',
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

                              SizedBox(
                                width: Constants.getSpacingSmall(context),
                              ),

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

                              SizedBox(
                                width: Constants.getSpacingSmall(context),
                              ),

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
                                      horizontal: Constants.getFontLittle(
                                        context,
                                      ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: Constants.getFontSmall(
                                            context,
                                          ),
                                          height: Constants.getFontSmall(
                                            context,
                                          ),
                                          child: Image.asset(
                                            Images.plusIcon,
                                            fit: BoxFit.contain,
                                          ),
                                        ),

                                        SizedBox(
                                          width: Constants.getSpacingLittle(
                                            context,
                                          ),
                                        ),

                                        Text(
                                          'Add Bucket',
                                          style: TextStyle(
                                            fontFamily: Constants.primaryfont,
                                            fontSize: Constants.getFontLittle(
                                              context,
                                            ),
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

                  // Row 2: "My documents of actual projects" text
                  Container(
                    width: double.infinity,
                    child: Text(
                      ' My documents of actual projects',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.getFontLittle(context),
                        fontWeight: FontWeight.w500,
                        color: CustomColors.littleWhite,
                      ),
                    ),
                  ),

                  SizedBox(height: Constants.getSpacingSmall(context)),

                  // PROJECT CARDS - DYNAMIC LAYOUT BASED ON _isGridView
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
                                        builder: (context) =>
                                            ListOfDocumentsSelection(
                                              isCommercial: widget.isCommercial,
                                              bucket_title: title,
                                            ),
                                      ),
                                    );
                                  },
                                );
                              })
                              .toList(),
                        ),
                ],
              ),
            ),

            SizedBox(height: Constants.getSpacingSmall(context)),

            // Horizontal line
            Container(
              width: double.infinity,
              height: 1,
              color: CustomColors.littleWhite.withOpacity(0.5),
            ),

            SizedBox(height: Constants.getSpacingSmall(context)),

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
                              mobile: 208,
                              tablet: 216,
                              desktop: 224,
                            ),
                          ),
                          child: Text(
                            'Upcoming Milestones',
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
                    ],
                  ),

                  // Row 2: "Your next milestones to follow Your project" text
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Your next milestones to follow Your project',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.getFontLittle(context),
                        fontWeight: FontWeight.w500,
                        color: CustomColors.littleWhite,
                      ),
                    ),
                  ),

                  SizedBox(height: Constants.getSpacingLittle(context)),

                  UpcomingProjectCard(),

                  SizedBox(height: Constants.getSpacingLittle(context)),
                ],
              ),
            ),

            SizedBox(height: Constants.getSpacingLittle(context)),

            // Horizontal line
            Container(
              width: double.infinity,
              height: 1,
              color: CustomColors.littleWhite.withOpacity(0.5),
            ),

            SizedBox(height: Constants.getSpacingLittle(context)),

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
                              mobile: 184,
                              tablet: 200,
                              desktop: 216,
                            ),
                          ),
                          child: Text(
                            'Payment Alerts',
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
                    ],
                  ),

                  Container(
                    width: double.infinity,
                    child: Text(
                      'You don\'t miss your next payment',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: Constants.getFontLittle(context),
                        fontWeight: FontWeight.w500,
                        color: CustomColors.littleWhite,
                      ),
                    ),
                  ),

                  SizedBox(height: Constants.getSpacingLittle(context)),

                  Container(
                    width: mainWidth,
                    height: Responsive.value<double>(
                      context,
                      mobile: 120,
                      tablet: 130,
                      desktop: 140,
                    ),
                    margin: EdgeInsets.only(
                      bottom: Constants.getSpacingMedium(context),
                    ),
                    padding: EdgeInsets.all(Constants.getSpacingSmall(context)),
                    decoration: BoxDecoration(
                      color: CustomColors.ghostWhite,
                      borderRadius: BorderRadius.circular(
                        Responsive.value<double>(
                          context,
                          mobile: 10,
                          tablet: 12,
                          desktop: 14,
                        ),
                      ),
                      border: Border.all(
                        color: CustomColors.blackBS1,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ROW 1: Payment Header with Date
                        Container(
                          width: mainWidth - 40,
                          height: Responsive.value<double>(
                            context,
                            mobile: 36,
                            tablet: 38,
                            desktop: 40,
                          ),
                          margin: EdgeInsets.only(
                            bottom: Constants.getSpacingSmall(context),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left: Payment Button
                              Container(
                                width: Responsive.value<double>(
                                  context,
                                  mobile: 73,
                                  tablet: 77,
                                  desktop: 81,
                                ),
                                height: Responsive.value<double>(
                                  context,
                                  mobile: 36,
                                  tablet: 38,
                                  desktop: 40,
                                ),
                                padding: EdgeInsets.fromLTRB(
                                  Responsive.value<double>(
                                    context,
                                    mobile: 8,
                                    tablet: 9,
                                    desktop: 10,
                                  ),
                                  Responsive.value<double>(
                                    context,
                                    mobile: 4,
                                    tablet: 5,
                                    desktop: 6,
                                  ),
                                  Responsive.value<double>(
                                    context,
                                    mobile: 8,
                                    tablet: 9,
                                    desktop: 10,
                                  ),
                                  Responsive.value<double>(
                                    context,
                                    mobile: 4,
                                    tablet: 5,
                                    desktop: 6,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: CustomColors.littleWhite,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Center(
                                  child: Text(
                                    'Payment',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.getFontLittle(
                                        context,
                                      ),
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                ),
                              ),

                              // Right: Next + Date
                              Container(
                                width: Responsive.value<double>(
                                  context,
                                  mobile: 156,
                                  tablet: 164,
                                  desktop: 172,
                                ),
                                height: Responsive.value<double>(
                                  context,
                                  mobile: 26,
                                  tablet: 28,
                                  desktop: 30,
                                ),
                                child: Row(
                                  children: [
                                    // "Next" Text
                                    Container(
                                      width: Responsive.value<double>(
                                        context,
                                        mobile: 40,
                                        tablet: 42,
                                        desktop: 44,
                                      ),
                                      height: Constants.getFontMedium(context),
                                      child: Text(
                                        'Next',
                                        style: TextStyle(
                                          fontFamily: Constants.primaryfont,
                                          fontSize: Responsive.value<double>(
                                            context,
                                            mobile: 14,
                                            tablet: 15,
                                            desktop: 16,
                                          ),
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.darkPink,
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: Constants.getSpacingLittle(
                                        context,
                                      ),
                                    ),

                                    // Date Text
                                    Container(
                                      width: Responsive.value<double>(
                                        context,
                                        mobile: 108,
                                        tablet: 114,
                                        desktop: 120,
                                      ),
                                      height: Responsive.value<double>(
                                        context,
                                        mobile: 26,
                                        tablet: 28,
                                        desktop: 30,
                                      ),
                                      child: Text(
                                        '11 August 2025',
                                        style: TextStyle(
                                          fontFamily: Constants.primaryfont,
                                          fontSize: Responsive.value<double>(
                                            context,
                                            mobile: 14,
                                            tablet: 15,
                                            desktop: 16,
                                          ),
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF34362D),
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
                          width: mainWidth - 40,
                          height: Responsive.value<double>(
                            context,
                            mobile: 54,
                            tablet: 58,
                            desktop: 62,
                          ),
                          padding: EdgeInsets.all(
                            Constants.getSpacingSmall(context),
                          ),
                          decoration: BoxDecoration(
                            color: CustomColors.ghostWhite,
                            borderRadius: BorderRadius.circular(
                              Constants.getSpacingSmall(context),
                            ),
                            border: Border.all(
                              color: CustomColors.blackBS1,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left: Payment Title
                              Container(
                                width: Responsive.value<double>(
                                  context,
                                  mobile: 156,
                                  tablet: 164,
                                  desktop: 172,
                                ),
                                height: Constants.getFontLarge(context),
                                child: Text(
                                  'Design and Planning',
                                  style: TextStyle(
                                    fontFamily: Constants.primaryfont,
                                    fontSize: Constants.getFontSmall(context),
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.black87,
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: Constants.getSpacingSmall(context),
                              ),

                              // Right: Amount + Icon
                              Row(
                                children: [
                                  // Icon
                                  Container(
                                    width: Constants.getFontMedium(context),
                                    height: Constants.getFontMedium(context),
                                    child: Image.asset(
                                      Images.circlepercentIcon,
                                      width: Constants.getFontMedium(context),
                                      height: Constants.getFontMedium(context),
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  // Amount Text
                                  Container(
                                    width: Responsive.value<double>(
                                      context,
                                      mobile: 98,
                                      tablet: 104,
                                      desktop: 110,
                                    ),
                                    height: Constants.getFontMedium(context),
                                    margin: EdgeInsets.only(
                                      right: Constants.getSpacingSmall(context),
                                    ),
                                    child: Text(
                                      '25,000 Kd (30%)',
                                      style: TextStyle(
                                        fontFamily: Constants.primaryfont,
                                        fontSize: Responsive.value<double>(
                                          context,
                                          mobile: 13,
                                          tablet: 14,
                                          desktop: 15,
                                        ),
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

            // Extra bottom spacing for larger screens
            if (isTablet || isDesktop)
              SizedBox(height: Constants.getSpacingLarge(context)),
          ],
        ),
      ),
    );
  }
}
