import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/update_new_password.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/dialogs/success_dialog.dart';
import '../../../auth/otp_success_popup.dart';
import '../../../utils/Images.dart';
import '../../models/rest_client.dart';
import '../../settings/print_value.dart';

class VerifyOtpForgotPasswordProvider with ChangeNotifier {
  bool isLoading = false;

  verifyOtpForgotPassword(
    List<String> completePhoneNumber,
    String otpValue,
    bool isCommercial,
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
    RestClient.verifyOtpForgotPassword(requestBody)
        .then((value) {
          isLoading = false;
          printValue(value, tag: "API RESPONSE");
          notifyListeners();

          // Handle response
          if (value['success'] == true) {
            // Navigate to success screen
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => UpdateNewPassword(
                  isCommercial: isCommercial,
                  send_otp_phone_number: completePhoneNumber),
              ),
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
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PLEASE CHECK THE ENTERED OTP IS CORRECT Error: ${error.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
        });
  }
}
