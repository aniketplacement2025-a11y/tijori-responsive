import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/auth/fields/custom_password_field.dart';
import 'package:vkaps_it_solution_project_tijori/auth/update_password_success_popup.dart';
import 'package:vkaps_it_solution_project_tijori/utils/onboarding_background.dart';
import '../../utils/constants.dart';
import '../../utils/custom_colors.dart';
import '../../utils/Images.dart';
import '../../utils/titles.dart';
import 'features/gradient_button.dart';

class UpdateNewPassword extends StatefulWidget{
  @override
  _UpdateNewPasswordState createState() => _UpdateNewPasswordState();
}

class _UpdateNewPasswordState extends State<UpdateNewPassword>{
  //final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureNewPassword = true;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: OnboardingBackground(
        child: Stack(
           children: [
             // Back Button
             Positioned(
               top: 24,
               left: 12,
                 child:IconButton(
                     onPressed: (){
                       Navigator.pop(context);
                     },
                     icon: Icon(Icons.arrow_back_ios,
                     color: CustomColors.black87),
                 ),
             ),

             // Main Content
             Positioned(
               top: 32,
               left: 0,
               right: 0,
               bottom: 0,
                 child: Container(
                   padding: EdgeInsets.symmetric(horizontal: 18),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       //Title
                       Center(
                         child: Text(
                           'New Password',
                           style: TextStyle(
                             fontFamily: Constants.primaryfont,
                             fontSize: Constants.fontMedium,
                             fontWeight: FontWeight.bold,
                             color: CustomColors.black87,
                           ),
                         ),
                       ),

                       SizedBox(height: Constants.spacingSmall),

                       // Description
                       Center(
                         child: Text(
                           'Please enter a new password',
                           style: TextStyle(
                             fontFamily:Constants.primaryfont,
                             fontSize: Constants.fontSmall,
                             color: CustomColors.blackBS1,
                           ),
                         ),
                       ),

                       SizedBox(height: Constants.spacingMedium),

                       // Reset Password Form
                         Column(
                             children: [
                               CustomPasswordField(
                                   label: 'New Password',
                                   controller: _passwordController,
                                   obscureText: _obscureNewPassword,
                                   onToggle: (){
                                     setState(() {
                                       _obscureNewPassword = !_obscureNewPassword;
                                     });
                                   },
                               ),

                               SizedBox(height: Constants.spacingSmall),

                               //Password Field
                               CustomPasswordField(
                                   label: 'Confirm New Password',
                                   controller: _confirmPasswordController,
                                   obscureText: _obscurePassword,
                                   onToggle: (){
                                     setState(() {
                                       _obscurePassword = !_obscurePassword;
                                     });
                                   },
                                 validator: (value){
                                     if(value == null || value.isEmpty){
                                       return 'Please confirm your new password';
                                     }
                                     if(value != _passwordController.text){
                                       return 'passwords do not match';
                                     }
                                     return null;
                                 },
                               ),// Custom New Password field

                               SizedBox(height: Constants.spacingMedium),

                               // Gradient Button
                               // Verify Button
                               GradientButton(
                                 text: 'CHANGE PASSWORD',
                                 width: 400,
                                 onPressed: (){
                                   print('CLICKED ON CHANGE PASSWORD BUTTON');
                                   Navigator.push(
                                       context, MaterialPageRoute(
                                       builder: (context) => UpdatePasswordSuccessPopup())
                                   );
                                 },
                               ),
                             ],
                           ),
                     ],
                   ),
                 ),
             ),
           ],
        ),
      ),
    );
  }
}
