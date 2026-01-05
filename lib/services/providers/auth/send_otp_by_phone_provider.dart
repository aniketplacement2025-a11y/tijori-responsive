import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/verify_otp_forgot_password.dart';
import 'package:vkaps_it_solution_project_tijori/services/models/rest_client.dart';

import '../../../utils/Images.dart';
import '../../../widgets/dialogs/success_dialog.dart';
import '../../settings/print_value.dart';

class SendOtpByPhoneProvider with ChangeNotifier {
  bool isLoading = false;

  sendOtpByPhoneProvider(
      List<String> completePhoneNumber,
      bool isCommercial,
      BuildContext context,
      ){
    isLoading = true;

    // Proceed with verification
    Map<dynamic, dynamic> requestBody = {
      'phone': {
        "country_code": completePhoneNumber[0].toString(),
        "number": completePhoneNumber[1].toString(),
      },
    };

    print('DEBUG: About to print verificationData');
    print('$requestBody : Verification Data');
    print('DEBUG: After printValue');

    printValue(requestBody, tag: "INPUT TO API");
    notifyListeners();

    RestClient.sendOtpByPhone(requestBody).then((value){
      isLoading = false;
      printValue(value, tag: "API RESPONSE");
      notifyListeners();

      // Handle response
      if (value['success'] == true) {
        print("SUCCESSFULLY GENERATED BODY");
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context){
              return SuccessDialog(
                initialHeight: 200,
                onComplete: (){
                  // Navigate to success screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerifyOtpForgotPassword(
                          isCommercial: isCommercial,
                          completePhoneNumber: completePhoneNumber
                      ), ), );
                },
                imageAsset: Images.right,
                title: 'OTP : ${value['data']['otp']}',
                subtitle: 'PLEASE REMEMBER OTP IT REQUIRED ON THE NEXT PAGE',
              );
            }
        );
      }
      else {
        // Show error message
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(value['message'] ?? 'Verification failed'),
          ),
        );
      }
    }).onError((error, stackTrace) {
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('SEND OTP BY PHONE FAILED BECAUSE OF ${error.toString()} Error'),
          backgroundColor: Colors.red,
        ),
      );

      printValue(error.toString(), tag: "CATCH ERROR");
    });
  }
}