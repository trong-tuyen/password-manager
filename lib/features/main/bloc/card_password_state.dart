



import 'package:flutter_practice/core/models/card_password.dart';

/// An abstract class for Card Password states.
abstract class CardPasswordState {
  const CardPasswordState();
}

/// Represents the initial state of the Card Password Bloc.
class CardPasswordInitial extends CardPasswordState {}

/// Represents the state when the Card Password Bloc is loading.
class CardPasswordLoading extends CardPasswordState {}

/// Represents the state when an error occurs in the Card Password Bloc.
class CardPasswordError extends CardPasswordState {}

/// Represents the state when the Card Password Bloc is successful.
class CardPasswordSuccess extends CardPasswordState {
  const CardPasswordSuccess({this.listCardPassword});

  final List<CardPassword>? listCardPassword;
}
