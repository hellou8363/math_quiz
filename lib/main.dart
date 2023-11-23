import 'package:flutter/material.dart';
import 'package:math_quiz/screens/splach_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
          toolbarTextStyle: TextStyle(
            color: Colors.black,
          ),
          elevation: 0,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
