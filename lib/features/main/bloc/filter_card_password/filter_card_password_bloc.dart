import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_practice/core/repositories/data.dart';
import 'package:flutter_practice/core/services/services.dart';

part 'filter_card_password_event.dart';
part 'filter_card_password_state.dart';

// A BLoC that filters a list of card passwords based on the selected category.
class FilterCardPasswordBloc
    extends Bloc<FilterCardPasswordEvent, FilterCardPasswordState> {
  // Constructor initializes the initial state of the BLoC and listens to FilterCardPassword events.
  FilterCardPasswordBloc() : super(FilterCardPasswordInitial()) {
    on<FilterCardPassword>(_filterCardPasswordList);
  }

  // Filters the list of card passwords based on the selected category.
  Future<void> _filterCardPasswordList(
      FilterCardPassword event, Emitter emit) async {
    try {
      emit(FilterCardPasswordInitial()); // Emit initial state.

      // If the selected category is 'Favorites', keep all passwords in the list.
      if (event.valueFilterCategory == 'Favorites') {
        // await Services.get
        
        cardPasswordsFilter = cardPasswordsTemp;
      }
      // Otherwise, filter the list based on the selected category.
      else {
        final listPasswords = cardPasswordsTemp.where((card) {
          return card.category == event.valueFilterCategory;
        }).toList();
        cardPasswordsFilter = listPasswords;
      }

      emit(FilterCardPasswordSuccess()); // Emit success state.
    }
    // Catch any error that occurs and emit error state.
    catch (e) {
      emit(FilterCardPasswordError());
    }
  }
}
