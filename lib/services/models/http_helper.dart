import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:vkaps_it_solution_project_tijori/services/functions/storage_area_of_access_token.dart';
import '../settings/print_value.dart';
import '../settings/toast_message.dart';

class HttpHelper {
  final dio.Dio _dio = dio.Dio();


  Map<String, String> header(bool isRequireAuthentication) {
    if (isRequireAuthentication) {
      // return {"Content-Type":"Application/Json"};
      return {
        "Content-Type": "Application/Json",
       "Authorization": 'Bearer ${StorageAreaOfAccessToken.instance.getToken()}',
      };
    } else {
      return {"Content-Type": "Application/Json"};
    }
  }

  //GET API HANDLE
  Future<dynamic> get({
    required String url,
    bool isRequireAuthentication = false,
  }) async {
    try {
      final apiResponse = await http.get(
        Uri.parse(url),
        headers: header(isRequireAuthentication),
      );
      printValue(url, tag: "API GET URL: ");
      printValue(header(isRequireAuthentication), tag: "API Header: ");
      printValue(apiResponse.body, tag: "API RESPONSE: ");

      return _returnResponse(response: apiResponse);
    } catch (e) {
      return null;
    }
  }

  //POST API HANDLE
  Future<dynamic> post({
    required String url,
    dynamic requestBody,  // Change Object? to dynamic
    bool isRequireAuthentication = false,
  }) async {
    try {
      http.Response apiResponse;

      printValue(url, tag: "API POST URL: ");
      printValue(header(isRequireAuthentication), tag: "API Header: ");

      final headers = header(isRequireAuthentication);
      // Ensure Content-Type is application/json
      headers['Content-Type'] = 'application/json';
      headers['Accept'] = 'application/json';

      if (requestBody != null) {
        printValue(requestBody, tag: "API REQUEST BODY: ");

        // Only encode if it's not already a string
        if (requestBody is String) {
          apiResponse = await http.post(
            Uri.parse(url),
            body: requestBody,
            headers: headers,
          );
        } else {
          // Encode Map/List to JSON string
          apiResponse = await http.post(
            Uri.parse(url),
            body: jsonEncode(requestBody),
            headers: headers,
          );
        }
      } else {
        apiResponse = await http.post(
          Uri.parse(url),
          headers: headers,
        );
      }

      printValue(apiResponse.statusCode, tag: "API STATUS CODE: ");
      printValue(apiResponse.body, tag: "API RESPONSE: ");

      return _returnResponse(response: apiResponse);
    } catch (e) {
      printValue("POST Request Failed: $e", tag: "API ERROR: ");
      printValue(e.toString(), tag: "STACK TRACE: ");
      rethrow; // Rethrow to handle in calling code
    }
  }

