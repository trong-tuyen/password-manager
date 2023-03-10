part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

// Represents the initial state of the login process
class LoginInitial extends LoginState {}

// Represents the state when the login process is in progress
class LoginLoading extends LoginState {}

// Represents the state when there is an error during the login process
class LoginError extends LoginState {
  const LoginError(this.error);

  final String error;
}

// Represents the state when the login process is successful
class LoginSuccess extends LoginState {}

// Represents the state when the logout process is successful
class LogoutSuccess extends LoginState {}
