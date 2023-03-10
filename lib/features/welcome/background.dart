import 'package:flutter/cupertino.dart';
import 'package:flutter_practice/gen/assets.gen.dart';
import 'package:flutter_practice/core/themes/theme.dart';

class Background extends StatelessWidget {
  const Background({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          // this is image background
          image: AssetImage(Assets.images.fill.path),
          alignment: const Alignment(0.4, -0.6),
          fit: BoxFit.contain,
        ),
        gradient: RadialGradient(
          radius: 0.4,
          center: const Alignment(0.6221, -0.6221),
          colors: <Color>[
            //this is background color of welcome page
            MPTheme.primaryBackgroundColor,
            MPTheme.lightTheme.colorScheme.onBackground,
          ],
        ),
      ),
      child: child,
    );
  }
}
