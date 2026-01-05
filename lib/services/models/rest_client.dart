import 'dart:io';
import '../settings/print_value.dart';
import 'http_helper.dart';

class RestClient {
  static final HttpHelper _httpHelper = HttpHelper();

  static const String baseUrl = "https://tijori-api.vkapsprojects.com/api/v1";

  static Future<dynamic> login(Object requestBody) async {
    Map<String, dynamic> response = await _httpHelper.post(
      url: '$baseUrl/auth/login',
      requestBody: requestBody,
    );
    // If response from api come as List '[]' then we write List<dynamic>
    printValue(response);
    return response;
  }

  static Future<dynamic> signUpPersonalProvider(dynamic requestBody) async {
    Map<String, dynamic> response = await _httpHelper.post(
      url: '$baseUrl/auth/register',
      requestBody: requestBody,
    );
    // If response from api come as List '[]' then we write List<dynamic>
    printValue(response);
    return response;
  }

  static Future<dynamic> personalUserVerifyOtp(dynamic requestBody) async {
    Map<String, dynamic> response = await _httpHelper.post(
        url: '$baseUrl/auth/verify-otp',
      requestBody: requestBody,
    );
    // If response from api come as List '[]' then we write List<dynamic>
    printValue(response);
    return response;
  }

  static Future<dynamic> sendOtpEmail(dynamic requestBody) async {
    Map<String, dynamic> response = await _httpHelper.post(
      url: '$baseUrl/auth/send-otp-email',
      requestBody: requestBody,
    );
    // If response from api come as List '[]' then we write List<dynamic>
    printValue(response);
    return response;
  }

  static Future<dynamic> verifyOtpForgotPassword(dynamic requestBody) async {
    Map<String, dynamic> response = await _httpHelper.post(
      url: '$baseUrl/auth/verify-otp-forgot-password',
      requestBody: requestBody,
    );
    // If response from api come as List '[]' then we write List<dynamic>
    printValue(response);
    return response;
  }

  static Future<dynamic> signUpCommercialProvider(dynamic requestBody) async {
    Map<String, dynamic> response = await _httpHelper.post(
      url: '$baseUrl/auth/register',
      requestBody: requestBody,
    );
    // If response from api come as List '[]' then we write List<dynamic>
    printValue(response);
    return response;
  }

  // PDF Upload API (similar pattern to your verifyOtpForgotPassword)
  static Future<dynamic> signUpScreenCommercial(dynamic requestBody) async {
    try {
      String filePath = requestBody['documents'];
      Map<String, dynamic> formData = requestBody['formData'] ?? {};
      String folderName = requestBody['commercialInformation[companyDocuments][folderName]'];

      // Validate file
      if (filePath == null || filePath.isEmpty) {
        throw Exception('No file selected');
      }

      File file = File(filePath);
      if (!file.existsSync()) {
        throw Exception('File does not exist at path: $filePath');
      }

      // Check file extension
      String extension = filePath.split('.').last.toLowerCase();
      List<String> allowedExtensions = ['pdf', 'jpg', 'jpeg', 'png', 'webp'];

      if (!allowedExtensions.contains(extension)) {
        throw Exception('Invalid file extension: $extension. Allowed: ${allowedExtensions.join(', ')}');
      }

      // Check file size (optional, e.g., 10MB limit)
      int fileSize = file.lengthSync();
      if (fileSize > 10 * 1024 * 1024) { // 10MB
        throw Exception('File size too large: ${fileSize ~/ 1024}KB. Maximum 10MB allowed.');
      }

      printValue('File extension: $extension', tag: "FILE CHECK");
      printValue('File size: ${fileSize ~/ 1024} KB', tag: "FILE CHECK");

      // Check what field names the API expects
      List<Map<String, dynamic>> files = [
        {
          'path': filePath,
          'fieldName': 'documents', // Try different field names
          'commercialInformation[companyDocuments][folderName]':
          folderName ?? '${DateTime.now().millisecondsSinceEpoch}.$extension',
        }
      ];

      printValue('File upload details:', tag: "UPLOAD INFO");
      printValue('  Path: ${files[0]['path']}', tag: "UPLOAD INFO");
      printValue('  Field: ${files[0]['fieldName']}', tag: "UPLOAD INFO");
      printValue('  Name: ${files[0]['commercialInformation[companyDocuments][folderName]']}', tag: "UPLOAD INFO");

      dynamic response = await _httpHelper.postMultipart(
        url: '$baseUrl/auth/register',
        formData: formData,
        files: files,
        isRequireAuthentication: false,
      );

      return response;

    } catch (e) {
      printValue("Signup failed: $e", tag: "ERROR");
      rethrow;
    }
  }

