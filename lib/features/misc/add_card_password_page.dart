import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/widgets/snack_bar.dart';
import 'package:flutter_practice/features/main/bloc/card_password_bloc.dart';
import 'package:flutter_practice/features/main/bloc/card_password_event.dart';
import 'package:flutter_practice/features/main/bloc/card_password_state.dart';
import 'package:flutter_practice/features/main/home_page.dart';
import 'package:flutter_practice/generated/l10n.dart';
import 'package:flutter_practice/core/widgets/custom_dropdown.dart';
import 'package:flutter_practice/core/widgets/indicator.dart';
import 'package:flutter_practice/core/widgets/unfocus_keyboard.dart';
import 'package:flutter_practice/core/repositories/data.dart';
import 'package:flutter_practice/core/widgets/button.dart';
import 'package:flutter_practice/core/widgets/text_field.dart';

class AddCardPasswordPage extends StatefulWidget {
  const AddCardPasswordPage({super.key});

  @override
  State<AddCardPasswordPage> createState() => _AddCardPasswordPageState();
}

class _AddCardPasswordPageState extends State<AddCardPasswordPage> {
  @override
  Widget build(BuildContext context) {
    // Initialize the text editing controllers for username and password fields
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();

    return UnfocusKeyBoard(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomDropdown(items: listApp),
            const SizedBox(height: 15),
            MPTextField(
                controller: userNameController,
                hintText: S.of(context).webperts,
                title: S.of(context).textFieldUsername,
                obscureText: false,
                onpress: () {}),
            const SizedBox(height: 15),
            MPTextField(
              controller: passwordController,
              hintText: S.of(context).textFieldPassword,
              title: S.of(context).textFieldPassword,
              obscureText: true,
              onpress: () {},
            ),
            const SizedBox(height: 30),
            CustomDropdown(items: listCategory),
            const SizedBox(height: 30),
            BlocListener<CardPasswordBloc, CardPasswordState>(
              listener: (context, state) {
                //show an success if adding password success
                CustomSnackBar.show(
                      context,
                      S.of(context).success,
                      true
                  );
                // Navigate to home page if the password is added successfully
                if (state is CardPasswordSuccess) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
                // Show an error message if adding password fails
                if (state is CardPasswordError) {
                  CustomSnackBar.show(
                      context,
                      S.of(context).addCardPasswordFailed,
                      true
                  );
                }
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: 50,
                        child: MPButton.text(
                            text: S.of(context).save,
                            onPress: () {
                              LoadingIndicator.show(context,
                                  message: 'loading');
                              // Trigger the "AddCardPassword" event
                              //when the "Save" button is pressed
                              BlocProvider.of<CardPasswordBloc>(context)
                                  .add(AddCardPassword());
                            }),
                      )),
                      const Padding(padding: EdgeInsets.only(left: 10)),
                      Expanded(
                          child: SizedBox(
                        height: 50,
                        child: MPButton.text(
                            text: S.of(context).cancel,
                            onPress: () {
                              // Navigate back to previous screen when the "Cancel" button is pressed
                              Navigator.of(context).pop();
                            }),
                      ))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
