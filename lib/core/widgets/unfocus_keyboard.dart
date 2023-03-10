import 'package:flutter/material.dart';

class UnfocusKeyBoard extends StatelessWidget {
  const UnfocusKeyBoard({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use GestureDetector to detect user's tap outside the TextField to unfocus the keyboard
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Unfocus the keyboard when user taps outside the TextField
        },
        child: child,
      ),
    );
  }
}
