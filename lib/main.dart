import 'package:flutter/material.dart';
import 'package:shop_lift/screens/login_screen.dart';
import 'package:shop_lift/screens/registration_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id : (context) => LoginPage(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
