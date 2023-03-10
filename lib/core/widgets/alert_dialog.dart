import 'package:flutter/material.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/widgets/button.dart';
import 'package:flutter_practice/core/widgets/text.dart';
import 'package:flutter_practice/core/widgets/text_field.dart';
import 'package:flutter_practice/generated/l10n.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    required this.title,
    required this.message,
    this.buttonText = 'Close',
    this.isError = false,
    Key? key, // Add null safety to key
  }) : super(key: key); // Specify the key in the super constructor

  final String title;
  final String message;
  final String? buttonText; // Add null safety to buttonText
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: MediumLabel(
          text: title,
          color: MPTheme.lightTheme.colorScheme.onSurface,
          fontWeight: FontWeight.bold,
          hasUpperCase: false,
        ),
      ),
      content: MediumLabel(
          text: message,
          color: isError
              ? MPTheme.lightTheme.colorScheme.error
              : MPTheme.lightTheme.colorScheme.onSurface,
          fontWeight: FontWeight.w100,
          hasUpperCase: false,
          align: TextAlign.center),
    );
  }
 // Show the AlertWidget as a dialog box and automatically close it after a delay
  static void show(
      BuildContext context, String title, String message, bool isError) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertWidget(
        title: title,
        message: message,
        isError: isError,
      ),
    );
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }
}

class AlertConfirmWidget extends StatelessWidget {
  const AlertConfirmWidget({
    required this.title,
    required this.message,
    required this.onPressCancel,
    required this.onPressYes,
    Key? key, // Add null safety to key
  }) : super(key: key); // Specify the key in the super constructor

  final String title;
  final String message;
  final VoidCallback onPressCancel;
  final VoidCallback onPressYes;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: MediumLabel(
          text: title,
          color: MPTheme.lightTheme.colorScheme.onSurface,
          fontWeight: FontWeight.bold,
          hasUpperCase: false,
        ),
      ),
      content: MediumLabel(
          text: message,
          color: MPTheme.lightTheme.colorScheme.onSurface,
          fontWeight: FontWeight.w100,
          hasUpperCase: false,
          align: TextAlign.center),
      actions: [
        MPButton.alert(text: 'No', onPress: onPressCancel),
        MPButton.alert(text: 'Yes', onPress: onPressYes),
      ],
    );
  }
 // Show the AlertWidget as a dialog box and have two options yes, no
  static void show({required BuildContext context,required String title,required String message,
     required VoidCallback onPressCancel, required VoidCallback onPressYes}) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertConfirmWidget(
        title: title,
        message: message,
        onPressCancel: onPressCancel,
        onPressYes: onPressYes,
      ),
    );
  }
}

class FormWidget extends StatelessWidget {
  const FormWidget({
    required this.controller,
    required this.onPressed,
    Key? key, // The `Key` class is used to uniquely identify widgets, so it should be specified with null safety
  }) : super(
            key: key); // Pass the `key` parameter to the superclass constructor

  final TextEditingController controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            // `MPTextField` is a custom text field widget with some pre-defined styling
            MPTextField(
                controller: controller,
                hintText: S.of(context).MFAPassword,
                title: S.of(context).titleMFAPassword,
                obscureText: true,
                onpress: () {}),
          ],
        ),
      ),
      actions: [
        // Two `MPButton` widgets, one for 'Ok' and one for 'Cancel'
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MPButton.text(text: S.of(context).oke, onPress: onPressed),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: MPButton.text(
                  text: S.of(context).cancel,
                  onPress: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      ],
    );
  }

  // A static method to show the dialog from anywhere in the code
  static void show(BuildContext context, TextEditingController controller,
      VoidCallback onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) => FormWidget(
        controller: controller,
        onPressed: onPressed,
      ),
    );
  }
}
