import 'package:flutter/material.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/widgets/text.dart';

class CustomSnackBar {
  // static method to show a snackbar with the given message and error status
  static void show(BuildContext context, String message, bool isError) {
    // show the snackbar using the context passed in
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // set the background color of the snackbar
        backgroundColor: MPTheme.lightTheme.colorScheme.background,
        // set the content of the snackbar as a SmallBody widget
        content: MediumLabel(
          // set the text of the SmallBody widget to the message passed in
          text: message,
          // set the color of the text in the SmallBody widget based on the error status
          color: isError
              ? MPTheme.lightTheme.colorScheme.error
              : MPTheme.lightTheme.colorScheme.onSurface,
          // specify whether the text in the SmallBody widget should be all lowercase or not
          hasUpperCase: false,
          align: TextAlign.center
        ),
        // set the duration that the snackbar should be displayed
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
