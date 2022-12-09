import 'package:flutter/material.dart';

class User {
  String? email;
  String? password;
  
  //constructor
  User({this.email, this.password});
  @override
  String toString() {
    // TODO: implement toString
    return 'email: $email, amount: $password';
  }
}