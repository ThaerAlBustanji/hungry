import 'package:flutter/material.dart';
import 'package:hungry/features/auth/view/signup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hungry App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      home: SignupView()
    );
  }
}

