import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/News/news.dart';
import 'package:flutter_auth/Screens/Product/product.dart';
import 'package:flutter_auth/Screens/Profile/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final items = const [
    Icon(
      Icons.home,
      size: 30,
    ),
    Icon(
      Icons.person,
      size: 30,
    ),
    Icon(
      Icons.shop,
      size: 30,
    )
  ];

  int index = 1;

  void getPageName() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selctedIndex) {
          setState(() {
            index = selctedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const NewsPage();
        break;
      case 1:
        widget = ProfilePage();
        break;
      default:
        widget = const Product();
        break;
    }
    return widget;
  }
}
