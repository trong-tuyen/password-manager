class Validators {
  static String? validatorEmail(String? email) {
    final regularExpression = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (email == '') {
      return 'Email is blank.';
    } else if (!regularExpression.hasMatch(email!)) {
      return 'Email is invalid.';
    } else {
      return null;
    }
  }

  static String? validatorPassword(String? password) {
    if (password == '') {
      return 'Password is blank.';
    } else if (password!.length < 6) {
      return 'Password length must not be less than 6.';
    }
    return null;
  }

  static String? validatorUsername(String? username) {
    if (username == '') {
      return 'Username is blank.';
    } else if (username!.length > 20) {
      return 'Username length must not be longer than 20.';
    }
    return null;
  }

  static String? validatorConfirmPassword(
      String? password, String? confirmPassword) {
    if (password! != confirmPassword) {
      return 'The confirm password is not the same.';
    }
    return null;
  }
}
