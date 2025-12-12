import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/gradient_button.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/categories_data.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/features/home_category_card.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/material/positioned_header_back_icon.dart';

import '../../pages/official_landing_page.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/onboarding_background.dart';
import '../../utils/responsive_media_query.dart';
import '../dialogs/add_new_category_response.dart';
import 'add_new_category_click_event.dart';

class AddBucketClickEvent extends StatefulWidget {
  const AddBucketClickEvent({super.key});

  @override
  State<AddBucketClickEvent> createState() => _AddBucketClickEventState();
}

class _AddBucketClickEventState extends State<AddBucketClickEvent> {
  TextEditingController _enterNameController = TextEditingController();
  TextEditingController _infoAboutBucket = TextEditingController();

  int? _selectedCategoryIndex; // Track selected Category index

  // Navigation method based on category title
  void _navigateToCategoryPage(String title, BuildContext context){
    switch(title){
      case 'CONTRACTS':
        break;
      case 'WARRANTIES':
        break;
      case 'INSURANCE':
        break;
      case 'PERSONAL DOC':
        break;
      case 'MY TRIPS':
        break;
      case 'Appointments':
        break;
      case 'My Medicine':
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
              left: 5,
              child: Container(
                width: 350,
                height: 108,
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
                                text: 'New ',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Constants.fontSmall,
                                  color: CustomColors.black87,
                                ),
                              ),
                              TextSpan(
                                text: 'Bucket',
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
              top: 184,
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

                        // Add Bucket and Icon
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
                                children: [

                                  // Left: Title
                                  Flexible(
                                    // Use Flexible instead of fixed width
                                    child: Container(
                                      constraints: BoxConstraints(maxWidth: 148),
                                      child: Text(
                                        'Add Bucket',
                                        style: TextStyle(
                                          fontFamily: Constants.primaryfont,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.black87,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: Constants.spacingHigh,
                                    height: Constants.spacingLarge,
                                    child: Image.asset(
                                      Images.oneonthree,
                                      width: Constants.spacingHigh,
                                      height: Constants.spacingLarge,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),

                              // "Add a Bucket to manage" text
                              Container(
                                width: double.infinity,
                                //height: 26,
                                child: Text(
                                  'Add a Bucket to manage',
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

                              // Enter Bucket’s Name
                              CustomFormField(
                                label: 'Enter a Name',
                                hintText: 'Enter Bucket’s Name',
                                controller: _enterNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your full name';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: Constants.spacingSmall),

                              // Form Field For Description
                              CustomFormField(
                                  label: 'Informations about the Bucket',
                                  hintText: 'Describe the Bucket in few words...',
                                  controller: _infoAboutBucket,
                                  validator: (value) {
                                   if (value == null || value.isEmpty) {
                                     return 'Please enter your full name';
                                   }
                                   return null;
                                 },
                              ),

                              SizedBox(height: Constants.spacingMedium),

                              // Horizontal line
                              Container(
                                width: double.infinity,
                                height: 1,
                                color: CustomColors.littleWhite,
                              ),
                            ],
                          ),
                        ),


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
                                               }, controller: _enterNameController,
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
                                 height: 410,
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
                                         String title = category['title']!;
                                         String icon = category['icon']!;

                                         return Container(
                                           child: HomeCategoryCard(
                                               imageAsset: icon, // Use bracket notation for Map
                                               title: title,
                                               isSelected: _selectedCategoryIndex == index, // Pass selection state
                                               onTap: (){
                                                 setState(() {
                                                   // Toggle selection - if already selected, deselect
                                                   _selectedCategoryIndex = _selectedCategoryIndex == index ? null : index;
                                                 });
                                                print('$title tapped');

                                                // Naviagate to respective page
                                                 _navigateToCategoryPage(title, context);
                                               },
                                           ),
                                         );
                                   }).toList(),
                                 ),
                               ),

                               // Form Field For Description
                               CustomFormField(
                                 label: 'Enter a document',
                                 hintText: 'Upload the file (PDF, Word...)',
                                 controller: _infoAboutBucket,
                                 validator: (value) {
                                   if (value == null || value.isEmpty) {
                                     return 'Please enter your full name';
                                   }
                                   return null;
                                 },
                               ),

                               SizedBox(height: Constants.spacingSmall),

                               GradientButton(
                                 text: 'NEXT',
                                 onPressed: () {
                                   print('Clicked On NEXT');
                                 },
                                 width: 400,
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
