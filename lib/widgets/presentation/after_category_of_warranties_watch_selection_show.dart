import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/gradient_button.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_phone_field.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/dialogs/success_dialog.dart';

import '../../pages/official_landing_page.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../material/positioned_header_back_icon.dart';

class AfterCategoryOfWarrantiesWatchSelectionShow extends StatefulWidget {
  final String title;
  final String subtitle;
  final String child_sub_title;

  const AfterCategoryOfWarrantiesWatchSelectionShow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child_sub_title,
  });

  @override
  State<AfterCategoryOfWarrantiesWatchSelectionShow> createState() => _AfterCategoryOfWarrantiesWatchSelectionShowState();
}

class _AfterCategoryOfWarrantiesWatchSelectionShowState extends State<AfterCategoryOfWarrantiesWatchSelectionShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: OnboardingBackground(
         child: Stack(
           children: [

             // FIXED HEADER WITH BELL ICON
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

             // Title + Subtitle + ChildTitle Box
             Positioned(
               top:72,
               left: 5,
               child: Container(
                 width: 350,
                 height: 104,
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
                       width: 330,
                       height: 22,
                       child: Row(
                         mainAxisAlignment: .center,
                         children: [
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

                           // Bucket Text
                           Container(
                             constraints: BoxConstraints(
                               maxWidth: 286, // Maximum width
                               minWidth: 100, // Minimum width if needed
                             ),
                             height: Constants.fontSmall,
                             child: RichText(
                               text: TextSpan(
                                 children: [
                                   TextSpan(
                                     text: 'Bucket: ',
                                     style: TextStyle(
                                       fontFamily: Constants.primaryfont,
                                       fontSize: Constants.fontSmall,
                                       color: CustomColors.black87,
                                     ),
                                   ),
                                   TextSpan(
                                     text: '${widget.title}',
                                     style: TextStyle(
                                       fontFamily: Constants.primaryfont,
                                       fontSize: Constants.fontSmall,
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
                       width: 320,
                       height: 20,
                       child:
                       Center(
                         child: RichText(
                           text: TextSpan(
                             children: [
                               TextSpan(
                                 text: 'Type: ',
                                 style: TextStyle(
                                   fontFamily: Constants.primaryfont,
                                   fontSize: Constants.fontSmall,
                                   color: CustomColors.black87,
                                 ),
                               ),
                               TextSpan(
                                 text: '${widget.subtitle.toLowerCase()}',
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


                     // Row 3: Category
                     SizedBox(
                       width: 340,
                       height: 18,
                       child:
                       Center(
                         child: RichText(
                           text: TextSpan(
                             children: [
                               TextSpan(
                                 text: 'Category: ',
                                 style: TextStyle(
                                   fontFamily: Constants.primaryfont,
                                   fontSize: Constants.fontSmall,
                                   color: CustomColors.black87,
                                 ),
                               ),
                               TextSpan(
                                 text: '${widget.child_sub_title.toLowerCase()}',
                                 style: TextStyle(
                                   fontFamily: Constants.primaryfont,
                                   fontWeight: FontWeight.bold,
                                   fontSize: Constants.fontSmall,
                                   color: CustomColors.black87,
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ), ),
                   ],
                 ),
               ),
             ),

                     Positioned(
                      top: 175,
                      left: 0,
                      right: 0,
                      bottom: 10,
                       child: SingleChildScrollView(
                           padding: EdgeInsets.symmetric(
                             horizontal: Constants.spacingLittle,
                           ),
                           child: Column(
                             crossAxisAlignment: .start,
                             children: [

                               // About Warranty and Icon
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
                                       children: [

                                         // Left: Title
                                         Flexible(
                                           // Use Flexible instead of Fixed width
                                           child: Container(
                                             constraints: BoxConstraints(maxWidth: 184),
                                             child: Text(
                                               'About Warranty',
                                               style: TextStyle(
                                                 fontFamily: Constants.primaryfont,
                                                 fontSize: 18,
                                                 fontWeight: .bold,
                                                 color: CustomColors.black87,
                                               ),
                                             ),
                                           ),
                                         ),

                                         Container(
                                           width: Constants.spacingHigh,
                                           height: Constants.spacingLarge,
                                           child: Image.asset(
                                             Images.twoofthree,
                                             width: Constants.spacingHigh,
                                             height: Constants.spacingLarge,
                                             fit: BoxFit.contain,
                                           ),
                                         ),
                                       ],
                                     ),

                                     // "Fill out below the informations about the warranty" Text
                                     Container(
                                       width: double.infinity,
                                       child: Text(
                                         'Fill out below the informations about the warranty',
                                         style: TextStyle(
                                           fontFamily: Constants.primaryfont,
                                           fontSize: Constants.fontLittle,
                                           fontWeight: .w500,
                                           color: CustomColors.littleWhite,
                                         ),
                                       ),
                                     ),

                                     SizedBox(height: Constants.spacingLittle),

                                     // "Details of Warranty" Text
                                     Container(
                                       width: double.infinity,
                                       child:
                                       Row(
                                         children: [
                                           Text(
                                             'Details of Warranty',
                                             style: TextStyle(
                                               fontFamily: Constants.primaryfont,
                                               fontSize: Constants.fontSmall,
                                               fontWeight: .bold,
                                               color: CustomColors.darkPink,
                                             ),
                                           ),],
                                       ),
                                     ),

                                     Container(
                                       width: double.infinity,
                                       child: Column(
                                         crossAxisAlignment: .start,
                                         children: [

                                           // Name of Brand FORM FIELD
                                           _buildTextLabel(
                                               label: 'Name of Brand',
                                               sublabel: 'Mormora',
                                               Imagepath: Images.right
                                           ),

                                           // Price
                                           _buildTextLabel(
                                               label: 'Price',
                                               sublabel: '200',
                                               Imagepath: Images.right,
                                           ),

                                           // Serial Number
                                           _buildTextLabel(
                                             label: 'Serial Number',
                                             sublabel: '237789',
                                             Imagepath: Images.squarepenIcon,
                                           ),

                                           // Seller Name
                                           _buildTextLabel(
                                               label: 'Seller Name',
                                               sublabel: 'Said Hammad',
                                               Imagepath: Images.right,
                                           ),

                                           // Seller Phone Number
                                           CustomPhoneField(),

                                           // Start date of the warranty
                                           _buildTextLabel(
                                               label: 'Start date of the warranty',
                                               sublabel: '12.05.2025',
                                               Imagepath: Images.calenderIcon,
                                           ),

                                           // Expiry date of the warranty
                                           _buildTextLabel(
                                             label: 'Expiry date of the warranty',
                                             sublabel: '12.05.2025',
                                             Imagepath: Images.calenderIcon,
                                           ),

                                           // Purchase location
                                           _buildTextLabel(
                                             label: 'Purchase location',
                                             sublabel: 'Kuwait City',
                                             Imagepath: Images.plusIcon,
                                           ),

                                           // Country of manufacture
                                           _buildTextLabel(
                                             label: 'Country of manufacture',
                                             sublabel: 'Kuwait City',
                                             Imagepath: Images.bottomarrowIcon,
                                           ),

                                           // Store Location
                                           _buildTextLabel(
                                             label: 'Store location',
                                             sublabel: 'Https://link.com?b?bcjj221',
                                             Imagepath: Images.right,
                                           ),

                                           SizedBox(height: Constants.spacingSmall),

                                           // Row Of "Add reminder for expiry date" and Image
                                           SizedBox(
                                             width: 200,
                                             height: 22,
                                             child: Column(
                                               crossAxisAlignment: .start,
                                               children: [
                                                 Row(
                                                   mainAxisAlignment: .center,
                                                   children: [
                                                     // Icon/Image
                                                     Container(
                                                       width: 12,
                                                       height: 12,
                                                       decoration: BoxDecoration(
                                                         color: Colors.pink, // Pink color
                                                         borderRadius: BorderRadius.circular(2), // 2px border radius
                                                       ),
                                                     ),

                                                     SizedBox(width: Constants.spacingSmall),

                                                     Text(
                                                       'Add reminder for expiry date',
                                                       style: TextStyle(
                                                         fontFamily: Constants.primaryfont,
                                                         fontSize: Constants.fontLittle,
                                                         color: CustomColors.black87,
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                               ],
                                             ),
                                           ),

                                           SizedBox(height: Constants.spacingSmall),

                                           // "Country of manufacture" Text
                                           Container(
                                             width: 350,
                                             height: 36,
                                             padding: const EdgeInsets.only(
                                               top: 5,
                                               right: 20,
                                               bottom: 5,
                                               left: 20,
                                             ),
                                             decoration: BoxDecoration(
                                               color: const Color(0xFF000000).withOpacity(0.05), // #00000005
                                               borderRadius: BorderRadius.circular(8),
                                             ),
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               crossAxisAlignment: .center,
                                               children: [
                                                 Text(
                                                   'Onw Week before',
                                                   style: TextStyle(
                                                     fontSize: Constants.fontSmall,
                                                     fontFamily: Constants.primaryfont,
                                                     color: CustomColors.black87,
                                                   ),
                                                 ),

                                                 Image.asset(
                                                   Images.bottomarrowIcon,
                                                   width: 16,
                                                   height: 16,
                                                 ),
                                               ],
                                             ),
                                           ),

                                           SizedBox(height: Constants.spacingLittle),

                                           // "Warranty covering" Text
                                           Container(
                                             width: double.infinity,
                                             child: Row(
                                               children: [
                                                 Text(
                                                   'Warranty covering',
                                                   style: TextStyle(
                                                     fontFamily: Constants.primaryfont,
                                                     fontSize: Constants.fontSmall,
                                                     fontWeight: .bold,
                                                     color: CustomColors.darkPink,
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),

                                           SizedBox(height: Constants.spacingLittle),

                                           _buildTextLabel(
                                             label: 'Covering areas',
                                             sublabel: '2',
                                             Imagepath: Images.right,
                                           ),

                                           SizedBox(height: Constants.spacingSmall),

                                           // "Country of manufacture" Text
                                           Container(
                                             width: 350,
                                             height: 36,
                                             padding: const EdgeInsets.only(
                                               top: 5,
                                               right: 20,
                                               bottom: 5,
                                               left: 20,
                                             ),
                                             decoration: BoxDecoration(
                                               color: const Color(0xFF000000).withOpacity(0.05), // #00000005
                                               borderRadius: BorderRadius.circular(8),
                                             ),
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               crossAxisAlignment: .center,
                                               children: [
                                                 Text(
                                                   'Kuwait City',
                                                   style: TextStyle(
                                                     fontSize: Constants.fontSmall,
                                                     fontFamily: Constants.primaryfont,
                                                     color: CustomColors.black87,
                                                   ),
                                                 ),

                                                 Image.asset(
                                                   Images.bottomarrowIcon,
                                                   width: 16,
                                                   height: 16,
                                                 ),
                                               ],
                                             ),
                                           ),

                                           SizedBox(height: Constants.spacingLittle),

                                           // Add More
                                           Row(
                                             crossAxisAlignment:
                                             CrossAxisAlignment.center,
                                             children: [
                                               Spacer(), // This pushes the button to the right

                                               Material(
                                                 color: Colors.transparent,
                                                 child: GestureDetector(
                                                   onTap: () {
                                                     print("Clicked on Add New Bucket");
                                                   },
                                                   child: Container(
                                                     height: 36,
                                                     constraints: BoxConstraints(
                                                       maxWidth: 150,
                                                     ),
                                                     padding: EdgeInsets.symmetric(
                                                       horizontal: Constants.fontLittle,
                                                       vertical: Constants.spacingLittle,
                                                     ),
                                                     decoration: BoxDecoration(
                                                       color: CustomColors.blackBS1,
                                                       borderRadius:
                                                       BorderRadius.circular(
                                                         Constants.spacingMedium,
                                                       ),
                                                       boxShadow: [
                                                         BoxShadow(
                                                           color: CustomColors.blackBS1,
                                                           blurRadius: 4,
                                                           offset: Offset(0, 2),
                                                         ),
                                                       ],
                                                     ),
                                                     child: Row(
                                                       mainAxisAlignment:
                                                       MainAxisAlignment.center,
                                                       mainAxisSize: MainAxisSize.min,
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
                                                           'Add More',
                                                           style: TextStyle(
                                                             fontFamily:
                                                             Constants.primaryfont,
                                                             fontSize:
                                                             Constants.spacingSmall,
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

                                           SizedBox(height: Constants.spacingLittle),

                                           GradientButton(
                                             text: 'ADD MY BUCKET',
                                             width: 350,
                                             onPressed: () {
                                               print(
                                                   " CLICKED ON ADD MY BUCKET");
                                               showModalBottomSheet(
                                                 context: context,
                                                 isScrollControlled: true,
                                                 backgroundColor: Colors
                                                     .transparent,
                                                 builder: (context) {
                                                   return SuccessDialog(
                                                     initialHeight: 200,
                                                     onComplete: () {
                                                       Navigator.pop(
                                                           context); // Close the dialog
                                                       ScaffoldMessenger
                                                           .of(
                                                           context)
                                                           .showSnackBar(
                                                         SnackBar(
                                                           content: Text(
                                                               'ADD BUCKET SUCCESSFULL'),
                                                         ),
                                                       );
                                                       Navigator.push(
                                                         context,
                                                         MaterialPageRoute(
                                                           builder: (context) =>
                                                               OfficialLandingPage(),
                                                         ),
                                                       );
                                                     },
                                                     imageAsset: Images
                                                         .warenty_successfull,
                                                     title: 'Warranty successfull Added',
                                                     subtitle: 'Congrats! Your warranty was added to ‘Values assets’ Bucket.',
                                                     buttonText: 'Go back to My Homepage',
                                                   );
                                                 },
                                               );
                                             },
                                           ),

                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               )
                             ],
                           ),
                         ),
                       ),
           ],
         ),
       ),
    );
  }
  Widget _buildTextLabel({
    required String label,
    required String sublabel,
    required String Imagepath,
  }){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: Constants.fontSmall,
                color: CustomColors.littleWhite,
              ),
            ),
          ],
        ),
        SizedBox(height: Constants.spacingLittle),

        Container(
          width: 350,
          height: 36,
          padding: const EdgeInsets.only(
            top: 5,
            right: 20,
            bottom: 5,
            left: 20,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF000000).withOpacity(0.05), // #00000005
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: .center,
            children: [
              Text(
                sublabel,
                style: TextStyle(
                  fontSize: Constants.fontSmall,
                  fontFamily: Constants.primaryfont,
                  color: CustomColors.black87,
                ),
              ),

              // Bell Image
              Image.asset(
                  Imagepath,
                  width: 16,
                  height: 16
              ),
            ],
          ),
        ),
      ],
    );
  }
}

