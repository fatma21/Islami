import 'package:flutter/material.dart';
import 'package:islami/core/screens/home_screens/home_screen.dart';
import 'package:islami/core/screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

