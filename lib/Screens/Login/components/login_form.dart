import 'package:flutter/material.dart';
import 'package:flutter_auth/helpers/login.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => LoginForm();
}

class LoginForm extends State<LoginFormWidget> {
  String username = '';
  String password = '';
  String error = '';

  final ctrlUsername = TextEditingController();
  final ctrlPassword = TextEditingController();

  Future onLogin() async {
    try {
      if (username.isEmpty) {
      setState(() {
        error = 'Username cannot be empty';
      });
      return;
    }

    if (password.isEmpty) {
      setState(() {
        error = 'Password cannot be empty';
      });
      return;
    }

    await LoginHelper.login(context, username, password);
    
    } catch (e) {
      setState(() {
      error = "Login failed! Please try again";
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: ctrlUsername,
            onChanged: (value) => {
              setState(() => {username = value})
            },
            decoration: InputDecoration(
              hintText: "Your username",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: ctrlPassword,
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
          Text(
            error,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                onLogin();
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
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
