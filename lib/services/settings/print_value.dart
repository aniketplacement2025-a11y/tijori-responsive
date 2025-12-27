import 'dart:convert';
import 'dart:developer';

void printValue(dynamic value, {
  String tag = ""
}){
  try {
    var decodedJson = jsonDecode(value.toString()) as Map<String, dynamic>;
    log("JSON Output: $tag ${const JsonEncoder.withIndent('').convert(decodedJson)}");
  } catch(_){
    if(value is Map){
      log("JSON OUTPUT: $tag ${const JsonEncoder.withIndent('').convert(value)}\n");
    } else {
      print("PRINT OUTPUT: $tag $value \n\n");
    }
  }
}