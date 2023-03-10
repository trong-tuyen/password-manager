import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/card_password.dart';
import 'package:flutter_practice/core/widgets/alert_dialog.dart';
import 'package:flutter_practice/core/widgets/snack_bar.dart';
import 'package:flutter_practice/gen/assets.gen.dart';
import 'package:flutter_practice/core/repositories/data.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/widgets/button.dart';
import 'package:flutter_practice/core/widgets/image_app.dart';
import 'package:flutter_practice/core/widgets/text.dart';
import 'package:flutter_practice/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

// A widget that represents a card with a password
class CardPasswordWidget extends StatefulWidget {
  const CardPasswordWidget({required this.cardPassword, required this.width, super.key,});

  // The index of the card in the list of passwords
//   final int index;

  // The width of the card
  final double width;

  final CardPassword cardPassword ;

  @override
  State<CardPasswordWidget> createState() => _CardPasswordState();
}

class _CardPasswordState extends State<CardPasswordWidget> {
  // A controller for the Multi-Factor Authentication (MFA) password
  final mFAPasswordController = TextEditingController();

  // Shows a dialog that prompts the user to enter the MFA password
  void showAddMFAPassworDialog() {
    FormWidget.show(context, mFAPasswordController, () {
      // If the entered password matches the application password
      if (applicationPassword == mFAPasswordController.text) {
        // Set the state to indicate that the password is correct
        setState(() {
          isApplicationPasswordCorrect = true;
        });
        // Show a success snackbar
        CustomSnackBar.show(context, S.of(context).success, false);
      } else {
        // If the password is incorrect, clear the text field and show an error snackbar
        mFAPasswordController.text = '';
        CustomSnackBar.show(context, S.of(context).MFAPasswordWrong, true);
      }
      // Close the dialog
      Navigator.of(context).pop();
    });
  }

  // Opens a URL in a webview or a browser
  Future<void> launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchURL(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  // Indicates whether the bottom part of the card is visible or not
  bool showBottom = false;

  // Indicates whether the password is visible or not
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        // Set the background color of the card to the color of the password's category
        color: listDescription[cardPassword.name]?['color'],
        child: InkWell(
          // When the user taps the card, toggle the visibility of the bottom part
          onTap: () {
            setState(() {
              showBottom = !showBottom;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    // Display the icon of the password's category
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        listDescription[cardPassword.name]
                                ?['assetPath'] ??
                            Assets.images.twitter.path,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container to display the password name and visibility icon
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            width: widget.width - 78,
                            child: Row(
                              children: [
                                // Display password name using MediumLabel widget
                                SizedBox(
                                  width: 100,
                                  child: MediumLabel(
                                    text: cardPassword.name,
                                    color: MPTheme
                                        .lightTheme.colorScheme.onSurface,
                                    fontWeight: FontWeight.w600,
                                    hasUpperCase: false,
                                  ),
                                ),
                                const Spacer(),
                                // Display visibility icon to show/hide password
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: widget.width * 1 / 40),
                                  child: InkWell(
                                    onTap: () {
                                      // Toggle the visibility of the password
                                      if (isApplicationPasswordCorrect) {
                                        setState(() {
                                          showPassword = !showPassword;
                                        });
                                      } else {
                                        showAddMFAPassworDialog();
                                      }
                                    },
                                    child: Icon(Icons.visibility,
                                        size: 20,
                                        color: MPTheme.visibilityColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Display username and password
                        Row(
                          children: [
                            // Display username using SmallBody widget
                            SizedBox(
                                width: 100,
                                child: SmallBody(
                                  text: cardPassword.username ??
                                      'None',
                                  color: MPTheme.lightTheme.colorScheme.surface,
                                  hasUpperCase: false,
                                )),
                            const Padding(padding: EdgeInsets.only(left: 20)),
                            // Display password using SmallBody widget
                            Column(
                              children: [
                                SizedBox(
                                    width: 50,
                                    child: SmallBody(
                                      text: showPassword
                                          ? cardPassword
                                              .password!
                                          : '******',
                                      color: MPTheme
                                          .lightTheme.colorScheme.surface,
                                      hasUpperCase: false,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                // Display the buttons to open app and web pages
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Offstage(
                    offstage: !showBottom,
                    child: Row(
                      children: [
                        // Display start icon
                        ImageApp(Assets.images.start.path,
                            const EdgeInsets.symmetric(horizontal: 25)),
                        Row(
                          children: [
                            // Display "Open app" button
                            MPButton.cardPassword(
                                text: S.of(context).openApp,
                                backgroundColor:
                                    MPTheme.lightTheme.colorScheme.onPrimary,
                                onPress: () {
                                  final String url = listDescription[
                                      cardPassword
                                          .name]!['url']!;
                                  launch(url);
                                },
                                width: widget.width),
                            const Padding(padding: EdgeInsets.only(right: 5)),
                            // Display "Open web" button
                            MPButton.cardPassword(
                                text: S.of(context).openWeb,
                                onPress: () {
                                  final String url = listDescription[
                                      cardPassword
                                          .name]!['url']!;
                                  launch(url);
                                },
                                width: widget.width)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
