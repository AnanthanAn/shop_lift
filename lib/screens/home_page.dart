import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_lift/bottom_bar.dart';
import 'package:shop_lift/constants.dart';
import 'package:shop_lift/screens/login_screen.dart';

import '../category_card.dart';

final _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  static String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        GestureDetector(child: Icon(Icons.input),onTap: (){
          _auth.signOut();
          Navigator.pushNamed(context, LoginPage.id);
        },)
      ],
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
            Card(child: Container(child:Image(image:  CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/alvaro-serrano--kr8XPYuSI8-unsplash.jpg?alt=media&token=240dde38-bc42-4f6e-9f86-be0e50971e94'),)),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Categories',
                  style: kHeaderStyles,
                ),
              ),
            ),
            CatCard(
              titleLabel: 'Bakery & \n Dairy',
              imageURL:
                  'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/category%2Falana-harris-TcpYjs6qF9o-unsplash.jpg?alt=media&token=9bf7d70c-a281-4f9e-8708-5dff0b419778',
            ),

            CatCard(
              titleLabel: 'Grains & \n Oils',
              imageURL:
                  'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/category%2Fbowl-close-up-dry-1311771.jpg?alt=media&token=67aeaf88-553d-442a-b591-b303c523a609',
            ),
            CatCard(
              titleLabel: 'Cosmetics',
              imageURL:
                'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/category%2Fthe-honest-company-jQ6HxTqSgfU-unsplash.jpg?alt=media&token=68dcd3a8-8569-4635-9f91-6971e9a540d7'
            ),
            CatCard(
                titleLabel: 'Snacks & \n Food',
                imageURL:
                'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/category%2Frachael-gorjestani-evsoUV1EyXY-unsplash.jpg?alt=media&token=2a3e8bea-1eaa-41d4-af6a-e873441e397c'
            ),
            CatCard(
              titleLabel: 'Beverages',
              imageURL:
              'https://firebasestorage.googleapis.com/v0/b/shoplift-c03d5.appspot.com/o/category%2Fmarjan_blan-dwKj2x_VZII-unsplash.jpg?alt=media&token=51c197af-cee8-4f0b-9020-3529fabaf86f',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.store,size: 30,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
