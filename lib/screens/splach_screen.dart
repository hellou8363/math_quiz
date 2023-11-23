import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mlkit_digital_ink_recognition/google_mlkit_digital_ink_recognition.dart';
import 'package:math_quiz/screens/select_quiz_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool downloading = false;

  @override
  void initState() {
    super.initState();
    digitalInkInit();
  }

  Future<void> digitalInkInit() async {
    String languageCode = 'en';
    bool result = false;

    setState(() {
      downloading = true;
    });

    // 모델 관리자 인스턴스 생성
    final modelManager = DigitalInkRecognizerModelManager();

    // 모델이 다운로드되었는지 확인
    final bool response = await modelManager.isModelDownloaded(languageCode);
    print('모델 다운로드 여부: $response');

    if (!response) {
      print('다운로드 시작...');
      result = await modelManager.downloadModel(languageCode);
      print('모델 다운로드: $languageCode ... 모델 다운로드 결과: $result');
    }

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SelectQuizScreen()),
      );
    }

    // setState(() {
    //   downloading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Math Quiz',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              if (downloading) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
