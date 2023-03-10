class User {
  // Constructor
  User({this.email, this.password});

  // Properties
  String? email;
  String? password;

  // Method to create a string representation of User instance
  @override
  String toString() {
    return 'email: $email, password: $password';
  }
}
