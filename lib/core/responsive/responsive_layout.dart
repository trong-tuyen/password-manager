import 'package:flutter/material.dart';

// class ResponsiveLayout extends StatelessWidget {
//   final Widget tiny;
//   final Widget phone;
//   final Widget tablet;
//   final Widget largeTablet;
//   final Widget computer;

//   const ResponsiveLayout({
//     required this.tiny,
//     required this.phone,
//     required this.tablet,
//     required this.largeTablet,
//     required this.computer,
//   });

//   static final int tinyHeightLimit = 100;
//   static final int tinyLimit = 270;
//   static final int phoneLimit = 550;
//   static final int tabletLimit = 800;
//   static final int largeTabletLimit = 1100;

//   static bool isTinyHeightLimit(BuildContext context) =>
//       MediaQuery.of(context).size.height < tinyHeightLimit;

//   static bool isTinyLimit(BuildContext context) =>
//       MediaQuery.of(context).size.width < tinyLimit;

//   static bool isPhone(BuildContext context) =>
//       MediaQuery.of(context).size.width < phoneLimit &&
//       MediaQuery.of(context).size.width >= tinyLimit;

//   static bool isTablet(BuildContext context) =>
//       MediaQuery.of(context).size.width < tabletLimit &&
//       MediaQuery.of(context).size.width >= phoneLimit;

//   static bool isLargeTablet(BuildContext context) =>
//       MediaQuery.of(context).size.width < largeTabletLimit &&
//       MediaQuery.of(context).size.width >= tabletLimit;

//   static bool isComputer(BuildContext context) =>
//       MediaQuery.of(context).size.width >= largeTabletLimit;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         if (constraints.maxWidth < tinyLimit ||
//             constraints.maxHeight < tinyHeightLimit) {
//           return tiny;
//         }
//         if (constraints.maxWidth < phoneLimit) {
//           return phone;
//         }
//         if (constraints.maxWidth < tabletLimit) {
//           return tablet;
//         }
//         if (constraints.maxWidth < largeTabletLimit) {
//           return largeTablet;
//         } else {
//           return computer;
//         }
//       },
//     );
//   }
// }

extension MediaQueryHelper on BuildContext {
  static const neckUpWidth = 375; // width of screen
  static const neckUpHeight = 817; //Height of screen
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool SmallDevice() =>
      MediaQuery.of(this).size.width < 382 ||
      MediaQuery.of(this).size.width < 750;
  double sizeWidth(double value) => width * value / neckUpWidth;
  double sizeHeight(double value) => height * value / neckUpHeight;
  double sizeHeightSmall(double value) => SmallDevice()
      ? height * value / neckUpHeight + 20
      : height * value / neckUpHeight;
  double sizeWidthFull() => 0.8 * width - 20;
  double sizeOf(double value) => width * value / neckUpWidth;
  SizedBox sizedBox({double? width, double? height}) {
    if (width != null && height != null) {
      return SizedBox(width: sizeOf(width), height: sizeOf(height));
    } else if (width != null) {
      return SizedBox(width: sizeOf(width));
    } else {
      return SizedBox(height: sizeOf(height!));
    }
  }

  EdgeInsets padding({
    double? horizontal,
    double? vertical,
    double? top,
    double? left,
    double? right,
    double? bottom,
    double? all,
  }) {
    EdgeInsets data = EdgeInsets.zero;
    if (horizontal != null) {
      data = data.copyWith(
          left: sizeOf(SmallDevice() ? horizontal - 10 : horizontal),
          right: sizeOf(SmallDevice() ? horizontal - 10 : horizontal));
    }
    if (vertical != null) {
      data = data.copyWith(top: sizeOf(vertical), bottom: sizeOf(vertical));
    }
    if (horizontal != null) {
      data = data.copyWith(
          left: sizeOf(SmallDevice() ? horizontal - 10 : horizontal),
          right: sizeOf(SmallDevice() ? horizontal - 10 : horizontal));
    }
    if (top != null) {
      data = data.copyWith(
        top: sizeOf(top),
      );
    }
    if (right != null) {
      data = data.copyWith(
        right: sizeOf(right),
      );
    }
    if (bottom != null) {
      data = data.copyWith(
        right: sizeOf(bottom),
      );
    }
    if (left != null) {
      data = data.copyWith(
        right: sizeOf(left),
      );
    }
    if (all != null) {
      data = data.copyWith(
        left: sizeOf(all),
        top: sizeOf(all),
        right: sizeOf(all),
        bottom: sizeOf(all),
      );
    }
    return data;
  }
}
