import 'package:flutter/material.dart';
import '../../auth/otp_success_popup.dart';
import '../models/rest_client.dart';
import '../settings/print_value.dart';

class VerifyOtpForgotPasswordProvider with ChangeNotifier {
  bool isLoading = false;

  verifyOtpForgotPassword(
    List<String> completePhoneNumber,
    String otpValue,
    BuildContext context,
  ) {
    isLoading = true;

    // Proceed with verification
    Map<dynamic, dynamic> requestBody = {
      'phone': {
        "country_code": completePhoneNumber[0].toString(),
        "number": completePhoneNumber[1].toString(),
      },
      'otp': otpValue,
    };

    print('DEBUG: About to print verificationData');
    print('$requestBody : Verification Data');
    print('DEBUG: After printValue');

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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OtpSuccessPopup()));
          } else {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(value['message'] ?? 'Verification failed'),
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          print("API ERROR => ${error.toString()}");
        });
  }
}
