import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_practice/features/auth/repositories/auth_repo.dart';

// Importing event and state classes
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.repo}) : super(LoginInitial()) {
    // Registering event handlers for different events
    on<EnterLoginEvent>(_handleEnterLoginEvent);
    on<PressLoginGoogleEvent>(_handlePressLoginGoogleEvent);
    on<PressLoginFacebookEvent>(_handlePressLoginFacebookEvent);
    on<LogOutEvent>(_handleLogOutEvent);
  }

  // Authentication repository instance to handle login and logout
  final AuthRepo repo;

  // Handler function for EnterLoginEvent
  Future<void> _handleEnterLoginEvent(
    EnterLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoginLoading()); // Emitting LoginLoading state
      await repo.logIn(email: event.email, password: event.password); // Calling repo's logIn method
      emit(LoginSuccess()); // Emitting LoginSuccess state
    } on Exception catch (e) {
      emit(LoginError(e.toString())); // Emitting LoginError state in case of any exception
    }
  }

  // Handler function for PressLoginGoogleEvent
  Future<void> _handlePressLoginGoogleEvent(
    PressLoginGoogleEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoginLoading()); // Emitting LoginLoading state
      await AuthRepo().signInWithGoogle(); // Calling AuthRepo's signInWithGoogle method
      emit(LoginSuccess()); // Emitting LoginSuccess state
    } on Exception catch (e) {
      emit(LoginError(e.toString())); // Emitting LoginError state in case of any exception
    }
  }

  // Handler function for PressLoginFacebookEvent
  Future<void> _handlePressLoginFacebookEvent(
    PressLoginFacebookEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoginLoading()); // Emitting LoginLoading state
      await AuthRepo().signInWithFacebook(); // Calling AuthRepo's signInWithFacebook method
      emit(LoginSuccess()); // Emitting LoginSuccess state
    } on Exception catch (e) {
      emit(LoginError(e.toString())); // Emitting LoginError state in case of any exception
    }
  }

  // Handler function for LogOutEvent
  Future<void> _handleLogOutEvent(
    LogOutEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoginLoading()); // Emitting LoginLoading state
      await AuthRepo().logOut(); // Calling AuthRepo's logOut method
      emit(LogoutSuccess()); // Emitting LoginOutSuccess state
    } on Exception catch (e) {
      emit(LoginError(e.toString())); // Emitting LoginError state in case of any exception
      emit(LoginInitial()); // Emitting LoginInitial state in case of any exception
    }
  }
}
