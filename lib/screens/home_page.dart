import 'package:flutter/material.dart';
import 'package:shop_lift/bottom_bar.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Colors.green,
      child: Icon(Icons.color_lens),
    ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,bottomNavigationBar: BottomBar(),);
  }
}
