import 'package:flutter/material.dart';
import 'package:shop_lift/bottom_bar.dart';
import 'package:shop_lift/constants.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ShopLift',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/category%2Falana-harris-TcpYjs6qF9o-unsplash.jpg?alt=media&token=9bf7d70c-a281-4f9e-8708-5dff0b419778'),
                        Text('Bakery & \n Dairy',style: kTextFieldLabelStyle,),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                elevation: 7.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/category%2Fmarjan_blan-dwKj2x_VZII-unsplash.jpg?alt=media&token=51c197af-cee8-4f0b-9020-3529fabaf86f'),
                        Text('Beverages',style: kTextFieldLabelStyle,),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                elevation: 7.0,
              ),
            ),
            new CatCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.color_lens),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}


