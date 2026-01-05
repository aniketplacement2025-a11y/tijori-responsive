import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vkaps_it_solution_project_tijori/auth/features/gradient_button.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/Custom_Form_Field_For_Write_Description.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/document_upload_button.dart';
import 'package:vkaps_it_solution_project_tijori/pages/others/categories_data.dart';
import 'package:vkaps_it_solution_project_tijori/pages/tabs/features/home_category_card.dart';
import 'package:vkaps_it_solution_project_tijori/services/providers/provider/my_categories_provider.dart';
import 'package:vkaps_it_solution_project_tijori/services/settings/loadingIndicator.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/material/positioned_header_back_icon.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/after_listed_document_contract_selection.dart';

import '../../pages/official_landing_page.dart';
import '../../utils/Images.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/onboarding_background.dart';
import '../../utils/responsive_media_query.dart';
import '../dialogs/add_new_category_response.dart';
import 'add_new_category_click_event.dart';

class AddBucketClickEvent extends StatefulWidget {
  final bool isCommercial;

  AddBucketClickEvent({
    super.key,
    required this.isCommercial,
  });

  @override
  State<AddBucketClickEvent> createState() => _AddBucketClickEventState();
}

class _AddBucketClickEventState extends State<AddBucketClickEvent> {
  final _formKey = GlobalKey<FormState>();
  String id = "";
  String title = "";
  TextEditingController _enterNameController = TextEditingController();
  TextEditingController _infoAboutBucket = TextEditingController();
  String? UploadedFile;
  String? ReplacementUploadedFile;
  int? _selectedCategoryIndex; // Track selected Category index

  void _navigateToCategoryPage(String title, String? UploadFile, String ReplacementUploadedFile,String id,BuildContext context) {
    print("title: ${title}, File Upload: ${UploadFile}, FileName: ${ReplacementUploadedFile}, id: ${id}");
    switch(title) {
      case 'CONTRACT':
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AfterListedDocumentContractSelection(
                subtitle: _enterNameController.text,
                title: title,
                isCommercial: widget.isCommercial,
                id: id,
                folderName: ReplacementUploadedFile,
                UpdateFile: UploadFile,
              ),
          )
        );
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

  late MyCategoriesProvider _myCategoriesProvider;

  @override
  void initState() {
    super.initState();
    _myCategoriesProvider = MyCategoriesProvider();
    _fetchCategories();
  }

