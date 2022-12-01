import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Edit/edit.dart';
import 'package:flutter_auth/Screens/Profile/components/decor.dart';
import 'package:flutter_auth/Screens/Profile/components/information.dart';
import 'package:flutter_auth/Screens/QRCode/qrcode.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/helpers/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('My Profile'),
          // backgroundColor: Colors.blue[300],
          automaticallyImplyLeading: false,
          elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  kPrimaryColor,
                  kPrimaryLightColor,
                ])),
          )),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: UserInfo()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    tooltip: "QR",
                    onPressed: (() {
                      ProfileHelper.redirect(
                          context, GeneratePage());
                    }),
                    icon: const Icon(
                      Icons.qr_code,
                      size: 25,
                      color: Colors.grey,
                    )),
                IconButton(
                  tooltip: "Setting",
                  onPressed: (() {
                    ProfileHelper.redirect(context, const EditProfileScreen());
                  }),
                  icon: const Icon(
                    Icons.settings,
                    size: 25,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
