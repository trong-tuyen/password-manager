import 'package:flutter/material.dart';
import 'package:flutter_practice/features/misc/add_card_password_page.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/widgets/button.dart';

class MPScaffoldHomePage extends StatelessWidget {
  // Constructor to receive a required child widget
  const MPScaffoldHomePage({required this.child, Key? key}) : super(key: key);

  final Widget child; // Child widget received from the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Adding a floating action button to the scaffold
      floatingActionButton: MPButton.floating(
        heroTag: 'btn1',
        // When the button is pressed, navigate to the AddCardPasswordPage
        onPress: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddCardPasswordPage(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 40,
          color: MPTheme.lightTheme.colorScheme.background,
        ),
      ),
      // Adding a scrollable column to the scaffold
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[child], // Adding the child widget to the column
        ),
      ),
    );
  }
}
