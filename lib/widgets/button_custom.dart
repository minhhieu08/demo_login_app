import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isDisabled;
  const ButtonCustom({
    super.key,
    required this.text,
    this.onPressed,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (!isDisabled) {
              return Colors.white;
            }

            return const Color(0xFFB10044);
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (!isDisabled) {
              return const Color(0xFFB10054);
            }

            return const Color(0xFFB10044).withOpacity(0.01);
          },
        ),
        minimumSize: MaterialStateProperty.all(const Size.fromHeight(55)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}
