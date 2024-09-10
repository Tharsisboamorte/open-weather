import 'package:flutter/material.dart';
import 'package:open_weather/core/res/app_values.dart';
import 'package:open_weather/core/res/typography.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    required this.editingController,
    required this.fieldLabel,
    super.key,
    this.isPassword = false,
    this.hint,
    this.validator,
  });

  final TextEditingController editingController;
  final bool isPassword;
  final String fieldLabel;
  final String? hint;
  final String? Function(String?)? validator;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.padding23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppValues.padding8,
              vertical: AppValues.padding4,
            ),
            child: Text(
              widget.fieldLabel,
              style: AppTextStyle.instance.body1Medium,
            ),
          ),
          TextFormField(
            validator: widget.validator,
            style: AppTextStyle.instance.body1Medium,
            obscureText: widget.isPassword && isObscured,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: AppValues.padding23,
                horizontal: AppValues.padding16,
              ),
              suffixIcon: Visibility(
                visible: widget.isPassword,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  icon: isObscured
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
                ),
              ),
              hintText: widget.hint,
              hintStyle: AppTextStyle.instance.body1Regular,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
            controller: widget.editingController,
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
