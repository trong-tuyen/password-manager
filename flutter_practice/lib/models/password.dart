

import 'package:flutter/material.dart';

class Password {
  String? name;

  String? password;
  String? category;
  String? link;

  //constructor
  Password({this.name, this.password, this.category, this.link});
  @override
  String toString() {
    // TODO: implement toString
    return 'name: $name, password: $password, category: $category, link: $link';
  }
}
