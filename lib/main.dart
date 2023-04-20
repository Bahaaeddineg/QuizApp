import 'package:flutter/material.dart';
import 'widgets/quizzWidget.dart';
import 'widgets/result.dart';
import 'Data/data.dart';

void main() {
 
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Quizz(),
  ));
}

class Quizz extends StatefulWidget {
  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  void increaseIndex(){                      // Notation 1 // i want the new state here not in the QuizzWidget
    setState(() {
                    question_index++;
                    ok = Colors.blue;       // to reset the answers Color each time a new question is shown 
                  });
  }
  void decreaseIndex(){
     setState(() {
                    question_index == 0 ? question_index = 0 : question_index--;
                    ok = Colors.blue;
                  });
  }
  void play_again() => setState(() {question_index = 0;
      totalScore=0;});    // to get back to the first question

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
            backgroundColor: Colors.blue[900],
            centerTitle: true,
            title: const Text('QuizzApp')),
        body: question_index >= questionList.length
            ? Result(                                          //if question index == questionList.length means that
                xx: play_again,                                 // we completed the questions so we have to show message or Score ...
              )  
            : QuizzWidget(toIncreaseIndex: increaseIndex,toDecreaseIndex: decreaseIndex,));  
  }
}
