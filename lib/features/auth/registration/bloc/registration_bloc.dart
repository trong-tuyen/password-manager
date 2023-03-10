import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/features/auth/registration/bloc/registration_event.dart';
import 'package:flutter_practice/features/auth/registration/bloc/registration_state.dart';
import 'package:flutter_practice/features/auth/repositories/auth_repo.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {

  RegistrationBloc({required this.repo}) : super(RegistrationIntial()) {
    on<SendDataEvent>((event, emit) async {
      try {
        emit(RegistrationLoading()); // Update the state to loading
        await repo.registration(
            email: event.email,
            password: event.password); // Call registration API
        emit(RegistrationSuccess()); // Update the state to success
      } on Exception catch (e) {
        emit(RegistrationError(e.toString())); // Update the state to error
      }
    });
  }
  final AuthRepo repo;
}
