import 'package:flutter/material.dart';
import 'package:revenant/user_sign_in/auth.dart';
import 'package:revenant/user_sign_in/login_page.dart';
import 'package:revenant/user_info/user_input.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentApp',
      home: userInput(),
    );
  }
}
