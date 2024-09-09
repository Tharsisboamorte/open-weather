import 'package:flutter/material.dart';
import 'package:open_weather/core/utils/constants/strings.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.editingController,
    required this.fieldLabel,
    this.isPassword = false,
    this.isObscured = true,
    super.key,
  });

  final TextEditingController editingController;
  final bool? isPassword;
  final String fieldLabel;
  final bool? isObscured;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldLabel),
        TextFormField(
          style: const TextStyle(),
          obscureText: isPassword! && isObscured!,
          decoration: InputDecoration(
            suffixIcon: Visibility(
              visible: isPassword!,
              child: const Icon(Icons.remove_red_eye_outlined),
            ),
            hintText: Strings.emailHint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
          controller: editingController,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
