import 'package:flutter/material.dart';

class QuizSolutionScreen extends StatefulWidget {
  final String selectedQuiz;
  final int level;

  const QuizSolutionScreen({
    super.key,
    required this.selectedQuiz,
    required this.level,
  });

  @override
  State<QuizSolutionScreen> createState() => _QuizSolutionScreenState();
}

class _QuizSolutionScreenState extends State<QuizSolutionScreen> {
  @override
  Widget build(BuildContext context) {
    /*
    - 손으로 답을 쓸 수 있도록 디지털 잉크 사용
    - 답을 지울 수 있는 지우개 필요(전체 지우개)
    - 문제 위에 메모 할 수 있는 기능 필요(부분 지우개 or 전체 지우개)
    - 상단에 문제 풀이 개수 / 전체 개수
    - 정답을 자릿수 별로 받을지 전체 받을지 결정 필요
    - 안드로이드 버전에서 전체로 받으면서 자릿수가 긴 답을 문자로 인식해서 오류가 있었음
     */
    String selectedQuiz = widget.selectedQuiz;
    int level = widget.level;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Text('QuizSolutionScreen'),
          Text('selectedQuiz => $selectedQuiz, level => $level'),
        ],
      )),
    );
  }
}
