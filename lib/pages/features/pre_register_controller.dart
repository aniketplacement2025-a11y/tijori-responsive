import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/personal_register_page.dart';

import '../../widgets/dialogs/pre_register_dialogs.dart';

class PreRegisterController {
  final BuildContext context;

  PreRegisterController(this.context);

  // Handle REGISTER Button press
  void handleRegisterPress(){
    print('REGISTER button pressed');

    showDialog(
        context: context,
        builder: (BuildContext context){
          return PreRegisterDialog(
            onUserTypeSelected:(String userType){
              print('User selected: $userType');

              if(userType == 'personal'){
                navigateToPersonalRegistration();
              } else if(userType == 'commercial'){
                navigateToCommercialRegistration();
              }
            },
          );
        },
    );
  }

  // Navigate to Personal Registration
 void navigateToPersonalRegistration(){
   Navigator.push(context,
       MaterialPageRoute(
           builder: (_) => PersonalRegisterPage()
       )).then((_) {
     // Then close the dialog if needed, or let it auto-close
     Navigator.of(context).pop();
   });
    print('Navigating to Personal Registration...');
 }

  // Navigate to Commercial Registration
 void navigateToCommercialRegistration(){
    print('Navigating to commercial Registration...');
   // Navigator.push(context,
   //   MaterialPageRoute(builder: (_) => CommercialRegisterScreen()));
  }
}