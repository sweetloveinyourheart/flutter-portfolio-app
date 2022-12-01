import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/homepage.dart';
import 'package:flutter_auth/helpers/login.dart';
import 'package:http/http.dart' as http;

class EditHelper {
  static String updateInformationAPI =
      "https://chocaycanh.club/public/api/me/details";
  static String updateAvatarAPI =
      "https://chocaycanh.club/public/api/me/avatar";

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

  static Future<void> uploadImage(BuildContext context, String filepath) async {
    var request = http.MultipartRequest('POST', Uri.parse(updateAvatarAPI));
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer ' + LoginHelper.loginToken
    };
    request.headers.addAll(headers);
    request.files.add(http.MultipartFile.fromBytes(
        'file', File(filepath).readAsBytesSync(),
        filename: filepath.split("/").last));
    var stream = await request.send();
    
    if(stream.statusCode == 200) {
      redirect(context, Home());
    } else {
      throw Exception("Upload avatar failed!");
    }
  }

  static Future updateProfile(BuildContext context, String firstName,
      String lastName, String phone, String address) async {
    final response = await http.patch(
      Uri.parse(updateInformationAPI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + LoginHelper.loginToken
      },
      body: jsonEncode(<String, String>{
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "address": address,
        "provinceid": "1",
        "provincename": "1",
        "districtid": "1",
        "districtname": "1",
        "wardid": "1",
        "wardname": "1",
        "street": address
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      redirect(context, Home());
    } else {
      throw Exception('Failed to update information');
    }
  }
}
