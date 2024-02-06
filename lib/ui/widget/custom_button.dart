import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String actionText;
  final AsyncCallback onTap;

  const CustomButton({
    super.key,
    required this.actionText,
    required this.onTap,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isLoading
          ? () async {
              setState(() => isLoading = true);
              await widget.onTap();
              setState(() => isLoading = false);
            }
          : null,
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(widget.actionText),
    );
  }
}
