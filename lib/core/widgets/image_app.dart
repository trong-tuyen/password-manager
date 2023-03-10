import 'package:flutter/material.dart';

class ImageApp extends StatelessWidget {
  const ImageApp(this.assetImage, this.padding, {super.key});
  final String assetImage;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.only(top: 10),
      child: Image.asset(
        assetImage,
      ),
    );
  }
}
