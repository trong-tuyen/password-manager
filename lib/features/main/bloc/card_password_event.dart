/// An abstract class for Card Password events.
abstract class CardPasswordEvent {
  const CardPasswordEvent();
}

/// An event to fetch a list of card passwords.
class FetchPassword extends CardPasswordEvent {}

/// An event to add a new card password to the list.
class AddCardPassword extends CardPasswordEvent {}