  void _fetchCategories() async {
    await _myCategoriesProvider.fetchCategories();
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

    final double containerPadding = Responsive.value<double>(
      context,
      mobile: Constants.getSpacingSmall(context),
      tablet: Constants.getSpacingMedium(context),
      desktop: Constants.getSpacingHigh(context),
    );

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
              top: Responsive.value<double>(
                context,
                mobile: 72,
                tablet: 80,
                desktop: 88,
              ),
              left: Responsive.value<double>(
                context,
                mobile: 10,
                tablet: 20,
                desktop: 30,
              ),
              right: Responsive.value<double>(
                context,
                mobile: 10,
                tablet: 20,
                desktop: 30,
              ),
              child: Container(
                alignment: Alignment.center,
                height: Responsive.value<double>(
                  context,
                  mobile: 108,
                  tablet: 118,
                  desktop: 128,
                ),
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
                child: Form(
                  key: _formKey,
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
                                  text: 'New ',
                                  style: TextStyle(
                                    fontFamily: Constants.primaryfont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Constants.getFontSmall(context),
                                    color: CustomColors.black87,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Bucket',
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
            ),

            Positioned(
              top: Responsive.value<double>(
                context,
                mobile: 184,
                tablet: 200,
                desktop: 216,
              ),
              left: 0,
              right: 0,
              bottom: 10,
              child: Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: containerPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Left: Title
                                Flexible(
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: Responsive.value<double>(
                                        context,
                                        mobile: 148,
                                        tablet: 160,
                                        desktop: 172,
                                      ),
                                    ),
                                    child: Text(
                                      'Add Bucket',
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

                                Container(
                                  width: Constants.getSpacingHigh(context),
                                  height: Constants.getSpacingLarge(context),
                                  child: Image.asset(
                                    Images.oneonthree,
                                    width: Constants.getSpacingHigh(context),
                                    height: Constants.getSpacingLarge(context),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),

                            // "Add a Bucket to manage" text
                            Container(
                              width: double.infinity,
                              child: Text(
                                'Add a Bucket to manage',
                                style: TextStyle(
                                  fontFamily: Constants.primaryfont,
                                  fontSize: Constants.getFontLittle(context),
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.littleWhite,
                                ),
                              ),
                            ),

                            SizedBox(height: Constants.getSpacingLittle(context)),

                            // Enter Bucket's Name
                            CustomFormField(
                              label: 'Enter a Name',
                              hintText: 'Enter Bucket\'s Name',
                              controller: _enterNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: Constants.getSpacingSmall(context)),

                            // Form Field For Description
                            CustomFormFieldForWriteDescription(
                              label: 'Informations about the Bucket',
                              hintText: 'Describe the Bucket in few words...',
                              controller: _infoAboutBucket,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                              minLines: 3,
                            ),

                            SizedBox(height: Constants.getSpacingMedium(context)),

                            // Horizontal line
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: CustomColors.littleWhite.withOpacity(0.5),
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
                                  child: Text(
                                    'What do you want to add to this Bucket?',
                                    style: TextStyle(
                                      fontFamily: Constants.primaryfont,
                                      fontSize: Constants.getFontLittle(context),
                                      color: CustomColors.black87,
                                    ),
                                  ),
                                ),

                                SizedBox(width: Constants.getSpacingSmall(context)),

                                // Add New Category
                                Material(
                                  color: Colors.transparent,
                                  child: GestureDetector(
                                    onTap: () {
                                      print(" Clicked on Add New Bucket");
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
                                            controller: _enterNameController,
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

                            // Vertical Scrollable Cards Using GridView.builder
                            ChangeNotifierProvider.value(
                              value: _myCategoriesProvider,
                              child: Consumer<MyCategoriesProvider>(
                                builder: (context, myCategoriesProvider, child) {
                                  // Show loading indicator
                                  if (myCategoriesProvider.isLoading) {
                                    return Container(
                                      height: Responsive.value<double>(
                                        context,
                                        mobile: 480,
                                        tablet: 520,
                                        desktop: 560,
                                      ),
                                      margin: EdgeInsets.symmetric(
                                        horizontal: Constants.getSpacingLittle(context),
                                        vertical: Constants.getSpacingLittle(context),
                                      ),
                                      child: loadingIndicator(),
                                    );
                                  }

                                  // Show error if any
                                  if (myCategoriesProvider.error != null) {
                                    return Container(
                                      height: Responsive.value<double>(
                                        context,
                                        mobile: 480,
                                        tablet: 520,
                                        desktop: 560,
                                      ),
                                      margin: EdgeInsets.symmetric(
                                        horizontal: Constants.getSpacingLittle(context),
                                        vertical: Constants.getSpacingLittle(context),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Error loading categories',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    );
                                  }

                                  // Show categories or fallback to static data
                                  final categoriesList = myCategoriesProvider.categories.isNotEmpty
                                      ? myCategoriesProvider.categories
                                      : CategoriesData.categories;

                                  return Container(
                                    alignment: Alignment.center,
                                    height: Responsive.value<double>(
                                      context,
                                      mobile: 480,
                                      tablet: 520,
                                      desktop: 560,
                                    ),
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
                                      physics: NeverScrollableScrollPhysics(),
                                      childAspectRatio: Responsive.value<double>(
                                        context,
                                        mobile: 194 / 108,
                                        tablet: 200 / 112,
                                        desktop: 206 / 116,
                                      ),
                                      children: categoriesList
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        int index = entry.key;
                                        Map<String, dynamic> category = entry.value;
                                        String title = category['name']!;
                                        String icon = category['icon']!;
                                        String id = category['id'];

                                        return Container(
                                          child: HomeCategoryCard(
                                            imageAsset: icon,
                                            title: title,
                                            isSelected: _selectedCategoryIndex == index,
                                            onTap: () {
                                              setState(() {
                                                _selectedCategoryIndex = _selectedCategoryIndex == index
                                                    ? null
                                                    : index;
                                              });
                                              print('$title tapped');
                                              this.title = title;
                                              this.id = id;
                                            },
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                },
                              ),
                            ),

                            // Form Field For Description
                            DocumentUploadButton(
                              labelText: 'Enter a document',
                              hintText: UploadedFile!=null ?
                              'File: ${ReplacementUploadedFile ?? "Selected"}'
                                  : 'Click to Upload Company Files',
                              onPressed: () async {
                                print("Clicked On Upload A File");
                                FilePickerResult? result = await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: [
                                   'pdf', 'jpg', 'jpeg', 'png', 'webp',
                                  ]
                                );
                                if(result != null && result.files.single.path!=null){
                                  String filePath = result.files.single.path!;
                                  UploadedFile = filePath;
                                  // Fixed file name extraction
                                  ReplacementUploadedFile = filePath.split('/').last;

                                  // Check file extension
                                  String extension = filePath.split('.').last.toLowerCase();
                                  print('File extension: $extension');

                                  // Check file size
                                  File file = File(filePath);
                                  int fileSize = await file.length();
                                  print('File size: $fileSize bytes');

                                  // Optional: Show file name to user
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(
                                     'File selected: ${ReplacementUploadedFile}($extension, ${fileSize ~/ 1024} KB)'
                                  ),),
                                  );
                                }
                              },
                            ),

                            SizedBox(height: Constants.getSpacingSmall(context)),

                            GradientButton(
                              text: 'NEXT',
                              onPressed: () async {
                                print('Clicked On NEXT');
                                if(_formKey.currentState!.validate()) {
                                  // Check required fields
                                  if(UploadedFile == null){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Please Upload a company document")),
                                    );
                                    return;
                                  }

                                  // check name and Info of Bucket:
                                  if(_enterNameController.text != "" || _infoAboutBucket.text != ""){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(content: Text('Please Enter the Details First'))
                                    );
                                  }

                                  _navigateToCategoryPage(this.title,UploadedFile, ReplacementUploadedFile!, id , context);
                                }
                              },
                              width: mainWidth,
                              height: Responsive.value<double>(
                                context,
                                mobile: 48,
                                tablet: 52,
                                desktop: 56,
                              ),
                            ),

                            // Extra spacing for larger screens
                            if (isTablet || isDesktop)
                              SizedBox(height: Constants.getSpacingLarge(context)),
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