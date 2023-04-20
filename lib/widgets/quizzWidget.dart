import 'package:flutter/material.dart';
import 'questions.dart';
import 'answers.dart';
import '../main.dart';
import '../Data/data.dart';

int question_index = 0;
int totalScore=0;
Color ok = Colors.blue;
Color percentageColor=Colors.black;

class QuizzWidget extends StatefulWidget {
  VoidCallback toIncreaseIndex;
  VoidCallback toDecreaseIndex;
  QuizzWidget({
    required this.toIncreaseIndex,
    required this.toDecreaseIndex,
  });

  @override
  State<QuizzWidget> createState() => _QuizzWidgetState();
}

class _QuizzWidgetState extends State<QuizzWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          Question(
              question_to_show:
                  questionList[question_index]['question'].toString()),
          ...(questionList[question_index]['answer']
                  as List<String>)                                                // note here it solves many problems
              .map((e) => Answers(
                    score: questionList[question_index]['score'] as int,                                                              // ... to say , add this new list elements to the end of the previous ones
                    answer_to_show:
                        e,                                                         // as List<String> this is a typeCast to specify the type of the questionList[question_index]['answer']
                    right_answer: questionList[question_index]['right'],
                    current_answer:
                        (questionList[question_index]['answer'] as List<String>)
                            .indexOf(e),
                  ))
              .toList()
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MaterialButton(
                onPressed: widget.toDecreaseIndex,
                child: const Icon(Icons.keyboard_arrow_left_sharp, size: 80)),
            const Icon(
              Icons.lightbulb,
              size: 80,
              color: Colors.yellow,
            ),
            MaterialButton(
                onPressed: widget.toIncreaseIndex,
                child: const Icon(Icons.keyboard_arrow_right_sharp, size: 80)),
          ],
        ),
      ],
    );
  }
}
