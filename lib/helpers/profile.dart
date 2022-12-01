import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/helpers/login.dart';
import 'package:http/http.dart' as http;

class UserProfile {
  final int? id;
  final String? first_name;
  final String? last_name;
  final String username;
  final String email;
  final String? phone;
  final String? avatar;
  final String? address;

  const UserProfile(
      {required this.id,
      required this.first_name,
      required this.last_name,
      required this.username,
      required this.email,
      required this.address,
      required this.avatar,
      required this.phone});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
      address: json['address']
    );
  }
}

class ProfileHelper {
  static String profileAPI = "https://chocaycanh.club/public/api/me";
  static UserProfile? profile;

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

  static Future<UserProfile> getProfile() async {
    final response =
        await http.get(Uri.parse(profileAPI), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ' + LoginHelper.loginToken
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response
      UserProfile data = UserProfile.fromJson(jsonDecode(response.body)['data']);
      profile = data;
      return data;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to Login');
    }
  }
}
