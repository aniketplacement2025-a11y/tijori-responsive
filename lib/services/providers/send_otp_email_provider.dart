import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/email_otp_verification.dart';
import '../settings/print_value.dart';
import '../models/rest_client.dart';

class SendOtpEmailProvider with ChangeNotifier{
  bool isLoading = false;

  sendOtpEmail(
      Object requestBody,
      bool isCommercial,
      BuildContext context
      ){
    isLoading = true;
    notifyListeners();
    RestClient.sendOtpEmail(requestBody).then((value){
      isLoading = false;
      printValue(value);
      notifyListeners();

      if(value['success'] == true){
        // Navigate to Next Screen and Show Success Message
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => EmailOtpVerification(
              isCommercial: isCommercial,
              email: (requestBody as Map)["email"] ?? '', // Cast to Map
            ),
        ));
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
    }).onError((error, stackTrace){
      print("API ERROR => ${error.toString()}");
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('FORGOT PASSWORD BY EMAIL FAILED PLEASE RE CHECK THE DETAILS'),
          backgroundColor: Colors.red,
        ),
      );
    });
  }
}