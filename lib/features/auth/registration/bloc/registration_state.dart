// This is an abstract class representing the state of the registration process
abstract class RegistrationState {}

// This state represents the initial state of the registration process
class RegistrationIntial extends RegistrationState {}

// This state represents the loading state during the registration process
class RegistrationLoading extends RegistrationState {}

// This state represents the success state after a successful registration
class RegistrationSuccess extends RegistrationState {}

// This state represents the error state after a failed registration
class RegistrationError extends RegistrationState {
  RegistrationError(this.error);

  final String error;
}
