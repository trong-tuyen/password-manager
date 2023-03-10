import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/assets.gen.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/widgets/image_app.dart';

// This widget draws a rounded square with a solid background color
// and an image at the center.
class RoundedSquare extends StatelessWidget {
  const RoundedSquare({
    required this.size,
    required this.borderRadius,
    Key? key,
  }) : super(key: key);

  final double size; // The width and height of the square
  final double borderRadius; // The radius of the corners

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: MPTheme.lightTheme.colorScheme.onBackground,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: ImageApp(
          Assets.images.mask.path,
          null,
        ),
      ),
    );
  }
}

// This widget rotates the RoundedSquare by a given angle
class RotatedRoundedSquare extends StatelessWidget {
  const RotatedRoundedSquare({
    required this.size,
    required this.borderRadius,
    required this.angle, // The rotation angle in radians
    Key? key,
  }) : super(key: key);

  final double size; // The width and height of the square
  final double borderRadius; // The radius of the corners
  final double angle; // The rotation angle in radians

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: RoundedSquare(
        size: size,
        borderRadius: borderRadius,
      ),
    );
  }
}
