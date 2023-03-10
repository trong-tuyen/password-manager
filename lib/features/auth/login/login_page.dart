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
import 'package:flutter_practice/features/auth/login/bloc/login_bloc.dart';
import 'package:flutter_practice/features/auth/repositories/auth_repo.dart';
import 'package:flutter_practice/features/auth/registration/registration_page.dart';
import 'package:flutter_practice/features/main/home_page.dart';
import 'package:flutter_practice/generated/l10n.dart';
import 'package:flutter_practice/core/widgets/unfocus_keyboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Create controllers for email and password text fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // Set the initial values of the controllers to the saved email and password
    emailController.text = loginInfo['Email']!;
    passwordController.text = loginInfo['Password']!;
    emailController.addListener(handleDisablebutton);
    passwordController.addListener(handleDisablebutton);

    super.initState();
  }

// This function handles disabling the button based on whether or not the email,
// password, and confirm password fields are valid
  void handleDisablebutton() {
    if (Validators.validatorEmail(emailController.text) == null &&
        Validators.validatorPassword(passwordController.text) == null) {
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
    // Create a GlobalKey for the Form widget
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          LoginBloc(repo: RepositoryProvider.of<AuthRepo>(context)),
      // Wrap the page with an UnfocusKeyBoard widget to close the keyboard when tapping outside of a text field
      child: UnfocusKeyBoard(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const LogoWidget(height: 100),
              MainTitle(
                  text: S.of(context).loginTitle,
                  color: MPTheme.lightTheme.colorScheme.onSurface),
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 105,
                    child: MPTextField(
                      controller: emailController,
                      hintText: S.of(context).emailExample,
                      title: S.of(context).textFieldEmail,
                      obscureText: false,
                      onpress: () {},
                    ),
                  ),
                  SizedBox(
                    height: 105,
                    child: MPTextField(
                      controller: passwordController,
                      hintText: S.of(context).textFieldPassword,
                      title: S.of(context).textFieldPassword,
                      obscureText: true,
                      onpress: () {},
                    ),
                  ),
                ],
              ),
              MPButton.second(
                text: S.of(context).forgotPassword,
                onPress: () {},
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                width: size.width * 0.9,
                child: BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    // disable text fields when the form is being submitted
                    disableTextField = false;
                    // handle different login states
                    if (state is LoginSuccess) {
                      //Navigate to home page on login success
                      //Reset data after login success
                      loginInfo = {'Email': '', 'Password': ''};
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    } else if (state is LoginError) {
                      // Show error message on login failure
                      CustomSnackBar.show(
                          context, S.of(context).loginFailed, true);
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        // Show loading indicator while logging in
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 150),
                          child: CircularProgressIndicator(
                            color: MPTheme.lightTheme.colorScheme.onSurface,
                          ),
                        );
                      }
                      return MPButton.primary(
                          text: S.of(context).loginTitleButton,
                          colorBorder: disableButton
                              ? MPTheme.lightTheme.colorScheme.surface
                              : MPTheme.lightTheme.colorScheme.onError,
                          backgroundColor: disableButton
                              ? MPTheme.lightTheme.colorScheme.surface
                              : MPTheme.lightTheme.colorScheme.onBackground,
                          onPress: () {
                            if (disableButton) {
                              return;
                            }
                            disableTextField = true;
                            BlocProvider.of<LoginBloc>(context).add(
                                EnterLoginEvent(
                                    email: emailController.text,
                                    password: passwordController.text));
                          });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallBody(
                    text: S.of(context).dontHaveAnAccount,
                    color: MPTheme.lightTheme.colorScheme.onSurface,
                    hasUpperCase: false,
                  ),
                  MPButton.second(
                    text: S.of(context).signUpPageTitle,
                    onPress: () {
                      // Reset login data and navigate to register page
                      loginInfo = {'Email': '', 'Password': ''};
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
