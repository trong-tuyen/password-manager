import 'package:flutter/cupertino.dart';
import 'package:flutter_practice/gen/assets.gen.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.height = 40});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.images.shield.path,
      height: height,
    );
  }
}
