import 'package:flutter/material.dart';

class PasswordIndicator extends StatefulWidget {
  const PasswordIndicator({
    required this.passwordController,
    super.key,
  });

  final TextEditingController passwordController;

  @override
  State<PasswordIndicator> createState() => _PasswordIndicatorState();
}

class _PasswordIndicatorState extends State<PasswordIndicator> {
  bool _isAtLeast8Characters = false;
  bool _containsUppercase = false;
  bool _containsLowercase = false;
  bool _containsNumber = false;
  bool _containsSpecialCharacter = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRequirement('At least 8 characters', _isAtLeast8Characters),
        _buildRequirement('Contains an uppercase letter', _containsUppercase),
        _buildRequirement('Contains a lowercase letter', _containsLowercase),
        _buildRequirement('Contains a number', _containsNumber),
        _buildRequirement(
            'Contains a special character', _containsSpecialCharacter),
      ],
    );
  }

  Widget _buildRequirement(String requirement, bool met) {
    return Row(
      children: [
        Icon(
          met ? Icons.check_circle : Icons.cancel,
          color: met ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 8),
        Text(requirement),
      ],
    );
  }
  void _updatePasswordStrength() {
    final password = widget.passwordController.text;

    setState(() {
      _isAtLeast8Characters = password.length >= 8;
      _containsUppercase = password.contains(RegExp(r'[A-Z]'));
      _containsLowercase = password.contains(RegExp(r'[a-z]'));
      _containsNumber = password.contains(RegExp(r'\d'));
      _containsSpecialCharacter = password.contains(RegExp(r'[!@#\$%^&*()]'));
    });
  }
}
