import 'package:flutter/material.dart';
import '../../auth/otp_success_popup.dart';
import '../settings/print_value.dart';
import '../models/rest_client.dart';



class CommercialUserVerifyOtpProvider extends ChangeNotifier {
  bool isLoading = false;

  verifyOtpCommercialSignUp(
      Map<String, dynamic> userData, // Changed to Map<String, dynamic>
      BuildContext context,
      ) async {
    try {
      isLoading = true;
      notifyListeners();
      printValue(userData, tag: "API REQUEST");

      dynamic value = await RestClient.verifyOtpCommercialSignUp(userData);

      isLoading = false;
      printValue(value, tag: "API RESPONSE");
      notifyListeners();

      if (value['success'] == true) {
        print("MISSION COMMERCIAL PAGE REGISTRATION USER SUCCESS");

        Navigator.push(context, MaterialPageRoute(
            builder: (context) => OtpSuccessPopup()
        ));
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