import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/otp_verification.dart';
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
      bool isCommercial,
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
        Navigator.pushReplacement(
          context, MaterialPageRoute(
          builder: (context) => OTPVerificationPage(
            isCommercial: isCommercial,
            requestBody: requestBody,
          )
        ));
        print('Registration successful: ${response['message']}');
      } else {
        // Show error message
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response['message'] ?? 'Registration failed'),
            backgroundColor: Colors.red,
          ),
        );
        print('Registration failed: ${response['message']}');
      }

    } catch (e) {
      print("API ERROR => ${e.toString()}");
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('REGISTRATION FAILED BECAUSE OF ${e.toString()} PLEASE RE CHECK THE DETAILS'),
          backgroundColor: Colors.red,
        ),
      );
      // Show error to user
    }
  }
}