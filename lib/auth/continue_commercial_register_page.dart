import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/Intl_custom_phone_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/only_custom_form_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/otp_verification.dart';
import 'package:vkaps_it_solution_project_tijori/services/providers/sign_up_screen_commercial_provider.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/presentation/SplashScreen2.dart';

import '../utils/Images.dart';
import '../utils/constants.dart';
import '../utils/custom_colors.dart';
import '../utils/responsive_media_query.dart';

class ContinueCommercialRegisterPage extends StatefulWidget {
  final String phoneNumber;
  final String email;
  final String fullName;
  final bool isCommercial;
  final String selectedType;
  final String password;

  ContinueCommercialRegisterPage({
    super.key,
    required this.phoneNumber,
    required this.email,
    required this.fullName,
    required this.password,
    required this.selectedType,
    required this.isCommercial,
  });

  @override
  State<ContinueCommercialRegisterPage> createState() =>
      _ContinueCommercialRegisterPageState();
}

class _ContinueCommercialRegisterPageState
    extends State<ContinueCommercialRegisterPage> {
  TextEditingController _commercialRegisterNo = TextEditingController();
  TextEditingController _licenceNo = TextEditingController();
  TextEditingController _companyAddress = TextEditingController();
  TextEditingController _nameOfTheCompany = TextEditingController();
  TextEditingController _companyActivity = TextEditingController();
  TextEditingController _companyEstablishmentData = TextEditingController();
  TextEditingController _uploadFile = TextEditingController();
  TextEditingController _nameOfFolder = TextEditingController();

  List<String> companyPhoneNo = [];
  List<String> companyWhatsappNo = [];

  String? UploadedFile;
  String? ReplacementUploadedFile;

  bool _acceptItems = false;

  final _formKey = GlobalKey<FormState>();

  void _handleRegister() {
    print('Phone: ${widget.phoneNumber.toString()}');
    print('Full Name: ${widget.fullName.toString()}');
    print('Email: ${widget.email.toString()}');

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => OTPVerificationPage(
    //       phoneNumber: widget.phoneNumber.toString(),
    //       email: widget.fullName.toString(),
    //       fullName: widget.email.toString(),
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for proportional scaling
    final double screenWidth = Responsive.screenWidth(context);
    final double screenHeight = Responsive.screenHeight(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    // Base design dimensions (from original design - roughly 375x812 mobile)
    final double baseWidth = 375.0;
    final double baseHeight = 812.0;

    // Scaling factors
    final double widthScale = screenWidth / baseWidth;
    final double heightScale = screenHeight / baseHeight;
    // Use the smaller scale to maintain proportions without overflow
    final double scale = widthScale < heightScale ? widthScale : heightScale;

    // Scale all values proportionally
    double scaled(double value) => value * scale;

    // For tablet/desktop, limit maximum scaling to 1.2x to prevent huge elements
    final double limitedScale = (isTablet || !isMobile)
        ? (scale > 1.2 ? 1.2 : scale)
        : scale;

    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
          children: [
            // Back Button - SCALED
            Positioned(
              top: scaled(24) * limitedScale,
              left: scaled(8) * limitedScale,
              right: scaled(8) * limitedScale,
              child: Row(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => SplashScreen2()),
                        (route) => false,
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: CustomColors.black87,
                      size: scaled(24) * limitedScale,
                    ),
                  ),

                  // Title - SCALED
                  Center(
                    child: Text(
                      'Create an Account',
                      style: TextStyle(
                        fontFamily: Constants.primaryfont,
                        fontSize:
                            Constants.getFontMedium(context) * limitedScale,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.black87,
                      ),
                    ),
                  ),

                  // Two Twos
                  Container(
                    height: scaled(24) * limitedScale,
                    width: scaled(24) * limitedScale,
                    child: Image.asset(Images.twotwoes, fit: BoxFit.contain),
                  ),
                ],
              ),
            ),

            Positioned(
              top: scaled(60) * limitedScale,
              left: 0,
              right: 0,
              bottom: 0,
              child: ChangeNotifierProvider(
                create: (BuildContext context) => SignUpScreenCommercialProvider(),
                child: Consumer<SignUpScreenCommercialProvider>(
                  builder: (context, provider, child) {
                    return SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: scaled(24) * limitedScale,
                      ),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Center(
                                child: Text(
                                  'Continue your registration with Commercial Informations',
                                  style: TextStyle(
                                    fontFamily: Constants.primaryfont,
                                    fontSize:
                                    Constants.getFontLittle(context) *
                                        limitedScale,
                                    color: CustomColors.black87,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height:
                                Constants.getSpacingMedium(context) *
                                    limitedScale,
                              ),

                              OnlyCustomFormField(
                                controller: _commercialRegisterNo,
                                hintText: 'Commercial registration number',
                              ),

                              SizedBox(
                                height: Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              OnlyCustomFormField(
                                controller: _licenceNo,
                                hintText: 'License Number (رقم الترخيص)',
                              ),

                              SizedBox(
                                height: Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              OnlyCustomFormField(
                                suffixIcon: Icon(Icons.location_on),
                                controller: _companyAddress,
                                hintText: 'Company Address',
                              ),

                              SizedBox(
                                height: Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              OnlyCustomFormField(
                                suffixIcon: Icon(Icons.person_pin),
                                controller: _nameOfTheCompany,
                                hintText: 'Name of the Company',
                              ),

                              SizedBox(
                                height: Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              IntlCustomPhoneField(
                                suffixIcon: Icon(Icons.phone_android),
                                labelText: 'Company Phone Number',
                                onChanged: (value) {
                                  setState(() {
                                    companyPhoneNo = value;
                                  });
                                },
                              ),

                              SizedBox(
                                height: Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              IntlCustomPhoneField(
                                suffixIcon: Icon(Icons.phone_android),
                                labelText: 'Company WhatsApp Number',
                                onChanged: (value) {
                                  setState(() {
                                    companyWhatsappNo = value;
                                  });
                                },
                              ),

                              OnlyCustomFormField(
                                controller: _companyActivity,
                                hintText: 'Company\’s Activity (Optional)',
                              ),

                              SizedBox(
                                height: Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              OnlyCustomFormField(
                                controller: _companyEstablishmentData,
                                hintText: 'Company establishment date (Optional)',
                              ),

                              SizedBox(
                                height: Constants.getSpacingSmall(context) *
                                    limitedScale,
                              ),

                              // UPLOAD FOLDER OF THE COMPANY
                              Container(
                                width: 400,
                                height: 200,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: CustomColors.blackBS1,
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: Constants.spacingSmall),
                                        Text(
                                          'Folder of the Company',
                                          style: TextStyle(
                                            fontFamily: Constants.primaryfont,
                                            fontWeight: .w600,
                                            fontSize: Constants.fontLittle,
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: Constants.getSpacingLittle(
                                        context)),

                                    TextButton(
                                      onPressed: () async {
                                        FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: [
                                            'pdf',
                                            'jpg',
                                            'jpeg',
                                            'png',
                                            'webp'
                                          ],
                                        );
                                        if (result != null &&
                                            result.files.single.path != null) {
                                          String filePath = result.files.single
                                              .path!;
                                          UploadedFile = filePath;
                                          // Fixed file name extraction
                                          ReplacementUploadedFile = filePath
                                              .split('/')
                                              .last;

                                          // Check file extension
                                          String extension = filePath
                                              .split('.')
                                              .last
                                              .toLowerCase();
                                          print('File extension: $extension');

                                          // Check file size
                                          File file = File(filePath);
                                          int fileSize = await file.length();
                                          print('File size: $fileSize bytes');

                                          // Optional: Show file name to user
                                          ScaffoldMessenger
                                              .of(context)
                                              .showSnackBar(
                                            SnackBar(content: Text(
                                                'File selected: ${ReplacementUploadedFile} ($extension, ${fileSize ~/
                                                    1024} KB)')),
                                          );
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            UploadedFile != null
                                                ? 'File: ${ReplacementUploadedFile ??
                                                "Selected"}'
                                                : 'Click to Upload Company Files',
                                          ),
                                          Icon(Icons.upload),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: Constants.getSpacingLittle(
                                        context)),

                                    OnlyCustomFormField(
                                      controller: _nameOfFolder,
                                      hintText: 'Name the Folder (Optional)',
                                    ),

                                    // Add More Files
                                    Row(
                                      crossAxisAlignment: .center,
                                      children: [
                                        Spacer(),
                                        // This pushes the button to the right

                                        Material(
                                          color: Colors.transparent,
                                          child: GestureDetector(
                                            onTap: () {
                                              print("Clicked on Add New Bucket");
                                            },
                                            child: Container(
                                              height: 36,
                                              constraints: BoxConstraints(
                                                  maxWidth: 150),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: Constants.fontLittle,
                                                vertical: Constants.spacingLittle,
                                              ),
                                              decoration: BoxDecoration(
                                                color: CustomColors.blackBS1,
                                                borderRadius: BorderRadius
                                                    .circular(
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
                                                    width: Constants
                                                        .spacingLittle,
                                                  ),
                                                  Text(
                                                    'Add More Files',
                                                    style: TextStyle(
                                                      fontFamily: Constants
                                                          .primaryfont,
                                                      fontSize: Constants
                                                          .spacingSmall,
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
                                  ],
                                ),
                              ),

                              // Terms and Conditions - SCALED
                              Row(
                                children: [
                                  SizedBox(
                                    width: scaled(24) * limitedScale,
                                    height: scaled(24) * limitedScale,
                                    child: Checkbox(
                                      value: _acceptItems,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _acceptItems = value ?? false;
                                        });
                                      },
                                      activeColor: CustomColors.gradientBlue,
                                    ),
                                  ),
                                  SizedBox(width: scaled(8) * limitedScale),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        print('CLICKED ON TERMS AND CONDITIONS');
                                      },
                                      child: Text(
                                        'I have read and accept the terms and conditions.',
                                        style: TextStyle(
                                          fontFamily: Constants.primaryfont,
                                          fontSize:
                                          Constants.getFontLittle(context) *
                                              limitedScale,
                                          color: CustomColors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height:
                                Constants.getSpacingMedium(context) *
                                    limitedScale,
                              ),

                              // REGISTER BUTTON - SCALED
                              Container(
                                width: double.infinity,
                                height: scaled(42) * limitedScale,
                                decoration: BoxDecoration(
                                  color: _acceptItems
                                      ? CustomColors.gradientBlue
                                      : CustomColors.littleWhite,
                                  borderRadius: BorderRadius.circular(
                                    scaled(5) * limitedScale,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.lightWhite,
                                      blurRadius: scaled(8) * limitedScale,
                                      offset: Offset(0, scaled(3) * limitedScale),
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: provider.isLoading
                                      ? null
                                      : () async {
                                    if(_formKey.currentState!.validate()){
                                      // Check required fields
                                      if(!_acceptItems) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Please accept terms and conditions')),
                                        );
                                        return;
                                      }

                                      if(UploadedFile == null) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Please upload a company document')),
                                        );
                                        return;
                                      }

                                      // Check phone numbers are entered
                                      if(companyPhoneNo.length < 2) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Please enter company phone number')),
                                        );
                                        return;
                                      }

                                      // Create data in FLAT structure (not nested)
                                      final Map<String, dynamic> formData = {
                                        'fullName': widget.fullName.trim(),
                                        'email': widget.email.trim(),
                                        'password': widget.password.trim(),
                                        'phone[country_code]': widget.phoneNumber[0].trim(),
                                        'phone[number]': widget.phoneNumber[1].trim(),
                                        'jobTitle': widget.selectedType.trim(),
                                        'isCommercial': widget.isCommercial.toString().trim(),
                                        'commercialInformation[commercialRegNum]': _commercialRegisterNo.text.trim(),
                                        'commercialInformation[licenseNumber]': _licenceNo.text.trim(),
                                        'commercialInformation[companyName]': _nameOfTheCompany.text.trim(),
                                        'commercialInformation[companyAddress]': _companyAddress.text.trim(),
                                        'commercialInformation[companyPhone][country_code]': companyPhoneNo[0].trim(),
                                        'commercialInformation[companyPhone][number]': companyPhoneNo[1].trim(),
                                        'commercialInformation[companyWhatsapp][country_code]': companyWhatsappNo.isNotEmpty ? companyWhatsappNo[0].trim() : '',
                                        'commercialInformation[companyWhatsapp][number]': companyWhatsappNo.isNotEmpty ? companyWhatsappNo[1].trim() : '',
                                        'commercialInformation[companyActivity]': _companyActivity.text.trim(),
                                        'commercialInformation[establishmentDate]': _companyEstablishmentData.text.isEmpty ? null : _companyEstablishmentData.text.trim(),
                                      };

                                      // Remove null values
                                      formData.removeWhere((key, value) => value == null || value.toString().isEmpty);

                                      final Map<dynamic, dynamic> completeData = {
                                        'formData': formData,
                                        'documents': UploadedFile,
                                        'commercialInformation[companyDocuments][folderName]': _nameOfFolder.text.isEmpty ? ReplacementUploadedFile : _nameOfFolder.text,
                                      };

                                      print('Sending data:');
                                      formData.forEach((key, value) {
                                        print('$key: $value');
                                      });

                                      provider.signUpScreenCommercial(completeData, context);
                                    }
                                  },
                                  child: Text(
                                    'REGISTER',
                                    style: TextStyle(
                                      fontSize:
                                      Constants.getFontSmall(context) *
                                          limitedScale,
                                      fontFamily: Constants.primaryfont,
                                      color: CustomColors.ghostWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
