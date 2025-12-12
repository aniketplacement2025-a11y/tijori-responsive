import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/projects_list_titles.dart';
import 'package:vkaps_it_solution_project_tijori/utils/Images.dart';
import 'package:vkaps_it_solution_project_tijori/utils/constants.dart';
import 'package:vkaps_it_solution_project_tijori/utils/custom_colors.dart';
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
         width: 400,
         height: widget.isExpanded ? 294 : 56,
         margin: EdgeInsets.only(bottom: Constants.spacingSmall),
         padding: EdgeInsets.all(Constants.fontLittle),
         decoration: BoxDecoration(
           color: widget.isExpanded
               ? CustomColors.gradientBlue // Outer container white for expanded state
             : CustomColors.ghostWhite,
           borderRadius: BorderRadius.circular(Constants.spacingMedium),
           boxShadow: [
             BoxShadow(
               color: CustomColors.blackBS1,
               blurRadius: 1,
               offset: Offset(0, 1),
             ),
           ],
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           // First Row: Title with icons
           Row(
            mainAxisAlignment: .spaceBetween,
            children: [
             // Left side: Icon + Title
             Row(
               children: [
                 // Icon
                 Container(
                   width: Constants.spacingHigh,
                   height: 30,
                   child: Image.asset(
                    Images.projectIcon,
                    width: Constants.spacingHigh,
                    height: Constants.spacingHigh,
                    fit: BoxFit.contain,
                   ),
                 ),

                 SizedBox(width: Constants.spacingSmall),

                 // Title
                 GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    width: 200,
                    height: 22,
                    child: Text(
                      widget.project['title']!,
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize: 14,
                        fontWeight: .bold,
                        color: CustomColors.black87,
                      ),
                    ),
                  ),),
               ],
             ),

             // Right Side : Two Icons
             Row(
               children: [

                 GestureDetector(
                   onTap: widget.onToggle,
                 child: AnimatedContainer(
                     duration: const Duration(milliseconds: 300),
                 // First icon In Future (rotated -90 deg)
                 child: Transform.rotate(
                  angle: widget.isExpanded
                   ? 180 * (3.1415926535 / 180) // In Future We rotate it angle: -90 * (3.1415926535 / 180), // -90 degrees
                   : 0,
                  child: Container(
                    width: Constants.spacingHigh,
                    height: Constants.spacingHigh,
                    child: Image.asset(
                      Images.bottomarrowIcon,
                      width: Constants.spacingHigh,
                      height: Constants.spacingHigh,
                      fit: BoxFit.contain,
                     ),
                    ),
                   ),
                  ),
                 ),

                 SizedBox(width: Constants.spacingLittle),

                 // Second icon
                 Container(
                   width: Constants.spacingHigh,
                   height: Constants.spacingHigh,
                   child: Image.asset(
                     Images.menudotIcon,
                     width: Constants.spacingHigh,
                     height: Constants.spacingHigh,
                     fit: BoxFit.contain,
                   ),
                 ),
               ],
             ),
           ],
         ),

         // Expanded Content (shown when expanded)
        if(widget.isExpanded) ...[
    SizedBox(height: Constants.spacingSmall),

    // Main content container with white backgrount
    Container(
      width: 360,
      height: 230, // 416 - 56 - 16 -4 (calculated)
      decoration: BoxDecoration(
       gradient: LinearGradient(
       begin: Alignment.topCenter,
       end: Alignment.bottomCenter,
       colors: [
         CustomColors.ghostWhite,
         CustomColors.white,
       ],
     ),
     borderRadius: .circular(Constants.fontLittle),
    ),
    child: Padding(
     padding: const EdgeInsetsGeometry.all(8.0),
     child: Column(
         crossAxisAlignment: .start,
           children: [
           // Contracts Section
           _buildContractsSection(),

           SizedBox(height: Constants.spacingLittle),

             // Divider
             Container(
               width: 360,
               height: 0,
               decoration: BoxDecoration(
                 border: Border.all(
                   color: Colors.black.withOpacity(0.1),
                   width: 1,
                 ),
               ),
             ),

           SizedBox(height: Constants.spacingLittle),

             // Warranties Section
             _buildWarrantiesSection(),
           ],
          ),
         ),
        ),
       ],
      ],
     ),
    );
  }

  Widget _buildContractsSection(){
    return Container(
      width: 360,
      height: 72,
      child: Column(
        crossAxisAlignment: .start,
        children: [

          // Row a: Title + Close icon
          SizedBox(
            width: 360,
            height: 20,
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [

                // Contracts Text
                SizedBox(
                  width: 72,
                  height: Constants.fontMedium,
                  child: Text(
                    'Contracts',
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontWeight: .bold,
                      fontSize: Constants.fontSmall,
                      color: CustomColors.darkPink,
                    ),
                  ),
                ),

                // Close icon (pink)
                Container(
                  width: Constants.fontSmall,
                  height: Constants.fontSmall,
                  child: Icon(
                    Icons.close,
                    size: Constants.fontSmall,
                    color: CustomColors.darkPink,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: Constants.spacingLittle),

          // Row 2: Contract item with icons
          SizedBox(
            width: 300,
            height: 18,
            child: Row(
              mainAxisAlignment: .start,
              children: [
                // Start icon
                Container(
                  width: Constants.fontSmall,
                  height: Constants.fontSmall,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.description,
                    color: CustomColors.black87,
                    size: Constants.fontSmall,
                  ),
                ),

                SizedBox(width: Constants.spacingLittle),

                // Contract title
                SizedBox(
                  width: 220,
                  height: 28,
                    child: Text(
                      'Contact construction Villa Hazmi',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontWeight: .bold,
                        fontSize: Constants.fontLittle,
                        color: CustomColors.black87,
                      ),
                    ),
                  ),

                SizedBox(width: Constants.spacingLarge),

                // End Icon
            GestureDetector(
              onTap: () {
                print("Arrow icon tapped");
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContractPageAfterDocument()));
              },
              child: Container(
                  width: Constants.fontMedium,
                  height: Constants.fontMedium,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: Constants.fontSmall,
                    color: Colors.grey,
                  ),
                ),
               ),
              ],
            ),
          ),

          SizedBox(height: Constants.spacingSmall),

          // Row c: Remaining days
          SizedBox(
            width: 360,
            height: Constants.fontSmall,
            child: Row(
              children: [

                // Calendar icon
                Container(
                  width: Constants.fontSmall,
                  height: Constants.fontSmall,
                  child: Icon(
                    Icons.calendar_today,
                    size: Constants.fontSmall,
                    color: CustomColors.littleWhite,
                  ),
                ),

                SizedBox(width: Constants.spacingSmall),

                // Remaining days text
                SizedBox(
                  width: 116,
                  height: 18,
                  child: Text(
                    'Remaining: 30 days',
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontSize: Constants.fontLittle,
                      color: Colors.black87,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarrantiesSection(){
    return Container(
     child: Column(
       crossAxisAlignment: .start,
       children: [

         // Title + Add Button
         SizedBox(
           width: 360,
           height: 23,
           child: Row(
             mainAxisAlignment: .spaceBetween,
             children: [

               // Warranties Text
               SizedBox(
                 width: 84,
                 height: 20,
                 child: Text(
                   'Warranties',
                   style: TextStyle(
                     fontFamily: Constants.primaryfont,
                     fontWeight: .bold,
                     fontSize: Constants.fontSmall,
                     color: CustomColors.darkPink,
                   ),
                 ),
               ),

               // Add button with pink background
               Container(
                 width: Constants.fontMedium,
                 height: Constants.fontMedium,
                 decoration: BoxDecoration(
                   color: CustomColors.darkPink.withOpacity(0.05),
                   borderRadius: .circular(40),
                 ),
                 child: Icon(
                   Icons.add,
                   size: Constants.fontSmall,
                   color: CustomColors.darkPink,
                 ),
               ),
             ],
           ),
         ),

         // First warranty item
         _buildWarrantyItem('Warranty construction Villa Hazmi'),

         SizedBox(height: Constants.spacingSmall),

         // Second warranty item
         _buildWarrantyItem('Warranty construction Villa Hazmi'),

         SizedBox(height: Constants.spacingSmall),
       ],
     ),
    );
  }

  Widget _buildWarrantyItem(String title){
    return Column(
      children: [

        // Warranty item row
        SizedBox(
          width: 360,
          height: Constants.fontMedium,
          child: Row(
            mainAxisAlignment: .start,
            children: [

              // Start icon
              Container(
                width: Constants.fontMedium,
                height: Constants.fontMedium,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.security,
                  color: CustomColors.black87,
                  size: Constants.fontSmall,
                ),
              ),

              SizedBox(width: Constants.spacingLittle),

              // Warranty title
              SizedBox(
                width: 208,
                height: Constants.fontMedium,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: Constants.primaryfont,
                      fontWeight: FontWeight.bold,
                      fontSize: Constants.fontLittle,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(width: Constants.spacingLarge),
              // End icon
              Container(
                width: Constants.fontMedium,
                height: Constants.fontMedium,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: Constants.spacingLittle),

        // Remaining days for this warranty
        SizedBox(
          width: 320,
          height: Constants.fontSmall,
          child: Row(
            children: [

              SizedBox(width: Constants.spacingLittle),

              // Calendar icon
              Container(
                width: Constants.fontSmall,
                height: Constants.fontSmall,
                child: Icon(
                  Icons.calendar_today,
                  size: Constants.fontSmall,
                  color: CustomColors.littleWhite,
                ),
              ),

              SizedBox(width: Constants.spacingSmall),

              // Remaining days text
              SizedBox(
                width: 116,
                height: 18,
                child: Text(
                  'Remaining: 30 days',
                  style: TextStyle(
                    fontFamily: Constants.primaryfont,
                    fontSize: Constants.fontLittle,
                    color: Colors.black87,
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
