import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/utils/Images.dart';
import 'package:vkaps_it_solution_project_tijori/utils/responsive_media_query.dart';
import 'package:vkaps_it_solution_project_tijori/widgets/dialogs/success_dialog.dart';
import '../../widgets/dialogs/pre_subscription_dialog.dart';
import '../official_landing_page.dart';

class PreSubscriptionController {
  final BuildContext context;
  final bool isCommercial;

  PreSubscriptionController(
      this.context,
      this.isCommercial,
      );

  // Handle Register Button press
  void handleSubscriptionPress({required String planName, required String planPrice}) {
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
      },
    );
  }

  void _navigateToSuccessScreen(BuildContext dialogContext) {
    // Show the success screen with smooth transition
    // Get the height of the dialog (assuming it's 0.4 of screen)
    double dialogHeight = Responsive.screenHeight(context) * 0.42;
    double remainingHeight = Responsive.screenHeight(dialogContext) - dialogHeight;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return SuccessDialog(
          initialHeight: remainingHeight,
          onComplete: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'PAYMENT SUCCESSFUL',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: Responsive.isMobile(context) ? 14 : 16,
                  ),
                ),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(Responsive.value<double>(
                  context,
                  mobile: 16,
                  tablet: 20,
                  desktop: 24,
                )),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OfficialLandingPage(
                  isCommercial: isCommercial,
                ),
              ),
            );
          },
          imageAsset: Images.thumsUp,
          title: 'Payment successful',
          subtitle: 'Congrats! Your subscription is active.',
          buttonText: 'Continue',
          width: Responsive.value<double>(
            context,
            mobile: 250,
            tablet: 275,
            desktop: 300,
          ),
          height: Responsive.value<double>(
            context,
            mobile: 52,
            tablet: 56,
            desktop: 60,
          ),
        );
      },
    );
  }

  // Navigate to Commercial Registration
  void navigateToCommercialRegistration() {
    print('Navigating to commercial Registration...');
    // Navigator.push(context,
    //   MaterialPageRoute(builder: (_) => CommercialRegisterScreen()));
  }
}