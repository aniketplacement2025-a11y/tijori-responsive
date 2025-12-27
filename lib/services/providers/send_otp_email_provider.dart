import 'package:flutter/material.dart';
import '../settings/print_value.dart';
import '../models/rest_client.dart';

class SendOtpEmailProvider with ChangeNotifier{
  bool isLoading = false;

  sendOtpEmail(Object requestBody, BuildContext context){
    isLoading = true;
    notifyListeners();
    RestClient.sendOtpEmail(requestBody).then((value){
      isLoading = false;
      printValue(value);
      notifyListeners();
    }).onError((error, stackTrace){
      print("API ERROR => ${error.toString()}");
    });
  }
}