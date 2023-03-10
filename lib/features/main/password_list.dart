import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/card_password.dart';
import 'package:flutter_practice/core/repositories/data.dart';
import 'package:flutter_practice/core/widgets/card_password.dart';

class PasswordList extends StatelessWidget {
  const PasswordList({required this.width, this.listCardPassword, Key? key})
      : super(key: key);
  final double width;
  // function to build a CardPassword widget with a given index
  final List<CardPassword>? listCardPassword;
//   Widget cardPassword(int index) =>
//       CardPasswordWidget(index: index, width: width);

  @override
  Widget build(BuildContext context) {
    if (listCardPassword?.isNotEmpty ?? false) {
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: listCardPassword?.length,
        // use lowercase with underscores for variable names
        itemBuilder: (context, index) {
          return CardPasswordWidget(
            cardPassword: listCardPassword![index],
            width: width,
          );
        },
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
