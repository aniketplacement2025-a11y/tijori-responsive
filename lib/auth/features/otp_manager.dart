import 'package:flutter/material.dart';

class OtpManager {
  final int length;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  OtpManager({this.length = 4}){
    controllers = List.generate(
        length, (index) => TextEditingController());
    focusNodes =List.generate(length,
            (index) => FocusNode());
  }

  @override
  // TODO: implement context
  void init() {
    // set up focus node listeners for OTP fields
    for (int i = 0; i < focusNodes.length; i++){
      focusNodes[i].addListener(() {
        if (!focusNodes[i].hasFocus && controllers[i].text.isEmpty) {
          // Handle empty field if needed
        }
      });
    }
  }

  void dispose(){
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
  }

  // function for auto movement
  void onOtpChanged(String value, int index, BuildContext context) {
    if (value.length == 1 && index < length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }}
    // Get final OTP
    String getOtp() {
      return controllers.map((c) => c.text).join();
    }
}