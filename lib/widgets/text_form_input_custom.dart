import 'package:flutter/material.dart';

class TextFormInputCustom extends StatelessWidget {
  final String? placeholder;
  final String label;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool isDisabled;
  final bool obscureText;
  final String? Function(String value)? validatorFunc;
  final Function(String value)? onChanged;

  const TextFormInputCustom({
    super.key,
    this.placeholder,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.isDisabled = false,
    this.obscureText = false,
    this.validatorFunc,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: !isDisabled,
      obscureText: obscureText,
      validator: (value) {
        if (validatorFunc != null) {
          validatorFunc!(value!);
        }
      },
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      decoration: InputDecoration(
        hintText: placeholder ?? '',
        labelText: label,
        hintMaxLines: 1,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: isDisabled,
      ),
    );
  }
}
