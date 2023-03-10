import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/models/card_password.dart';
import 'package:flutter_practice/core/repositories/data.dart';
import 'package:flutter_practice/core/services/services.dart';
import 'package:flutter_practice/features/main/bloc/card_password_event.dart';
import 'package:flutter_practice/features/main/bloc/card_password_state.dart';

class CardPasswordBloc extends Bloc<CardPasswordEvent, CardPasswordState> {
  CardPasswordBloc() : super(CardPasswordLoading()) {
    on<FetchPassword>((event, emit) => _getCardPasswordList(emit));
    on<AddCardPassword>((event, emit) => _addCardPasswordList(emit));
  }

  Future<void> _getCardPasswordList(Emitter emit) async {
    try {
      emit(CardPasswordLoading());

      final List<CardPassword>? listPassword = await Services().getPassword();

      emit(CardPasswordSuccess(listCardPassword: listPassword));
    } catch (e) {
      // Notify that an error has occurred while getting card passwords.
      emit(CardPasswordError());
    }
  }

  Future<void> _addCardPasswordList(Emitter emit) async {
    try {
      // Check if the username and password are not empty.
      if (cardPassword.username!.isEmpty || cardPassword.password!.isEmpty) {
        // Notify that an error has occurred while adding a new card password.
        emit(CardPasswordError());
        return;
      }
      // Set the name and category of the new card password.
      cardPassword
        ..name = appSelected
        ..category = categorySelected;

      // Check if the new card password already exists.
      for (int i = 0; i < cardPasswords.length; i++) {
        if (cardPasswords[i].name == cardPassword.name &&
            cardPasswords[i].username == cardPassword.username &&
            cardPasswords[i].password == cardPassword.password &&
            cardPasswords[i].category == cardPassword.category) {
          // Notify that an error has occurred while adding a new card password.
          emit(CardPasswordError());
          return;
        }
      }
      //reset card password when filter, avoid card password same card password filter
      cardPasswords = cardPasswordsTemp;
      // Add the new card password to the list of card passwords.
      cardPasswords.add(cardPassword);
      await Services().addPassword(cardPassword);

      // Reset the cardPassword.
      cardPassword = CardPassword(
        id: '',
        name: '',
        username: '',
        password: '',
        category: '',
      );
      cardPasswordsTemp = cardPasswords;

      // Notify that the new card password has been added successfully.
      emit(CardPasswordSuccess());
    } catch (e) {
      // Notify that an error has occurred while adding a new card password.
      emit(CardPasswordError());
    }
  }
}
