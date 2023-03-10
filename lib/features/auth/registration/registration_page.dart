import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/repositories/data.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/validators/validators.dart';
import 'package:flutter_practice/core/widgets/button.dart';
import 'package:flutter_practice/core/widgets/logo.dart';
import 'package:flutter_practice/core/widgets/snack_bar.dart';
import 'package:flutter_practice/core/widgets/text.dart';
import 'package:flutter_practice/core/widgets/text_field.dart';
import 'package:flutter_practice/features/auth/login/login_page.dart';
import 'package:flutter_practice/features/auth/registration/bloc/registration_bloc.dart';
import 'package:flutter_practice/features/auth/registration/bloc/registration_event.dart';
import 'package:flutter_practice/features/auth/registration/bloc/registration_state.dart';
import 'package:flutter_practice/features/auth/repositories/auth_repo.dart';
import 'package:flutter_practice/generated/l10n.dart';
import 'package:flutter_practice/core/widgets/unfocus_keyboard.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  void initState() {
    emailController.addListener(handleDisablebutton);
    passwordController.addListener(handleDisablebutton);
    passwordConfirmController.addListener(handleDisablebutton);
    super.initState();
  }

// This function handles disabling the button based on whether or not the email,
// password, and confirm password fields are valid
  void handleDisablebutton() {
    if (Validators.validatorEmail(emailController.text) == null &&
        Validators.validatorPassword(passwordController.text) == null &&
        Validators.validatorConfirmPassword(
                passwordController.text, passwordConfirmController.text) ==
            null) {
      // If all fields are valid, set disableButton to false to enable the button
      setState(() {
        disableButton = false;
      });
    } else {
      // If any of the fields are invalid, set disableButton to true to disable the button
      setState(() {
        disableButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // create a key to identify the form
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          RegistrationBloc(repo: RepositoryProvider.of<AuthRepo>(context)),
      // Wrap the child with UnfocusKeyboard widget to unfocus keyboard when user taps outside of text fields
      child: UnfocusKeyBoard(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Center(child: LogoWidget(height: 100)),
              // Custom text widget with large font size and specified color
              MainTitle(
                  text: S.of(context).registerTitle,
                  color: MPTheme.lightTheme.colorScheme.onSurface),
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 105,
                    // Custom text field widget with specified hint text,
                    // title, and controller
                    child: MPTextField(
                        controller: emailController,
                        hintText: S.of(context).emailExample,
                        title: S.of(context).textFieldEmail,
                        obscureText: false,
                        onpress: () {}),
                  ),
                  SizedBox(
                    height: 105,
                    // Custom text field widget for password input
                    //with specified hint text, title, and controller
                    child: MPTextField(
                      controller: passwordController,
                      hintText: S.of(context).textFieldPassword,
                      title: S.of(context).textFieldPassword,
                      obscureText: true,
                      onpress: () {},
                    ),
                  ),
                  SizedBox(
                    height: 105,
                    // Custom text field widget for confirm password input
                    //with specified hint text, title, and controller
                    child: MPTextField(
                      controller: passwordConfirmController,
                      hintText: S.of(context).textFieldConfirmPassword,
                      title: S.of(context).textFieldConfirmPassword,
                      obscureText: true,
                      onpress: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: size.width * 0.9,
                child: BlocListener<RegistrationBloc, RegistrationState>(
                  listener: (context, state) {
                    disableTextField = false; // enable text fields again
                    if (state is RegistrationSuccess) {
                      //Navigate to login page on register success
                      //Send data after register success
                      loginInfo = {
                        'Email': emailController.text,
                        'Password': passwordController.text
                      };

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    } else if (state is RegistrationError) {
                      // Show error message on register failure
                      CustomSnackBar.show(
                          context, S.of(context).registerFailed, true);
                    }
                  },
                  // BlocBuilder listens to state changes in the RegistrationBloc and rebuilds the widget tree accordingly
                  child: BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      if (state is RegistrationLoading) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 150),
                          child: CircularProgressIndicator(
                            color: MPTheme.lightTheme.colorScheme.onSurface,
                          ),
                        );
                      }
                      // If the state is not RegistrationLoading, show the signup button
                      return MPButton.primary(
                        text: S.of(context).singupTitleButton,
                        colorBorder: disableButton
                            ? MPTheme.lightTheme.colorScheme.surface
                            : MPTheme.lightTheme.colorScheme.onSecondary,
                        backgroundColor: disableButton
                            ? MPTheme.lightTheme.colorScheme.surface
                            : MPTheme.lightTheme.colorScheme.onSecondary,
                        onPress: () {
                          // Check if the button should be disabled
                          if (disableButton) {
                            return;
                          }
                          disableTextField = true;
                          // Submit the email and password data to the RegistrationBloc
                          BlocProvider.of<RegistrationBloc>(context).add(
                              SendDataEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallBody(
                    text: S.of(context).alreadyHaveAnAccount,
                    color: MPTheme.lightTheme.colorScheme.onSurface,
                    hasUpperCase: false,
                  ),
                  MPButton.second(
                    text: S.of(context).login,
                    onPress: () {
                      // Navigate to the LoginPage when the Login button is pressed
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
