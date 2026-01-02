import 'package:flutter/material.dart';
import '../../utils/custom_colors.dart';

class PasswordValidationChecklist extends StatelessWidget {
  final String password;

  const PasswordValidationChecklist({
    Key? key,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password must:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),

          SizedBox(height: 12),

          // Simple checklist items
          _buildCheckItem('Have at least one lower case character',
              RegExp(r'[a-z]').hasMatch(password)),
          SizedBox(height: 6),
          _buildCheckItem('Have at least one capital letter',
              RegExp(r'[A-Z]').hasMatch(password)),
          SizedBox(height: 6),
          _buildCheckItem('Have at least one number',
              RegExp(r'[0-9]').hasMatch(password)),
          SizedBox(height: 6),
          _buildCheckItem('Be at least 8 characters',
              password.length >= 8),
          SizedBox(height: 6),
          _buildCheckItem('Not contain spaces',
              !password.contains(' ')),
          SizedBox(height: 6),
          _buildCheckItem('Have at least one special character',
              RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)),
        ],
      ),
    );
  }

  Widget _buildCheckItem(String text, bool isValid) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isValid ? CustomColors.gradientBlue : Colors.transparent,
            border: Border.all(
              color: isValid ? CustomColors.gradientBlue : Colors.grey[400]!,
              width: 2,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: isValid ? Colors.grey[800] : Colors.grey[500],
            ),
          ),
        ),
      ],
    );
  }
}