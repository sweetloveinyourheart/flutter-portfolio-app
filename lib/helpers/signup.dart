import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:http/http.dart' as http;

class SignUpHelper {
  static String signUpAPI = "https://chocaycanh.club/public/api/register";
  
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

  static Future createAccount(
    BuildContext context,
    String username,
    String email,
    String password,
    String retypePassword
  ) async {

    final response = await http.post(
      Uri.parse(signUpAPI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": username,
        "email": email,
        "password": password,
        "password_confirmation": retypePassword,
        "tos": 'true'
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      redirect(context, LoginScreen());
    } else {
      throw Exception('Failed to create account');
    }
  }
}
