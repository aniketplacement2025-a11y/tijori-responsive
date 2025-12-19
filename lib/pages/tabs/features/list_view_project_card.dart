import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/projects_list_titles.dart';
import 'package:vkaps_it_solution_project_tijori/utils/Images.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/contract_page_after_document.dart';

class ListViewProjectCard extends StatefulWidget {
  final Map<String, String> project;
  final bool isExpanded;
  final VoidCallback onToggle;
  final VoidCallback onTap;

  const ListViewProjectCard({
    super.key,
    required this.project,
    required this.onToggle,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  State<ListViewProjectCard> createState() => _ListViewProjectCardState();
}

class _ListViewProjectCardState extends State<ListViewProjectCard> {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // Update constants
    Constants.updateFromContext(context);

    final double cardWidth = Responsive.value<double>(
      context,
      mobile: 400,
      tablet: 450,
      desktop: 500,
    );

    // FIXED: Use finite heights for both states
    final double collapsedHeight = Responsive.value<double>(
      context,
      mobile: 56,
      tablet: 60,
      desktop: 64,
    );

    // FIXED: Use finite expanded height instead of null
    final double expandedHeight = Responsive.value<double>(
      context,
      mobile: 280,
      tablet: 300,
      desktop: 320,
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: cardWidth,
      height: widget.isExpanded ? expandedHeight : collapsedHeight,
      margin: EdgeInsets.only(bottom: Constants.getSpacingSmall(context)),
      padding: EdgeInsets.all(
        Responsive.value<double>(
          context,
          mobile: Constants.getFontLittle(context),
          tablet: Constants.getFontLittle(context) * 1.1,
          desktop: Constants.getFontLittle(context) * 1.2,
        ),
      ),
      decoration: BoxDecoration(
        color: widget.isExpanded
            ? CustomColors.gradientBlue
            : CustomColors.ghostWhite,
        borderRadius: BorderRadius.circular(
          Responsive.value<double>(
            context,
            mobile: Constants.getSpacingMedium(context),
            tablet: Constants.getSpacingMedium(context) * 1.1,
            desktop: Constants.getSpacingMedium(context) * 1.2,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.blackBS1,
            blurRadius: Responsive.value<double>(
              context,
              mobile: 1,
              tablet: 1.5,
              desktop: 2,
            ),
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(), // Prevent inner scrolling
        child: Column(
          mainAxisSize: MainAxisSize.min, // FIXED: Use min to fit content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row: Title with icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side: Icon + Title
                Row(
                  children: [
                    // Icon
                    Container(
                      width: Constants.getSpacingHigh(context),
                      height: Responsive.value<double>(
                        context,
                        mobile: 30,
                        tablet: 32,
                        desktop: 34,
                      ),
                      child: Image.asset(
                        Images.projectIcon,
                        width: Constants.getSpacingHigh(context),
                        height: Constants.getSpacingHigh(context),
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(width: Constants.getSpacingSmall(context)),

                    // Title
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: Responsive.value<double>(
                            context,
                            mobile: 200,
                            tablet: 220,
                            desktop: 240,
                          ),
                        ),
                        child: Text(
                          widget.project['title']!,
                          style: TextStyle(
                            fontFamily: Constants.primaryfont,
                            fontSize: Responsive.value<double>(
                              context,
                              mobile: 14,
                              tablet: 15,
                              desktop: 16,
                            ),
                            fontWeight: FontWeight.bold,
                            color: CustomColors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),

                // Right Side: Two Icons
                Row(
                  children: [
                    GestureDetector(
                      onTap: widget.onToggle,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: Transform.rotate(
                          angle: widget.isExpanded
                              ? 180 * (3.1415926535 / 180)
                              : 0,
                          child: Container(
                            width: Constants.getSpacingHigh(context),
                            height: Constants.getSpacingHigh(context),
                            child: Image.asset(
                              Images.bottomarrowIcon,
                              width: Constants.getSpacingHigh(context),
                              height: Constants.getSpacingHigh(context),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: Constants.getSpacingLittle(context)),

                    // Second icon
                    Container(
                      width: Constants.getSpacingHigh(context),
                      height: Constants.getSpacingHigh(context),
                      child: Image.asset(
                        Images.menudotIcon,
                        width: Constants.getSpacingHigh(context),
                        height: Constants.getSpacingHigh(context),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Expanded Content (shown when expanded)
            if (widget.isExpanded) ...[
              SizedBox(height: Constants.getSpacingSmall(context)),

              // Main content container with white background
              Container(
                width: cardWidth - 20,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      CustomColors.ghostWhite,
                      CustomColors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(
                    Responsive.value<double>(
                      context,
                      mobile: Constants.getFontLittle(context),
                      tablet: Constants.getFontLittle(context) * 1.1,
                      desktop: Constants.getFontLittle(context) * 1.2,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    Responsive.value<double>(
                      context,
                      mobile: 8,
                      tablet: 10,
                      desktop: 12,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // FIXED: Use min
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Contracts Section
                      _buildContractsSection(context),

                      SizedBox(height: Constants.getSpacingLittle(context)),

                      // Divider
                      Container(
                        width: cardWidth - 40,
                        height: 1,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                      ),

                      SizedBox(height: Constants.getSpacingLittle(context)),

                      // Warranties Section
                      _buildWarrantiesSection(context),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildContractsSection(BuildContext context) {
    final double sectionWidth = Responsive.value<double>(
      context,
      mobile: 360,
      tablet: 380,
      desktop: 400,
    );

    return Container(
      width: sectionWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min, // FIXED: Use min
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row a: Title + Close icon
          SizedBox(
            width: sectionWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Contracts Text
                Text(
                  'Contracts',
                  style: TextStyle(
                    fontFamily: Constants.primaryfont,
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.getFontSmall(context),
                    color: CustomColors.darkPink,
                  ),
                ),

                // Close icon (pink)
                Container(
                  width: Constants.getFontSmall(context),
                  height: Constants.getFontSmall(context),
                  child: Icon(
                    Icons.close,
                    size: Constants.getFontSmall(context),
                    color: CustomColors.darkPink,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: Constants.getSpacingLittle(context)),

          // Row 2: Contract item with icons
          SizedBox(
            width: sectionWidth - 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Start icon
                Container(
                  width: Constants.getFontSmall(context),
                  height: Constants.getFontSmall(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Responsive.value<double>(
                        context,
                        mobile: 4,
                        tablet: 5,
                        desktop: 6,
                      ),
                    ),
                  ),
                  child: Icon(
                    Icons.description,
                    color: CustomColors.black87,
                    size: Constants.getFontSmall(context),
                  ),
                ),

                SizedBox(width: Constants.getSpacingLittle(context)),

                // Contract title
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Contact construction Villa Hazmi',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.getFontLittle(context),
                        color: CustomColors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                // End Icon
                GestureDetector(
                  onTap: () {
                    print("Arrow icon tapped");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContractPageAfterDocument(),
                      ),
                    );
                  },
                  child: Container(
                    width: Constants.getFontMedium(context),
                    height: Constants.getFontMedium(context),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: Constants.getFontSmall(context),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: Constants.getSpacingSmall(context)),

          // Row c: Remaining days
          SizedBox(
            width: sectionWidth,
            child: Row(
              children: [
                // Calendar icon
                Container(
                  width: Constants.getFontSmall(context),
                  height: Constants.getFontSmall(context),
                  child: Icon(
                    Icons.calendar_today,
                    size: Constants.getFontSmall(context),
                    color: CustomColors.littleWhite,
                  ),
                ),

                SizedBox(width: Constants.getSpacingSmall(context)),

                // Remaining days text
                Text(
                  'Remaining: 30 days',
                  style: TextStyle(
                    fontFamily: Constants.primaryfont,
                    fontSize: Constants.getFontLittle(context),
                    color: CustomColors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarrantiesSection(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min, // FIXED: Use min
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Add Button
          SizedBox(
            width: Responsive.value<double>(
              context,
              mobile: 360,
              tablet: 380,
              desktop: 400,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Warranties Text
                Text(
                  'Warranties',
                  style: TextStyle(
                    fontFamily: Constants.primaryfont,
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.getFontSmall(context),
                    color: CustomColors.darkPink,
                  ),
                ),

                // Add button with pink background
                Container(
                  width: Constants.getFontMedium(context),
                  height: Constants.getFontMedium(context),
                  decoration: BoxDecoration(
                    color: CustomColors.darkPink.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.add,
                    size: Constants.getFontSmall(context),
                    color: CustomColors.darkPink,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: Constants.getSpacingSmall(context)),

          // First warranty item
          _buildWarrantyItem(context, 'Warranty construction Villa Hazmi'),

          SizedBox(height: Constants.getSpacingSmall(context)),

          // Second warranty item
          _buildWarrantyItem(context, 'Warranty construction Villa Hazmi'),

          SizedBox(height: Constants.getSpacingSmall(context)),
        ],
      ),
    );
  }

  Widget _buildWarrantyItem(BuildContext context, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min, // FIXED: Use min
      children: [
        // Warranty item row
        SizedBox(
          width: Responsive.value<double>(
            context,
            mobile: 360,
            tablet: 380,
            desktop: 400,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Start icon
              Container(
                width: Constants.getFontMedium(context),
                height: Constants.getFontMedium(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Responsive.value<double>(
                      context,
                      mobile: 4,
                      tablet: 5,
                      desktop: 6,
                    ),
                  ),
                ),
                child: Icon(
                  Icons.security,
                  color: CustomColors.black87,
                  size: Constants.getFontSmall(context),
                ),
              ),

              SizedBox(width: Constants.getSpacingLittle(context)),

              // Warranty title
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontWeight: FontWeight.bold,
                      fontSize: Constants.getFontLittle(context),
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              // End icon
              Container(
                width: Constants.getFontMedium(context),
                height: Constants.getFontMedium(context),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: Constants.getFontSmall(context),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: Constants.getSpacingLittle(context)),

        // Remaining days for this warranty
        SizedBox(
          width: Responsive.value<double>(
            context,
            mobile: 320,
            tablet: 340,
            desktop: 360,
          ),
          child: Row(
            children: [
              SizedBox(width: Constants.getSpacingLittle(context)),

              // Calendar icon
              Container(
                width: Constants.getFontSmall(context),
                height: Constants.getFontSmall(context),
                child: Icon(
                  Icons.calendar_today,
                  size: Constants.getFontSmall(context),
                  color: CustomColors.littleWhite,
                ),
              ),

              SizedBox(width: Constants.getSpacingSmall(context)),

              // Remaining days text
              Text(
                'Remaining: 30 days',
                style: TextStyle(
                  fontFamily: Constants.primaryfont,
                  fontSize: Constants.getFontLittle(context),
                  color: CustomColors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}