import 'package:flutter/material.dart';

// MainTitle is a StatelessWidget that displays a large title.
class MainTitle extends StatelessWidget {
  // Constructor for MainTitle.
  const MainTitle({
    required this.text, // Required parameter for the text to be displayed.
    Key? key, // Optional parameter for the widget's key.
    this.color, // Optional parameter for the text color.
    this.hasUpperCase =
        true, // Optional parameter for whether to display text in all uppercase.
  }) : super(key: key);

  // Instance variables.
  final String text;
  final Color? color;
  final bool hasUpperCase;

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    return Text(
      hasUpperCase ? text.toUpperCase() : text, // Convert the text to all caps if hasUpperCase is true.
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: color), // Apply the large title text style from the app's theme.
      textAlign: TextAlign.center, // Center the text horizontally.
    );
  }
}

// SubTitle is a StatelessWidget that displays a smaller subtitle.
class SubTitle extends StatelessWidget {
  // Constructor for SubTitle.
  const SubTitle({
    required this.text, // Required parameter for the text to be displayed.
    Key? key, // Optional parameter for the widget's key.
    this.color, // Optional parameter for the text color.
    this.hasUpperCase =
        true, // Optional parameter for whether to display text in all uppercase.
  }) : super(key: key);

  // Instance variables.
  final String text;
  final Color? color;
  final bool hasUpperCase;

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    return Text(
      hasUpperCase ? text.toUpperCase() : text, // Convert the text to all caps if hasUpperCase is true.
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: color), // Apply the small title text style from the app's theme.
      textAlign: TextAlign.center, // Center the text horizontally.
    );
  }
}

// LargeHeadline is a StatelessWidget that displays a large headline.
class LargeHeadline extends StatelessWidget {
  // Constructor for LargeHeadline.
  const LargeHeadline({
    required this.text, // Required parameter for the text to be displayed.
    Key? key, // Optional parameter for the widget's key.
    this.color, // Optional parameter for the text color.
    this.hasUpperCase =
        true, // Optional parameter for whether to display text in all uppercase.
  }) : super(key: key);

  // Instance variables.
  final String text;
  final Color? color;
  final bool hasUpperCase;

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    return Text(
      hasUpperCase ? text.toUpperCase() : text, // Convert the text to all caps if hasUpperCase is true.
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: color), // Apply the large headline text style from the app's theme.
      textAlign: TextAlign.center, // Center the text horizontally.
    );
  }
}

// Widget for large body text
class LargeBody extends StatelessWidget {
  const LargeBody({
    required this.text, // required text parameter
    Key? key,
    this.color, // optional color parameter
    this.hasUpperCase = true, // optional boolean parameter with default value
  }) : super(key: key);

  final String text;
  final Color? color;
  final bool hasUpperCase;

  @override
  Widget build(BuildContext context) {
    return Text(
      hasUpperCase ? text.toUpperCase() : text, // Convert the text to all caps if hasUpperCase is true.
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: color), // apply large body text style from current theme and optional color
      textAlign: TextAlign.center,
    );
  }
}

// Widget for medium body text
class MediumBody extends StatelessWidget {
  const MediumBody({
    required this.text, // required text parameter
    Key? key,
    this.color, // optional color parameter
    this.hasUpperCase = true, // optional boolean parameter with default value
  }) : super(key: key);

  final String text;
  final Color? color;
  final bool hasUpperCase;

  @override
  Widget build(BuildContext context) {
    return Text(
      hasUpperCase ? text.toUpperCase() : text, // Convert the text to all caps if hasUpperCase is true.
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color), // apply medium body text style from current theme and optional color
      textAlign: TextAlign.center,
    );
  }
}

// Widget for small body text
class SmallBody extends StatelessWidget {
  const SmallBody({
    required this.text, // required text parameter
    Key? key,
    this.color, // optional color parameter
    this.hasUpperCase = true, // optional boolean parameter with default value
  }) : super(key: key);

  final String text;
  final Color? color;
  final bool hasUpperCase;

  @override
  Widget build(BuildContext context) {
    return Text(
      hasUpperCase ? text.toUpperCase() : text, // Convert the text to all caps if hasUpperCase is true.
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: color, // apply optional color
            overflow: TextOverflow.ellipsis, // add ellipsis if text overflows
          ),
    );
  }
}

// Widget for large label text
class LargeLabel extends StatelessWidget {
  const LargeLabel({
    required this.text, // required text parameter
    Key? key,
    this.color, // optional color parameter
    this.hasUpperCase = true, // optional boolean parameter with default value
  }) : super(key: key);

  final String text;
  final Color? color;
  final bool hasUpperCase;

  @override
  Widget build(BuildContext context) {
    return Text(
      hasUpperCase ? text.toUpperCase() : text, // Convert the text to all caps if hasUpperCase is true.
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: color), // apply large label text style from current theme and optional color
    );
  }
}

class SmallLabel extends StatelessWidget {
  // The constructor for SmallLabel widget.
  const SmallLabel({
    required this.text, // The text to be displayed.
    Key? key, // An identifier for this widget.
    this.color, // The color of the text.
    this.hasUpperCase = true, // Whether or not to display the text in all caps.
  }) : super(key: key);

  final String text; // The text to be displayed.
  final Color? color; // The color of the text.
  final bool hasUpperCase; // Whether or not to display the text in all caps.

  @override
  Widget build(BuildContext context) {
    return Text(
      hasUpperCase ? text.toUpperCase() : text, // Convert the text to all caps if hasUpperCase is true.
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
        color: color, // Use the provided color if available.
        letterSpacing: 0, // Remove letter spacing.
      ),
    );
  }
}

class MediumLabel extends StatelessWidget {
  // The constructor for MediumLabel widget.
  const MediumLabel({
    required this.text,
    Key? key,
    this.color,
    this.fontWeight,
    this.hasUpperCase = true,
    this.align
  }) : super(key: key);

  final String text; // The text to be displayed.
  final Color? color; // The color of the text.
  final FontWeight? fontWeight; // The font weight of the text.
  final bool hasUpperCase; // Whether or not to display the text in all caps.
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      hasUpperCase ? text.toUpperCase() : text, // Convert the text to all caps if hasUpperCase is true.
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: color, // Use the provided color if available.
        fontWeight: fontWeight, // Use the provided font weight if available.
        letterSpacing: 0, // Remove letter spacing.
      ),
    );
  }
}

