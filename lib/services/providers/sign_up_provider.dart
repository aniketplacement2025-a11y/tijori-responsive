import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/rest_client.dart';
import '../settings/print_value.dart';

void debugRequestBody(Map<dynamic, dynamic> body) {
  print('=== DEBUG REQUEST BODY ===');
  print('Type: ${body.runtimeType}');
  print('Full structure:');
  print(jsonEncode(body));
  print('=== END DEBUG ===');
}

class SignUpProvider with ChangeNotifier {
  bool isLoading = false;

  Future<void> signUpPersonalProvider(
      Map<dynamic, dynamic> requestBody,  // Change Object to Map<String, dynamic>
      BuildContext context) async {      // Make it async
    try {
      printValue(requestBody, tag: "INPUT TO API");
      isLoading = true;
      notifyListeners();

      debugRequestBody(requestBody);

      // Call the API
      final response = await RestClient.signUpPersonalProvider(requestBody);

      isLoading = false;
      printValue(response);
      notifyListeners();

      // Handle success
      if (response['success'] == true) {
        // Navigate to OTP screen or show success message
        // Navigator.pushReplacement(
        //   context, MaterialPageRoute(
        //   builder: (context) => PersonalOtpVerification(
        //     requestBody: requestBody,
        //   )
        // ));
        print('Registration successful: ${response['message']}');
      } else {
        // Show error message
        print('Registration failed: ${response['message']}');
      }

    } catch (e) {
      isLoading = false;
      notifyListeners();
      print("API ERROR => ${e.toString()}");
      // Show error to user
    }
  }
}