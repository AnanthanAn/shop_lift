import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  static Color activeColor = Colors.green;
  static Color inactiveColor = Color(0xFF676E79);
  Color selectedColor = activeColor;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(Icons.home, color: selectedColor),
                            onTap: () {
                              setState(() {
                                selectedColor = inactiveColor;

                              });
                            },
                          ),
                          GestureDetector(
                            child: Icon(
                              Icons.person_outline,
                              color: selectedColor,
                            ),onTap: (){
                              setState(() {
                                selectedColor = activeColor;
                              });
                          },
                          )
                        ],
                      )),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.search, color: Color(0xFF676E79)),
                          Icon(Icons.shopping_basket, color: Color(0xFF676E79))
                        ],
                      )),
                ])));
  }
}
