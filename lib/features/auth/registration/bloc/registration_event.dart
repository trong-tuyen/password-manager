// This class represents an abstract event for registration feature
abstract class RegistrationEvent {}

// This class represents an event for sending user data during registration
class SendDataEvent extends RegistrationEvent {
  SendDataEvent({required this.email, required this.password});
  final String email;
  final String password;
}
