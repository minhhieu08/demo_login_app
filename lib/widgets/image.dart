import 'package:flutter/material.dart';

class Image extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  const Image({
    super.key,
    required this.path,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(path),
        ),
      ),
    );
  }
}
