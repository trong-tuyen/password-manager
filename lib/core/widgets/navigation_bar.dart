import 'package:flutter/material.dart';
import 'package:flutter_practice/generated/l10n.dart';
import 'package:flutter_practice/core/widgets/item_navigation_bar.dart';
import 'package:flutter_practice/core/repositories/data.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({required this.onChanged, super.key});
  final ValueChanged<String> onChanged;

  void showButtonNavigation(String text) {
    onChanged(text);
    selectItem.forEach((key, value) {
      if (key == text) {
        selectItem[key] = false;
      } else {
        selectItem[key] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            height: size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(113, 80, 241, 1),
                    Color.fromRGBO(113, 80, 241, 1),
                    Colors.white
                  ],
                  stops: [0, 0.86, 0.5],
                  tileMode: TileMode.clamp),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 20,
                  ),
                  // Fix me
                //   const Padding(
                //     padding: EdgeInsets.only(bottom: 20),
                //     child: Icon(Icons.menu),
                //   ),
                //   const Icon(Icons.search),
                  const SizedBox(
                    height: 30,
                  ),
                  ItemNavigation(
                      S.of(context).typeCardFirst, showButtonNavigation),
                  ItemNavigation(
                      S.of(context).typeCardSecond, showButtonNavigation),
                  ItemNavigation(
                      S.of(context).typeCardThird, showButtonNavigation),
                ],
              ),
            )));
  }
}
