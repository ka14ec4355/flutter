import 'package:flutter/material.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.clickedAnswers, super.key});

  final List<String> clickedAnswers;

  List<Map<String, Object>> getSummaryData() {
   final List<Map<String,Object>> summary = [];
    for(int i = 0 ; i<clickedAnswers.length;i++) {
      //dart syntax to create a map value "summary.add({})"
     summary.add({
       'question_index' : i,
       'question' : questions[i].text,
       //answer[0] because we keep correct answer in index 0 in question and answers list
       'correct_answer' : questions[i].answer[0],
       'user_answer' : clickedAnswers[i]
     });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numOfQuestions = questions.length;
    final numOfCorrectAnswers = summaryData.where((data){
      return data['correct_answer']==data['user_answer'];
    }).length;
    return SizedBox(
      //below line is used to fill the screen with the content
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("you have answered $numOfCorrectAnswers out of $numOfQuestions questions"),
              const SizedBox(height: 30,),
              QuestionSummary(summaryData),
              const SizedBox(height: 30,),
              TextButton(onPressed: () {}, child: const Text("back to quiz"))
            ],
          ),
        ));
  }
}
