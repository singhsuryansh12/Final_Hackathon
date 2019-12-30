import 'package:flutter/material.dart';
import 'package:revenant/user_sign_in/auth.dart';
import 'package:revenant/user_info/user_input.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: Auth(),
    );
  }
}
