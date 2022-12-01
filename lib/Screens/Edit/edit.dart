import 'package:flutter/material.dart';
import 'package:flutter_auth/helpers/profile.dart';

import 'components/body.dart';
import '../../constants.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  kPrimaryColor,
                  Colors.purple,
                  kPrimaryLightColor,
                ])),
          )
      ),
      body: Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: Body(),
            ),
            Spacer(),
          ],
        ),
    );
  }
}