import 'package:flutter/material.dart';
import 'package:flutter_practice/core/repositories/data.dart';
import 'package:flutter_practice/core/themes/theme.dart';

class LoadingIndicator {
//   static bool _isLoading = false;
  LoadingIndicator();

  static void show(
    BuildContext context, {
    String? message,
    // bool isSplash = false,
  }) {
    if (isLoading) {
      return;
    }
    isLoading = true;
  }

  static void hide(BuildContext context) {
    if (!isLoading) {
      return;
    }
    isLoading = false;
    Navigator.of(context).pop();
  }

  static Widget inlineIndicator({
    double? height,
    bool hasPosition = true,
  }) {
    return _InlineLoadingIndicator(height: height, hasPosition: hasPosition);
  }
}

class _InlineLoadingIndicator extends StatelessWidget {
  const _InlineLoadingIndicator({required this.hasPosition, this.height});

  final double? height;
  final bool hasPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MPTheme.lightTheme.colorScheme.onBackground,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
