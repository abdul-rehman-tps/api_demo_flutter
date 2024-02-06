import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String label;

  final bool supportObscure;

  const CustomInputField({
    super.key,
    required this.label,
    this.supportObscure = false,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool isTextHidden = false;

  @override
  void initState() {
    super.initState();
    if (widget.supportObscure) isTextHidden = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        labelText: widget.label,
        border: const UnderlineInputBorder(),
        suffixIcon: widget.supportObscure
            ? IconButton(
                icon: Icon(
                  isTextHidden ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () => setState(() => isTextHidden = !isTextHidden),
              )
            : null,
      ),
      obscureText: isTextHidden,
    );
  }
}
