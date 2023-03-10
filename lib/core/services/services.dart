import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_practice/core/models/card_password.dart';
import 'package:flutter_practice/core/repositories/data.dart';

String apiUrl = "https://63b39515ea89e3e3db495e46.mockapi.io";

class Services {
  Future<bool> addPassword(CardPassword password) async {
    // Construct the URL for the request
    final url = Uri.https(Uri.parse(apiUrl).host, 'password');

    // Make the POST request and wait for the response
    final response = await http.post(url, body: {
      'name': password.name,
      'username': password.username,
      'password': password.password,
      'category': password.category,
    });

    // Check the response status code
    if (response.statusCode == 200) {
      // Add the password to the local data repository
      cardPasswords.add(password);
      // Return true to indicate success
      return true;
    }

    // If the response status code is not 200, return false to indicate failure
    return false;
  }

  Future<List<CardPassword>?> getPassword() async {
    // Construct the URL for the request
    final url = Uri.parse('$apiUrl/password');
    List<CardPassword> listPassword = [];

    try {
      // Make the GET request and wait for the response
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // If the response status code is 200, parse the response data into a list of passwords
        final responseData = json.decode(response.body) as List;
        listPassword = responseData.map((password) {
          return CardPassword(
              id: password['id'],
              name: password['name'],
              username: password['username'],
              password: password['password'],
              category: password['category']);
        }).toList();
        // Update the local data repository with the retrieved passwords
        return listPassword;
      }
      //   else {
      //     // Handle the case where the response status code is not 200

      return listPassword;
      //   }
    } catch (exception) {
      // Handle any exceptions that occur during the request
      if (kDebugMode) {
        print(exception);
      }
    }
  }
}
