import 'dart:convert';
import 'dart:developer';
import 'package:flutter_auth/helpers/login.dart';
import 'package:http/http.dart' as http;
import '../../../helpers/signup.dart';

import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  State<SignupWidget> createState() => SignUpForm();
}

class SignUpForm extends State<SignupWidget> {
  String email = '';
  String username = '';
  String password = '';
  String retypePassword = '';
  String error = '';

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final rePassCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();

  Future formValidation() async {
    try {
      if (email.isEmpty) {
        setState(() {
          error = 'Email cannot be empty';
        });
        return;
      }

      if (username.isEmpty) {
        setState(() {
          error = 'Username cannot be empty';
        });
        return;
      }

      if (password != retypePassword) {
        setState(() {
          error = 'Password does not match';
        });
        return;
      }

      setState(() {
        error = '';
      });

      await SignUpHelper.createAccount(
          context, username, email, password, retypePassword
      );
      
    } catch (e) {
      setState(() {
        error = "Create Account Failed";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: emailCtrl,
            onChanged: (value) => {
              setState(() => {email = value})
            },
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.email),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: passCtrl,
              onChanged: (value) => {
                setState(() => {password = value})
              },
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: kPrimaryColor,
            controller: rePassCtrl,
            onChanged: (value) => {
              setState(() => {retypePassword = value})
            },
            decoration: InputDecoration(
              hintText: "Retype password",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              controller: usernameCtrl,
              onChanged: (value) => {
                setState(() => {username = value})
              },
              decoration: InputDecoration(
                hintText: "Username",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          Text(
            error,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: (() => {formValidation()}),
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
