import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vkaps_it_solution_project_tijori/pages/official_landing_page.dart';
import 'package:vkaps_it_solution_project_tijori/services/functions/storage_area_of_access_token.dart';
import '../settings/print_value.dart';
import '../models/rest_client.dart';

class LoginProvider with ChangeNotifier{
  bool isLoading = false;

  login(
      Object requestBody,
      bool isCommercial,
      BuildContext context
      ){
    isLoading = true;
    notifyListeners();
    RestClient.login(requestBody).then((value){
      isLoading = false;

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

      if (value['success'] == true) {
        print("MISSION COMMERCIAL PAGE SUCCESS");

        if(value['data']['user']['role']['name'] == "COMMERCIAL_USER")
          isCommercial = true;

        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                OfficialLandingPage(isCommercial: isCommercial),
            ),
        );
        // Handle success
      } else {
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(value['message'] ?? 'Registration failed'),
            backgroundColor: Colors.red,
          ), );
      }
      });
      notifyListeners();
    }).onError((error, stackTrace){
      print("API ERROR => ${error.toString()}");
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed Please Recheck Email Password ${error.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    });
  }
}