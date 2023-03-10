import 'package:flutter/material.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'text.dart';

// Base class for MPButton with a required onPress function and optional child widget
class MPButton extends StatelessWidget {
  const MPButton({
    required this.onPress, // Required callback function
    Key? key,
    this.children,
  }) : super(key: key);

  // Text button factory constructor
  const factory MPButton.text({
    required String text,
    required VoidCallback onPress,
  }) = _MPButtonText;

  // Secondary button factory constructor
  const factory MPButton.second({
    required String text,
    required VoidCallback onPress,
  }) = _MPSecondButton;

  // Primary button factory constructor
  const factory MPButton.primary({
    required String text,
    required VoidCallback onPress,
    Color? colorBorder,
    Color? backgroundColor,
  }) = _MPPrimaryButton;

  // Card password button factory constructor
  const factory MPButton.cardPassword({
    required String text,
    required VoidCallback onPress,
    required double width,
    Color? backgroundColor,
  }) = _MPButtonCardPassword;

  // Floating button factory constructor
  const factory MPButton.floating({
    required Widget child,
    required VoidCallback onPress,
    required String heroTag,
  }) = _MPFloatingButton;

  // Alert button factory constructor
  const factory MPButton.alert({
    required String text,
    required VoidCallback onPress,
  }) = _MPFAlertButton;

  final Widget? children; // Optional child widget
  final VoidCallback onPress; // Callback function for button press

  @override
  Widget build(BuildContext context) {
    return Container(
      child: children,
    );
  }
}

// Secondary button with text
class _MPSecondButton extends MPButton {
  const _MPSecondButton({
    required VoidCallback onPress,
    required this.text,
  }) : super(onPress: onPress);

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: MPTheme.lightTheme.colorScheme.onBackground,
      onTap: onPress,
      child: SmallBody(
        text: text,
        color: MPTheme.lightTheme.colorScheme.onSurface,
        hasUpperCase: false,
      ),
    );
  }
}

// Primary button with outline style
class _MPPrimaryButton extends MPButton {
  const _MPPrimaryButton({
    required VoidCallback onPress,
    required this.text,
    this.colorBorder,
    this.backgroundColor,
  }) : super(onPress: onPress);

  final String text;
  final Color? colorBorder;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 1,
          color: colorBorder ?? MPTheme.lightTheme.colorScheme.onSecondary,
        ),
        backgroundColor:
            backgroundColor ?? MPTheme.lightTheme.colorScheme.onSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: MediumBody(
        text: text,
        hasUpperCase: false,
      ),
    );
  }
}

// Card password button with material style
class _MPButtonCardPassword extends MPButton {
  const _MPButtonCardPassword({
    required VoidCallback onPress,
    required this.text,
    required this.width,
    this.backgroundColor,
  }) : super(onPress: onPress);

  final String text; // The text displayed on the button
  final double width; // The width of the button
  final Color? backgroundColor; // The background color of the button

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
            color: MPTheme.lightTheme.colorScheme.onPrimary, width: 1),
      ),
      height: 28,
      minWidth: (width - 90) / 2,
      onPressed: onPress,
      color: backgroundColor,
      child: SmallLabel(
          text: text,
          color: text == 'Open app'
              ? null
              : MPTheme.lightTheme.colorScheme.onPrimary,
          hasUpperCase: false),
    );
  }
}

// A custom floating action button
class _MPFloatingButton extends MPButton {
  const _MPFloatingButton(
      {required super.onPress, required this.child, required this.heroTag});

  final Widget child;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: heroTag == 'btn1'
            ? MPTheme.lightTheme.colorScheme.onBackground
            : null,
        elevation: 0,
        onPressed: onPress,
        child: child);
  }
}

// A custom button with text
class _MPButtonText extends MPButton {
  const _MPButtonText({
    required super.onPress,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPress,
        style: OutlinedButton.styleFrom(
            backgroundColor: text == 'Cancel'
                ? MPTheme.lightTheme.colorScheme.onPrimary
                : null,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: MediumBody(
          text: text,
          hasUpperCase: false,
        ));
  }
}

// A custom button for alerts
class _MPFAlertButton extends MPButton {
  const _MPFAlertButton({
    required super.onPress,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: MediumLabel(
          text: text,
          color: MPTheme.lightTheme.colorScheme.onBackground,
          hasUpperCase: false,
        ));
  }
}
