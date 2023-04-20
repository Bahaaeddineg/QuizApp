import 'package:flutter/material.dart';
import 'quizzWidget.dart';

class Answers extends StatefulWidget {
  final String answer_to_show;
  final right_answer;
  final current_answer;
  int score;
  Answers(
      {required this.answer_to_show,
      required this.right_answer,
      required this.current_answer,
      required this.score});

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  @override
  Widget build(BuildContext context) {
    void ifSame() {
      // to compare the index of the chosen answer with the index of the right answer
      setState(() {
        
        if (widget.current_answer == widget.right_answer){
          ok=Colors.green;
          totalScore+=widget.score ;
        }else {
          ok=Colors.red;
          totalScore-=5;
        }
        
      });
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: InkWell(
        onTap: ifSame,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration:
              BoxDecoration(color: ok, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              widget.answer_to_show,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
