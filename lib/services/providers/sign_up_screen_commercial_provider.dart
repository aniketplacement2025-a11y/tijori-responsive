import 'package:flutter/material.dart';
import '../../auth/commercial_otp_verification.dart';
import '../settings/print_value.dart';
import '../models/rest_client.dart';

class SignUpScreenCommercialProvider extends ChangeNotifier{
  bool isLoading = false;

  signUpScreenCommercial(
      Map<dynamic, dynamic> userData,
      BuildContext context,
      ) async {
    try {
      isLoading = true;
      notifyListeners();

      printValue(userData, tag: "API REQUEST");

      dynamic value = await RestClient.signUpScreenCommercial(userData);

      isLoading = false;
      printValue(value, tag: "API RESPONSE");
      notifyListeners();

      if (value['success'] == true) {
        print("MISSION COMMERCIAL PAGE SUCCESS");
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                CommercialOtpVerification(requestBody: userData),
            ),
        );
        // Handle success
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(value['message'] ?? 'Registration failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );

      printValue(e.toString(), tag: "CATCH ERROR");
    }
  }
}