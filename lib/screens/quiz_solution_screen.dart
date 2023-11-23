import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_quiz/screens/utils/drawing_painter.dart';
import 'package:math_quiz/screens/utils/drawing_provider.dart';
import 'package:provider/provider.dart';

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
  bool _eraseMode = false;

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<DrawingProvider>(context);

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
                setState(() {
                  _eraseMode = !_eraseMode;
                });
                p.changeEraseMode();
              },
              child: Image.asset(
                _eraseMode
                    ? 'assets/img/eraser_off.png'
                    : 'assets/img/eraser_on.png',
                width: 30,
                height: 30,
                scale: 2,
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                child: Stack(
                  children: [
                    Column(
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
                      ],
                    ),
                    Positioned.fill(
                      child: CustomPaint(
                        painter: DrawingPainter(p.lines),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onPanStart: (s) {
                        if (p.eraseMode) {
                          p.erase(s.localPosition);
                        } else {
                          p.drawStart(s.localPosition);
                        }
                      },
                      onPanUpdate: (s) {
                        if (p.eraseMode) {
                          p.erase(s.localPosition);
                        } else {
                          p.drawing(s.localPosition);
                        }
                      },
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  // 디지털 잉크 인식 부분
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
