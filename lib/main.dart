import 'package:flutter/material.dart';
import './Home.dart' as home;
import './loginStuff.dart' as login;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp(){
    _login();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'UGrub',
      theme: new ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
      home: new home.HomePage()
    );
  }

  _login() async {
    await login.checkLogin();
  }
}



