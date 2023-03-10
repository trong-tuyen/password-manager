part of 'filter_card_password_bloc.dart';

// Base abstract class for all states
abstract class FilterCardPasswordState extends Equatable {
  const FilterCardPasswordState();

  @override
  List<Object> get props => [];
}

// State class representing initial state of the bloc
class FilterCardPasswordInitial extends FilterCardPasswordState {}

// State class representing successful state of the bloc
class FilterCardPasswordSuccess extends FilterCardPasswordState {}

// State class representing error state of the bloc
class FilterCardPasswordError extends FilterCardPasswordState {}
