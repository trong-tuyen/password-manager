// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log In`
  String get loginTitle {
    return Intl.message(
      'Log In',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerTitle {
    return Intl.message(
      'Register',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get textFieldEmail {
    return Intl.message(
      'Email',
      name: 'textFieldEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get textFieldPassword {
    return Intl.message(
      'Password',
      name: 'textFieldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get textFieldUsername {
    return Intl.message(
      'Username',
      name: 'textFieldUsername',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get textFieldConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'textFieldConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpPageTitle {
    return Intl.message(
      'Sign Up',
      name: 'signUpPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get loginPageTitle {
    return Intl.message(
      'Log In',
      name: 'loginPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `manager`
  String get manager {
    return Intl.message(
      'manager',
      name: 'manager',
      desc: '',
      args: [],
    );
  }

  /// `Transparent & Secured.`
  String get headingFirst {
    return Intl.message(
      'Transparent & Secured.',
      name: 'headingFirst',
      desc: '',
      args: [],
    );
  }

  /// `Only you can see your personal data`
  String get contextFirst {
    return Intl.message(
      'Only you can see your personal data',
      name: 'contextFirst',
      desc: '',
      args: [],
    );
  }

  /// `Login with`
  String get loginwith {
    return Intl.message(
      'Login with',
      name: 'loginwith',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get singupTitleButton {
    return Intl.message(
      'Create New Account',
      name: 'singupTitleButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get loginTitleButton {
    return Intl.message(
      'Sign In',
      name: 'loginTitleButton',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get typeCardFirst {
    return Intl.message(
      'Favorites',
      name: 'typeCardFirst',
      desc: '',
      args: [],
    );
  }

  /// `Softwares`
  String get typeCardSecond {
    return Intl.message(
      'Softwares',
      name: 'typeCardSecond',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get typeCardThird {
    return Intl.message(
      'Credit Card',
      name: 'typeCardThird',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get recent {
    return Intl.message(
      'Recent',
      name: 'recent',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// ` Login`
  String get login {
    return Intl.message(
      ' Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Login failed`
  String get loginFailed {
    return Intl.message(
      'Login failed',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Register failed`
  String get registerFailed {
    return Intl.message(
      'Register failed',
      name: 'registerFailed',
      desc: '',
      args: [],
    );
  }

  /// `Add card password failed`
  String get addCardPasswordFailed {
    return Intl.message(
      'Add card password failed',
      name: 'addCardPasswordFailed',
      desc: '',
      args: [],
    );
  }

  /// `List Password is blank`
  String get listPasswordBlank {
    return Intl.message(
      'List Password is blank',
      name: 'listPasswordBlank',
      desc: '',
      args: [],
    );
  }

  /// `MFA Password wrong! `
  String get MFAPasswordWrong {
    return Intl.message(
      'MFA Password wrong! ',
      name: 'MFAPasswordWrong',
      desc: '',
      args: [],
    );
  }

  /// `webperts`
  String get webperts {
    return Intl.message(
      'webperts',
      name: 'webperts',
      desc: '',
      args: [],
    );
  }

  /// `email@example.com`
  String get emailExample {
    return Intl.message(
      'email@example.com',
      name: 'emailExample',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAnAccount {
    return Intl.message(
      'Don`t have an account? ',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Oke`
  String get oke {
    return Intl.message(
      'Oke',
      name: 'oke',
      desc: '',
      args: [],
    );
  }

  /// `MFA password`
  String get MFAPassword {
    return Intl.message(
      'MFA password',
      name: 'MFAPassword',
      desc: '',
      args: [],
    );
  }

  /// `Multi-Factor Authentication`
  String get titleMFAPassword {
    return Intl.message(
      'Multi-Factor Authentication',
      name: 'titleMFAPassword',
      desc: '',
      args: [],
    );
  }

  /// `Open app`
  String get openApp {
    return Intl.message(
      'Open app',
      name: 'openApp',
      desc: '',
      args: [],
    );
  }

  /// `Open web`
  String get openWeb {
    return Intl.message(
      'Open web',
      name: 'openWeb',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get messageLogout {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'messageLogout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
