import 'package:flutter/material.dart';
import 'package:math_quiz/screens/splach_screen.dart';
import 'package:math_quiz/screens/utils/drawing_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DrawingProvider()),
      ],
      child: MaterialApp(
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
        home: ChangeNotifierProvider(
          create: (context) => DrawingProvider(),
          child: const SplashScreen(),
        ),
      ),
    );
  }
}
