import 'package:flutter/material.dart';
import '../../constants.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Product Page"),
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
                    kPrimaryColor,
                  ])),
            )));
  }
}