  // VERIFY SIGN UP COMMERCIAL DATA (similar pattern to your verifyOtpForgotPassword)
  static Future<dynamic> verifyOtpCommercialSignUp(dynamic requestBody) async {
    try {
      printValue('OTP Verification request body:', tag: "OTP VERIFY");
      printValue(requestBody, tag: "OTP VERIFY");

      // Based on error, the API expects FLAT parameters, not nested
      String filePath = requestBody['documents']?.toString() ?? '';
      String folderName = requestBody['folderName']?.toString() ?? '';

      // Remove file-related fields from requestBody for the POST
      Map<String, dynamic> postData = Map<String, dynamic>.from(requestBody);

      // Create form data for multipart upload
      Map<String, dynamic> formData = {};

      // Add all fields except file-related ones to formData
      postData.forEach((key, value) {
        if (key != 'documents' && key != 'folderName') {
          formData[key] = value;
        }
      });

      printValue('Form data for OTP verify:', tag: "OTP VERIFY");
      printValue(formData, tag: "OTP VERIFY");

      // Handle file upload if exists
      List<Map<String, dynamic>> files = [];

      if (filePath.isNotEmpty && File(filePath).existsSync()) {
        File file = File(filePath);
        int fileSize = file.lengthSync();

        printValue('Uploading file for OTP verify', tag: "OTP VERIFY");
        printValue('File path: $filePath', tag: "OTP VERIFY");
        printValue('File size: ${fileSize ~/ 1024} KB', tag: "OTP VERIFY");

        files.add({
          'path': filePath,
          'fieldName': 'documents',
          'fileName': folderName.isNotEmpty ? folderName : filePath.split('/').last,
        });
      }

      dynamic response = await _httpHelper.postMultipart(
        url: '$baseUrl/auth/verify-otp',
        formData: formData,
        files: files,
        isRequireAuthentication: false,
      );

      printValue(response,tag: 'Final Response OF API');
      print('Final Response OF API $response');
      return response;

    } catch (e) {
      printValue("OTP Verification failed: $e", tag: "ERROR");
      rethrow;
    }
  }

  static Future<dynamic> sendOtpByPhone(dynamic requestBody) async {
    Map<String, dynamic> response = await _httpHelper.post(
      url: '$baseUrl/auth/forgot-password',
      requestBody: requestBody,
    );
    // If response from api come as List '[]' then we write List<dynamic>
    printValue(response);
    return response;
  }

  static Future<dynamic> updateNewPassword(dynamic requestBody) async {
    Map<String, dynamic> response = await _httpHelper.post(
      url: '$baseUrl/auth/reset-password',
      requestBody: requestBody,
    );
    // If response from api come as List '[]' then we write List<dynamic>
    printValue(response);
    return response;
  }

  static Future<dynamic> MyCategories(dynamic requestBody) async {
    Map<String, dynamic> response = await _httpHelper.get(
        url: '$baseUrl/categories/my-categories',
        isRequireAuthentication: true,
    );
    // If response from api come as List '[]' then we write List<dynamic>
    printValue(response, tag: "My Categories API Response");
    return response;
  }

  static Future<dynamic> GetSubCategoryByCategoryId(dynamic requestBody, String categoryId) async {
    Map<String, dynamic> response = await _httpHelper.get(
        url: '$baseUrl/subcategories/category/$categoryId',
       isRequireAuthentication: true,
    );
    // If response from api come as List '[]' then we write List<dynamic>
    printValue(response, tag: "My Categories API Response");
    return response;
  }
}