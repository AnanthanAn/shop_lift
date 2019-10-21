import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shop_lift/constants.dart';
import 'package:shop_lift/screens/home_page.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'regisration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = Firestore.instance.collection('users');

  String _email;
  String _password;
  String _confirmPassword;
  String _name;
  String _flatNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'NAME',
                          labelStyle: kTextFieldLabelStyle,
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        onChanged: (value) {
                          _name = value;
                        },
                      ),
                      TextField(
                        onChanged: (value) {
                          _email = value;
                        },
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: kTextFieldLabelStyle,
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: kTextFieldLabelStyle,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'CONFIRM PASSWORD ',
                            labelStyle: kTextFieldLabelStyle,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'FLAT NO',
                          labelStyle: kTextFieldLabelStyle,
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        onChanged: (value) {
                          _flatNo = value;
                        },
                      ),
                      SizedBox(height: 50.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () async {
                                var progressDialog = new ProgressDialog(context);
                                progressDialog.show();
                                try {
                                  if (_password != _confirmPassword || _password == null) {
                                    Fluttertoast.showToast(msg: 'Passwords dont match.please check');
                                  }
                                  var newUser = await _firebaseAuth
                                      .createUserWithEmailAndPassword(
                                          email: _email, password: _password)
                                      .whenComplete(() {
                                    print('User registered successfully');
                                  });
                                  _firestore
                                      .document(newUser.user.uid)
                                      .setData({
                                    'id': newUser.user.uid,
                                    'name': _name,
                                    'email': newUser.user.email,
                                    'flatNo': _flatNo,
                                  }).whenComplete(() {
                                    print('added to users');
                                    progressDialog.dismiss();
                                    Navigator.pushNamed(context, HomePage.id);
                                    newUser.user.sendEmailVerification();
                                  });
                                } catch (e) {
                                  print(e);
                                  print(_email);
                                  print(_password);
                                }
                              },
                              child: Center(
                                child: Text('SIGNUP', style: kButtonTextStyle),
                              ),
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text('Go Back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ]));
  }
}