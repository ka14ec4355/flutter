import 'package:flutter/material.dart';
import 'package:quizz/questions_screen.dart';
import 'package:quizz/start_screen.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
/*
  //Widget activeScreen = const StartScreen(switchState);
  //in the above line , switchState is used before the function switchState is executed
  //but only Widget activeScreen = const StartScreen; is required to display startscreen and switchstate
  //is required only when the button is pressed to solve this we use initState and below line
  //Widget? activeScreen; (? is used which makes flutter think that activescreen can also be null)
  Widget? activeScreen;
  //we can also achive the required solution of switching the widget on press of the button
  //without using initState
  @override
  void initState() {
    //initState is used to do extra intialization work when the state object is
    // created for first time
    //initState will only be intialized and executed when required
    //initState is called only after the object was crated
    //as initState is run after the state object is created ,hence
    // initially activescreen will be null when the state object is created with the function switchscreen
    //once the object is created initState function is run and activescreen is assigned with the
    //startscreen constructor with the parameter switchscreen
    //
    activeScreen = StartScreen(switchState);
    super.initState();
  }
  void switchState() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
  */
  var activeScreen = "start_screen";
  List<String> answersOfQuestion = [];

  void switchScreen() {
    setState(() {
      activeScreen = "questions_screen";
    });
  }

  void choosedAnswer(String answer) {
    answersOfQuestion.add(answer);
    setState(() {
      //we are setting result screen in this page because answer are stored in this
      //page and screen change code is present in this page
      if (answersOfQuestion.length == questions.length) {

        //answersOfQuestion = [];
        activeScreen = 'results-screen';
      }
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions_screen') {
      screenWidget = QuestionsScreen(storeAnswer: choosedAnswer);
    }
    if(activeScreen == 'results-screen')
      {
        screenWidget = ResultScreen(clickedAnswers: answersOfQuestion,);
      }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            gradient: LinearGradient(colors: [
              Colors.deepPurple.shade600,
              Colors.deepPurple.shade500
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          //below code can also be used to switch screens
          // child: activeScreen == 'start_screen'
          //   ? StartScreen(switchScreen)
          // : QuestionsScreen(storeAnswer: choosedAnswer),
          child: screenWidget,
        ),
      ),
    );
  }
}
