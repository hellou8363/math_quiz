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
    String sign = widget.selectedQuiz;
    int level = widget.level;
    int count = 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('$count / 10'),
        centerTitle: true,
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                print('메모 삭제');
              },
              child: const Text(
                '메모 삭제',
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$sign',
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      _number(123),
                      _number(321),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 5,
              thickness: 5,
              indent: 15,
              endIndent: 15,
            ),
            const Expanded(child: SizedBox()),
            Column(
              children: [
                Container( // 디지털 잉크 인식 부분
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _bottomButton('다시쓰기'),
                    _bottomButton('정답확인'),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _number(int number) {
    return Text(
      '$number',
      style: const TextStyle(
        fontSize: 80,
        fontWeight: FontWeight.bold,
        letterSpacing: 10,
      ),
    );
  }

  Widget _bottomButton(String buttonName) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Text(
          '$buttonName',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
