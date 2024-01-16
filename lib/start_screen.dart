import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz , {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'assets/images/image.jpg',
        width: 300,
      ),
      const SizedBox(
        height: 60,
      ),
      const Text(
        "LEARN FLUTTER IN FUN WAY",
        style: TextStyle(color: Colors.white),
      ),
      const SizedBox(
        height: 30,
      ),
      OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("START QUIZ"))
    ]));
  }
}
