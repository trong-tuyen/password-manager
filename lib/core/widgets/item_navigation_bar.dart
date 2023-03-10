import 'package:flutter/material.dart';
import 'package:flutter_practice/core/widgets/text.dart';
import 'package:flutter_practice/core/repositories/data.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/widgets/rotated_rounded_square.dart';


class ItemNavigation extends StatelessWidget {
  const ItemNavigation(this.text, this.showButtonCategory, {Key? key})
      : super(key: key);

  // Properties
  final String text;
  final void Function(String text) showButtonCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: InkWell(
        onTap: () => {showButtonCategory(text)},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Offstage(
              // Hide if the text is not selected
              offstage: !selectItem[text]!,
              child: RotatedBox(
                quarterTurns: 3,
                child: LargeLabel(
                  text: text,
                  color: MPTheme.lightTheme.colorScheme.background.withOpacity(0.5),
                  hasUpperCase: false
                ),
              ),
            ),
            Offstage(
              // Hide if the text is selected
              offstage: selectItem[text]!,
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: LargeLabel(
                      text: text,
                      color: MPTheme.lightTheme.colorScheme.background,
                      hasUpperCase: false
                    ),
                  ),
                  const RotatedRoundedSquare(
                    size: 45,
                    borderRadius: 15,
                    angle: 45 * (3.14159 / 180), // 30 degrees in radians
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
