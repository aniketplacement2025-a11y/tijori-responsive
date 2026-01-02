import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/services/models/rest_client.dart';
import 'package:vkaps_it_solution_project_tijori/services/settings/print_value.dart';

import '../../auth/update_password_success_popup.dart';

class UpdateNewPasswordProvider with ChangeNotifier{
  bool isLoading = false;

  updateNewPassword(
      Map<dynamic, dynamic> requestBody,
      bool isCommercial,
      BuildContext context,
      ){
    isLoading = true;
    printValue(requestBody, tag: "INPUT TO API");
    notifyListeners();

    RestClient.updateNewPassword(requestBody).then((value){
      isLoading = false;
      printValue(value, tag: "API RESPONSE");
      notifyListeners();

      // Handle response
      if (value['success'] == true) {
        // Navigate to success screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              UpdatePasswordSuccessPopup(isCommercial: isCommercial)
          ),
        );
      } else {
        // Show error message
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(value['message'] ?? 'Update New Password failed'),
          ),
        );
      }
    })
        .onError((error, stackTrace) {
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please Check The Details Error: ${error.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    });
  }
}
