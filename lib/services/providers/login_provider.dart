import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vkaps_it_solution_project_tijori/pages/official_landing_page.dart';
import '../settings/print_value.dart';
import '../models/rest_client.dart';

class LoginProvider with ChangeNotifier{
  bool isLoading = false;

  login(Object requestBody, BuildContext context){
    isLoading = true;
    notifyListeners();
    RestClient.login(requestBody).then((value){
      isLoading = false;
      printValue(value);
      if (value['success'] == true) {
        print("MISSION COMMERCIAL PAGE SUCCESS");
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                OfficialLandingPage(),
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
      notifyListeners();
    }).onError((error, stackTrace){
      print("API ERROR => ${error.toString()}");
    });
  }
}