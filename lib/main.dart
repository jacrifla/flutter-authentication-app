// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'screens/sign_in.dart';
import 'screens/sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SignIn(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}
