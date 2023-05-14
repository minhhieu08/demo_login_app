import 'package:agribank_app/widgets/text_form_input_custom.dart';
import 'package:flutter/material.dart';

class TextFormInputPassword extends StatefulWidget {
  final bool isDisabled;
  final String? Function(String value)? validatorFunc;

  const TextFormInputPassword({
    super.key,
    this.isDisabled = false,
    this.validatorFunc,
  });

  @override
  State<TextFormInputPassword> createState() => _TextFormInputPasswordState();
}

class _TextFormInputPasswordState extends State<TextFormInputPassword> {
  bool _isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormInputCustom(
      label: 'Mật khẩu',
      placeholder: 'Nhập mật khẩu của bạn',
      prefixIcon: const Icon(Icons.lock),
      obscureText: !_isShowPassword,
      isDisabled: widget.isDisabled,
      validatorFunc: (value) {
        return widget.validatorFunc!(value);
      },
      suffixIcon: IconButton(
        onPressed: () => {
          setState(() {
            _isShowPassword = !_isShowPassword;
          })
        },
        icon: Icon(_isShowPassword
            ? Icons.remove_red_eye_sharp
            : Icons.remove_red_eye),
      ),
    );
  }
}
