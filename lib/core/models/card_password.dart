/// A class representing a password card.
class CardPassword {
  // Constructor
  CardPassword({
    required this.id,        // The unique identifier of the password card.
    required this.name,      // The name of the password card.
    this.username = 'webperts',  // The username associated with the card.
    this.password = 'tuyen123456',  // The password associated with the card.
    this.category = 'Softwares',   // The category of the password card.
  });

  String id;             // The unique identifier of the password card.
  String name;           // The name of the password card.
  String? username;      // The username associated with the password card.
  String? password;      // The password associated with the password card.
  String? category;      // The category of the password card.

  /// A static method that creates a [CardPassword] object from a JSON map.
  static CardPassword fromJson(Map<String, String> passwordItem) => CardPassword(
      id: passwordItem['id']!,
      name: passwordItem['name']!,
      username: passwordItem['username'],
      password: passwordItem['password'],
      category: passwordItem['category'],
    );
}
