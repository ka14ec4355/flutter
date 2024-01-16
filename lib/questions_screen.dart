import 'package:flutter/material.dart';
import 'package:quizz/models/answer_button.dart';
import 'package:quizz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.storeAnswer});

  final void Function(String answer) storeAnswer;

  //storeAnswer should be available in the state class as well as we are in the
  //statefull widget class
  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionNo = 0;

  void answeredQuestion(String answer) {
    //this line is used to access the answer from the widget class above
    widget.storeAnswer(answer);
    setState(() {
      currentQuestionNo = currentQuestionNo + 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionNo];
    return SizedBox(
      //below line is used to fill the screen with the content
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          //below line is used to set alignment vertically
          mainAxisAlignment: MainAxisAlignment.center,
          //below line is used to set alignment horizontally
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80),
            //if the requirement is to get widgets for every entry in a list , we follow below code
            //below line allows us to create buttons dynamically depending upon the
            //number of answers present in the questions.dart for a particular question
            //... is a spread function in flutter used to "spread" the
            //elements of an iterable (such as a list or set) into another collection
            // or as arguments to a function.
            //map function maps the answers to the button text.
            //in the below line getShuffledList gives a list of shuffled answers
            // picking up the answer list of a question from the quiz_questions.dart
            //
            ...currentQuestion.getShuffledList().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    //this function is executed only on tap of button and not while creating
                    //the button for display
                    answeredQuestion(answer);
                  });
            }),
            //instead of hard coading the buttons , we use map and spread function to generate
            //buttons dynamically,
            /* AnswerButton(answerText: 'answer 1', onTap: () {}),
            const SizedBox(height: 10),
            AnswerButton(answerText: 'answer 2', onTap: () {}),
            const SizedBox(height: 10),
            AnswerButton(answerText: 'answer 3', onTap: () {}),*/
          ],
        ),
      ),
    );
  }
}
