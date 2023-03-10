import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/widgets/alert_dialog.dart';
import 'package:flutter_practice/features/auth/login/bloc/login_bloc.dart';
import 'package:flutter_practice/features/auth/login/login_page.dart';
import 'package:flutter_practice/features/auth/repositories/auth_repo.dart';
import 'package:flutter_practice/features/auth/registration/registration_page.dart';
import 'package:flutter_practice/features/main/home_page.dart';
import 'package:flutter_practice/gen/assets.gen.dart';
import 'package:flutter_practice/generated/l10n.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/widgets/button.dart';
import 'package:flutter_practice/core/widgets/image_app.dart';
import 'package:flutter_practice/core/widgets/logo.dart';
import 'package:flutter_practice/features/welcome/background.dart';
import 'package:flutter_practice/core/widgets/text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
// Creating LoginBloc with AuthRepo dependency injected from the parent widget tree
      create: (context) =>
          LoginBloc(repo: RepositoryProvider.of<AuthRepo>(context)),
      child: Background(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  //switch to Homepage if successful
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                } else if (state is LoginError) {
                  // Show error message when login fails
                  AlertWidget.show(context, S.of(context).notification,
                      S.of(context).loginFailed, true);
                }
              },
              builder: (context, state) {
                return Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: LogoWidget(height: 100),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Display the main title and subtitle
                            MainTitle(text: S.of(context).password),
                            SubTitle(text: S.of(context).manager)
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 140),
                    // Display the large headline
                    LargeHeadline(
                      text: S.of(context).headingFirst,
                      hasUpperCase: false,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      // Display the large body
                      child: LargeBody(
                        text: S.of(context).contextFirst,
                        color: MPTheme.lightTheme.colorScheme.secondary,
                        hasUpperCase: false,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Display the "Login with" text
                    LargeBody(
                      text: S.of(context).loginwith,
                      hasUpperCase: false,
                    ),
                    const SizedBox(height: 15),
                    if (state is LoginLoading)
                      // Show loading indicator when logging in
                      CircularProgressIndicator(
                        color: MPTheme.lightTheme.colorScheme.background,
                      )
                    else
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<LoginBloc>(context)
                                  .add(const PressLoginFacebookEvent());
                            },
                            child: ImageApp(Assets.images.facebookLogin.path,
                                const EdgeInsets.only(left: 0)),
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<LoginBloc>(context)
                                  .add(const PressLoginGoogleEvent());
                            },
                            child: ImageApp(Assets.images.gmailLogin.path,
                                const EdgeInsets.only(left: 20)),
                          ),
                        ],
                      ),
                    const SizedBox(height: 15),
                    LargeBody(
                      text: S.of(context).or,
                      color: MPTheme.lightTheme.colorScheme.onPrimary,
                      hasUpperCase: false,
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 50,
                      width: size.width * 0.9,
                      child: MPButton.primary(
                        text: S.of(context).singupTitleButton,
                        onPress: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: size.width * 0.9,
                      child: MPButton.primary(
                          text: S.of(context).loginTitleButton,
                          colorBorder: MPTheme.lightTheme.colorScheme.onError,
                          backgroundColor:
                              MPTheme.lightTheme.colorScheme.onBackground,
                          onPress: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              )),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      )),
    );
  }
}
