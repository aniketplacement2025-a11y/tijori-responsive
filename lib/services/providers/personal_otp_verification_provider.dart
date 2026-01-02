import 'package:flutter/material.dart';
import '../../auth/otp_success_popup.dart';
import '../settings/print_value.dart';
import '../models/rest_client.dart';

class PersonalOtpVerificationProvider with ChangeNotifier {
  bool isLoading = false;

  personalUserVerifyOtp(
    Map<dynamic, dynamic> requestBody,
    bool isCommercial,
    BuildContext context,
  ) {
    isLoading = true;
    printValue(requestBody, tag: "INPUT TO API");
    notifyListeners();
    RestClient.personalUserVerifyOtp(requestBody)
        .then((value) {
          isLoading = false;
          printValue(value, tag: "API RESPONSE");
          notifyListeners();

          // Handle response
          if (value['success'] == true) {
            // Navigate to success screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtpSuccessPopup(
                isCommercial: isCommercial,
              )),
            );
          } else {
            // Show error message
            isLoading = false;
            notifyListeners();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(value['message'] ?? 'Verification failed'),
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          print("API ERROR => ${error.toString()}");
          isLoading = false;
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Registration failed Please Recheck Otp'),
              backgroundColor: Colors.red,
            ),
          );
        });
  }
}
