import 'package:flutter/material.dart';
import 'package:open_weather/core/extensions/media_query_values.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton({
    required this.buttonLabel,
    required this.backgroundColor,
    this.width,
    this.height,
    this.isEnabled = true,
    super.key,
    this.onPressed,
  });

  final String buttonLabel;
  final bool isEnabled;
  final WidgetStatePropertyAll<Color> backgroundColor;
  final double? width;
  final double? height;
  final void Function()? onPressed;

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? context.height * .05,
      width: widget.width ?? context.width * .45,
      child: ElevatedButton(
        style: ButtonStyle(
          splashFactory: InkRipple.splashFactory,
          backgroundColor: widget.backgroundColor,
        ),
        onPressed: widget.isEnabled ? widget.onPressed : null,
        child: Text(
          widget.buttonLabel,
        ),
      ),
    );
  }
}
