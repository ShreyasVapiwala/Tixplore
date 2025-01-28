import 'package:flutter/material.dart';
import 'package:ticket_reselling/screens/onboarding_screen.dart';
import 'package:ticket_reselling/screens/home_page.dart';
import 'package:ticket_reselling/screens/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket Reselling',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: StartScreen(), // This references the class in onboarding_screen.dart.
    );
  }
}
