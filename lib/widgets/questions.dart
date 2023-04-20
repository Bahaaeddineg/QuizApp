import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question_to_show;
  const Question({required this.question_to_show});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height:MediaQuery.of(context).size.height*.15,
        child: Text(question_to_show,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
