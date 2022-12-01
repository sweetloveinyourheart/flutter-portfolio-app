import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/homepage.dart';
import 'package:http/http.dart' as http;


class LoginToken {
  final String token;

  const LoginToken({ required this.token });

  factory LoginToken.fromJson(Map<String, dynamic> json) {
    return LoginToken (
      token: json['token']
    );
  }
}

class LoginHelper {
  static String loginAPI = "https://chocaycanh.club/public/api/login";
  static String loginToken = "";
  
  static void redirect(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return page;
        },
      ),
    );
  }

  static Future login(
    BuildContext context,
    String username,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse(loginAPI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": username,
        "password": password,
        "device_name": "IPhone 14 Promax"
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      LoginToken data = LoginToken.fromJson(jsonDecode(response.body));
      loginToken = data.token;
      redirect(context, const Home());

    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Login');
    }
  }

}
