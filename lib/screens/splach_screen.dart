import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_quiz/screens/select_quiz_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SelectQuizScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Google ML Kit를 다운로드 받는 동안 보여줄 페이지
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'SplashScreen',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
