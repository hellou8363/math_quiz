import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_quiz/screens/quiz_solution_screen.dart';

class SelectQuizScreen extends StatefulWidget {
  const SelectQuizScreen({super.key});

  @override
  State<SelectQuizScreen> createState() => _SelectQuizScreenState();
}

class _SelectQuizScreenState extends State<SelectQuizScreen> {
  int _screenNumber = 1;
  late String _selectedQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screenNumber == 1 ? _firstSelect() : _secondSelect(),
      ),
    );
  }

  Widget _firstSelect() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _firstSelectButton('+'),
            const SizedBox(width: 20),
            _firstSelectButton('-'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _firstSelectButton('*'),
            const SizedBox(width: 20),
            _firstSelectButton('/'),
          ],
        ),
      ],
    );
  }

  Widget _secondSelect() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _secondSelectButton(1),
          const SizedBox(height: 20),
          _secondSelectButton(2),
          const SizedBox(height: 20),
          _secondSelectButton(3),
          const SizedBox(height: 20),
          _secondSelectButton(4),
        ],
      ),
    );
  }

  Widget _firstSelectButton(String value) {
    return InkWell(
      onTap: () {
        setState(() {
          _screenNumber = 2;
          _selectedQuiz = value;
        });
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          value == '+'
              ? CupertinoIcons.add
              : value == '-'
                  ? CupertinoIcons.minus
                  : value == '*'
                      ? CupertinoIcons.multiply
                      : CupertinoIcons.divide,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _secondSelectButton(int level) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => QuizSolutionScreen(selectedQuiz: _selectedQuiz, level: level,),
          ),
        );
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          'Level $level',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
