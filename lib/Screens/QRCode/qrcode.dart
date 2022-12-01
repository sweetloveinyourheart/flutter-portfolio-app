import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

import '../../constants.dart';


class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData =
      "https://github.com/neon97"; // already generated qr code when the page opens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('QR Code Generator'),
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
          )),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImage(
              //plce where the QR Image will be shown
              data: qrData,
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              "Share Your QR Code",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: kPrimaryColor, fontWeight: FontWeight.bold)
            ),
          ],
        ),
      ),
    );
  }

  final qrdataFeed = TextEditingController();
}