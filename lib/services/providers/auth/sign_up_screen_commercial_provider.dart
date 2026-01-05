import 'package:flutter/material.dart';
import '../../../auth/commercial_otp_verification.dart';
import '../../functions/storage_area_of_access_token.dart';
import '../../settings/print_value.dart';
import '../../models/rest_client.dart';

class SignUpScreenCommercialProvider extends ChangeNotifier{
  bool isLoading = false;

  signUpScreenCommercial(
      Map<dynamic, dynamic> userData,
      bool isCommercial,
      BuildContext context,
      ) async {
    try {
      isLoading = true;
      notifyListeners();

      printValue(userData, tag: "API REQUEST");

      dynamic value = await RestClient.signUpScreenCommercial(userData);

      isLoading = false;
      registerToken(value);
      printValue(value, tag: "API RESPONSE");
      notifyListeners();


      if (value['success'] == true) {
        print("MISSION COMMERCIAL PAGE SUCCESS");

        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                CommercialOtpVerification(
                    requestBody: userData,
                   isCommercial: isCommercial,
                ),
            ),
        );
        // Handle success
      } else {
        // Show error message
        isLoading = false;
        notifyListeners();
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
          content: Text('SIGN UP COMMERCIAL FAILED BECAUSE OF ${e.toString()} ERROR'),
          backgroundColor: Colors.red,
        ),
      );

      printValue(e.toString(), tag: "CATCH ERROR");
    }
  }

  void registerToken(dynamic value){
    printValue("${value['data']['access_token']}", tag: 'Access token');
    printValue("${value['data']['user']['role']['name']}", tag: 'Consumer Role');
    printValue("${value['data']['user']['fullName']}", tag: 'Full Name');
    printValue("${value['data']['user']['email']}", tag: 'Email Name');
    printValue("${value['data']['user']['phone']}", tag: 'Phone Number');
    // Make sure to await the token saving
    StorageAreaOfAccessToken.instance.setToken(value!['data']['access_token'] ?? "")
        .then((_){
      StorageAreaOfAccessToken.instance.setRole(value!['data']['user']['role']['name'] ?? "");
      StorageAreaOfAccessToken.instance.setName(value!['data']['user']['fullName'] ?? "");
      StorageAreaOfAccessToken.instance.setEmail(value!['data']['user']['email'] ?? "");

      List<String> phone = [
        value['data']['user']['phone']['country_code'],
        value['data']['user']['phone']['number']
      ];

      print("Phone Number ${phone}");
      StorageAreaOfAccessToken.instance.setPhone(phone);
  });
  }
}