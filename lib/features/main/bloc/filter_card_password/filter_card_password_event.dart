part of 'filter_card_password_bloc.dart';

abstract class FilterCardPasswordEvent extends Equatable {
  const FilterCardPasswordEvent();

  @override
  List<Object> get props => [];
}

class FilterCardPassword extends FilterCardPasswordEvent {
  const FilterCardPassword({required this.valueFilterCategory});

  // The category value to filter the card passwords.
  final String valueFilterCategory;
}
