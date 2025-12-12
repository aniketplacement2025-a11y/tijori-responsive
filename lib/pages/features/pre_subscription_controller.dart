import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/Images.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/dialogs/success_dialog.dart';

import '../../widgets/dialogs/pre_subscription_dialog.dart';
import '../official_landing_page.dart';

class PreSubscriptionController {
  final BuildContext context;

  PreSubscriptionController(this.context);

  // Handle Register Button press
 void handleSubscriptionPress({required String planName, required String planPrice}){
   print('SUBSCRIBE button pressed for $planName plan');

   showModalBottomSheet(
       context: context,
       isScrollControlled: true,
       backgroundColor: Colors.transparent,
       builder: (_) {
         return PreSubscriptionDialog(
           planName: planName,
           planPrice: planPrice,
           onClose: () {
             Navigator.of(context).pop();
           },
           onConfirm: () {
             // Handle payment confirmation
             // You can navigate to success screen here
             print('Payment confirmed for $planName plan');
             _navigateToSuccessScreen(context);
           },
         );
        });  }

  void _navigateToSuccessScreen(BuildContext dialogContext) {
    // Show the success screen with smooth transition
    // Get the height of the dialog (assuming it's 0.7 of screen)
    double dialogHeight = Responsive.screenHeight(context) * 0.5;
    double remainingHeight = Responsive.screenHeight(dialogContext) - dialogHeight;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return SuccessDialog(
          initialHeight: remainingHeight,
          onComplete: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('PAYMENT SUCCESSFULL'),
              ),
            );
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => OfficialLandingPage()
            ),);
          },
          imageAsset: Images.thumsUp,
          title: 'Payment successful',
          subtitle: 'Congrats! Your subscription is active.',
          buttonText: 'Continue',
        );
      },
    );
 }
}

  // // Navigate to Personal Registration
  // void navigateToPersonalRegistration(){
  //   Navigator.push(context,
  //       MaterialPageRoute(
  //           builder: (_) => PreSubscriptionSuccess()
  //       )).then((_) {
  //     // Then close the dialog if needed, or let it auto-close
  //     Navigator.of(context).pop();
  //   });
  //   print('Navigating to Personal Registration...');
  // }

  // Navigate to Commercial Registration
  void navigateToCommercialRegistration(){
    print('Navigating to commercial Registration...');
    // Navigator.push(context,
    //   MaterialPageRoute(builder: (_) => CommercialRegisterScreen()));
  }