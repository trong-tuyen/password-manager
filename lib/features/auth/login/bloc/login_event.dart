part of 'login_bloc.dart';

// Define an abstract class LoginEvent that extends Equatable to make it easy
// to compare instances of the class for equality.
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  // Override the props getter to ensure that LoginEvent instances can be compared
  // for equality.
  @override
  List<Object> get props => [];
}

// Define a concrete subclass of LoginEvent called EnterLoginEvent, which is used
// to indicate that the user has entered their login credentials.
class EnterLoginEvent extends LoginEvent {
  const EnterLoginEvent({required this.email, required this.password});

  // Declare two final String fields to store the user's email and password.
  final String email;
  final String password;
}

// Define a concrete subclass of LoginEvent called PressLoginGoogleEvent, which is
// used to indicate that the user has pressed the login with Google button.
class PressLoginGoogleEvent extends LoginEvent {
  const PressLoginGoogleEvent();
}

// Define a concrete subclass of LoginEvent called PressLoginFacebookEvent, which is
// used to indicate that the user has pressed the login with Facebook button.
class PressLoginFacebookEvent extends LoginEvent {
  const PressLoginFacebookEvent();
}

// Define a concrete subclass of LoginEvent called LogOutEvent, which is used to
// indicate that the user has logged out.
class LogOutEvent extends LoginEvent {
  const LogOutEvent();
}
