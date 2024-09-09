import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton({
    required this.buttonLabel,
    this.isEnabled = true,
    super.key,
  });

  final String buttonLabel;
  final bool isEnabled;

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isEnabled ? () {} : null,
      child: Text(
        widget.buttonLabel,
      ),
    );
  }
}