  // POST MULTIPART API HANDLE
  Future<dynamic> postMultipart({
    required String url,
    Map<String, dynamic>? formData,
    List<Map<String, dynamic>>? files,
    bool isRequireAuthentication = false,
  }) async {
    try {
      final formDataPayload = dio.FormData();

      // 1. Add form fields
      if (formData != null) {
        print('\n=== FORM FIELDS BEING SENT ===');
        formData.forEach((key, value) {
          if (value != null) {
            print('$key: $value (${value.runtimeType})');
            formDataPayload.fields.add(MapEntry(key, value.toString()));
          }
        });
        print('=== END FORM FIELDS ===\n');
      }

      // 2. Add files
      if (files != null && files.isNotEmpty) {
        print('\n=== FILES BEING UPLOADED ===');
        for (var file in files) {
          final filePath = file['path'];
          final fieldName = file['fieldName'] ?? 'documents';
          final fileName = file['commercialInformation[companyDocuments][folderName]'] ?? filePath.split('/').last;

          print('File Path: $filePath');
          print('Field Name: $fieldName');
          print('File Name: $fileName');

          if (filePath != null && File(filePath).existsSync()) {
            print('File exists and will be uploaded');

            // Option 1: Simple approach without explicit MIME type
            // formDataPayload.files.add(MapEntry(
            //   fieldName,
            //   await dio.MultipartFile.fromFile(
            //     filePath,
            //     filename: fileName,
            //   ),
            // ));

            // Option 3: Is Check File Content Type in HTTP Helper.dart
            // Read file as bytes first
            List<int> fileBytes = await File(filePath).readAsBytes();

            // Create multipart file from bytes (not from file)
            var multipartFile = dio.MultipartFile.fromBytes(
              fileBytes,
              filename: fileName,
            );

            formDataPayload.files.add(MapEntry(fieldName, multipartFile));


            // Option 2: With MIME type detection (if needed)
          // final mimeType = lookupMimeType(filePath);
          // print('Detected MIME type: $mimeType');
          //
          // if (mimeType != null) {
          //   formDataPayload.files.add(MapEntry(
          //     fieldName,
          //     await dio.MultipartFile.fromFile(
          //       filePath,
          //       filename: fileName,
          //       contentType: dio.Headers.jsonMimeType, // You can create custom content type
          //     ),
          //   ));
          // } else {
          //   formDataPayload.files.add(MapEntry(
          //     fieldName,
          //     await dio.MultipartFile.fromFile(
          //       filePath,
          //       filename: fileName,
          //     ),
          //   ));
          // }
          } else {
            print('WARNING: File does not exist or path is null');
          }
        }
        print('=== END FILES ===\n');
      }

      // 3. Make request with timeout
      final response = await _dio.post(
        url,
        data: formDataPayload,
        options: dio.Options(
          headers: await _getDioHeaders(isRequireAuthentication),
          contentType: 'multipart/form-data',
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      printValue('Response Status: ${response.statusCode}', tag: "API RESPONSE");
      printValue('Response Data: ${response.data}', tag: "API RESPONSE");

      return response.data;

    } catch (e) {
      if (e is dio.DioException) {
        printValue('Dio Error Type: ${e.type}', tag: "DIO ERROR");
        printValue('Dio Error Message: ${e.message}', tag: "DIO ERROR");
        printValue('Dio Error Response: ${e.response?.data}', tag: "DIO ERROR");
        printValue('Dio Error Status: ${e.response?.statusCode}', tag: "DIO ERROR");
      }
      rethrow;
    }
  }

  // Helper method for headers
  Future<Map<String, dynamic>> _getDioHeaders(bool isRequireAuthentication) async {
    final headers = <String, dynamic>{
      'Accept': 'application/json',
    };

    if (isRequireAuthentication) {
      // Add your auth token here (from shared_preferences)
      // final token = await SharedPreferences.getInstance()
      //   .then((prefs) => prefs.getString('auth_token'));
      // if (token != null) {
      //   headers['Authorization'] = 'Bearer $token';
      // }
    }

    return headers;
  }


  //PUT API HANDLE
  Future<dynamic> put({
    required String url,
    Object? requestBody,
    bool isRequireAuthentication = false,
  }) async {
    try {
      http.Response apiResponse;
      if (requestBody == null)
        apiResponse = await http.put(Uri.parse(url));
      else {
        apiResponse = await http.put(Uri.parse(url), body: requestBody);
      }
      printValue(url, tag: "API GET URL: ");
      printValue(requestBody, tag: "API REQ BODY: ");
      printValue(header(isRequireAuthentication), tag: "API Header: ");
      printValue(apiResponse.body, tag: "API RESPONSE: ");

      return _returnResponse(response: apiResponse);
    } catch (e) {
      return null;
    }
  }

  //PATCH API HANDLE
  Future<dynamic> patch({
    required String url,
    Object? requestBody,
    bool isRequireAuthentication = false,
  }) async {
    try {
      http.Response apiResponse;
      if (requestBody == null)
        apiResponse = await http.patch(
          Uri.parse(url),
          headers: header(isRequireAuthentication),
        );
      else {
        apiResponse = await http.patch(
          Uri.parse(url),
          body: requestBody,
          headers: header(isRequireAuthentication),
        );
      }
      printValue(url, tag: "API PATCH URL: ");
      printValue(requestBody, tag: "API REQ BODY: ");
      printValue(header(isRequireAuthentication), tag: "API Header: ");
      printValue(apiResponse.body, tag: "API RESPONSE: ");

      return _returnResponse(response: apiResponse);
    } catch (e) {
      return null;
    }
  }

  //DELETE API HANDLE
  Future<dynamic> delete({
    required String url,
    Object? requestBody,
    bool isRequireAuthentication = false,
  }) async {
    try {
      http.Response apiResponse;
      if (requestBody == null)
        apiResponse = await http.delete(
          Uri.parse(url),
          headers: header(isRequireAuthentication),
        );
      else {
        apiResponse = await http.delete(
          Uri.parse(url),
          body: requestBody,
          headers: header(isRequireAuthentication),
        );
      }
      printValue(url, tag: "API PATCH URL: ");
      printValue(requestBody, tag: "API REQ BODY: ");
      printValue(header(isRequireAuthentication), tag: "API Header: ");
      printValue(apiResponse.body, tag: "API RESPONSE: ");

      return _returnResponse(response: apiResponse);
    } catch (e) {
      return null;
    }
  }

  dynamic _returnResponse({required http.Response response}) {
    final String responseString = response.body;
    final int statusCode = response.statusCode;

    printValue('Status Code: $statusCode');
    printValue('Response Body: $responseString');

    final decodedResponse = json.decode(responseString);

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        printValue("Response Json: $responseJson");
        return responseJson;

      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;

      case 400:
      // Print detailed 400 error
        printValue('=== 400 BAD REQUEST DETAILS ===');
        printValue('Headers sent: ${response.request?.headers}');
        printValue('URL: ${response.request?.url}');
        printValue('Error details: $decodedResponse');
        printValue('=== END 400 DETAILS ===');

        throw Exception('Bad Request: ${decodedResponse['message'] ?? 'Unknown error'}');

      case 403:
        var decodeError = json.decode(response.body);
        if (decodeError.containsKey['error']) {
          toastMessage(decodeError['error'].toString());
        }
        throw Exception('API ERROR STATUS CODE 403');

      case 401:
        //StorageHelper().clear();
        // navigatorKey.currentState!.pushReplacement(
        //   MaterialPageRoute(builder: (context) => LoginScreen()),
        // );
        throw Exception('UNAUTHORIZED 401');

      case 503:
        throw Exception(
          'Error occurred while Communication with Server StatusCode 500',
        );

      default:
        throw Exception(
          'Error occurred while Communication with Server with StatusCode ${response.statusCode.toString()}',
        );
    }
  }
}
