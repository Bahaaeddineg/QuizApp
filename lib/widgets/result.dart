import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/quizzWidget.dart';

class Result extends StatefulWidget {
  VoidCallback xx;
  Result({required this.xx});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (totalScore * 0.95 >= 80) {
        percentageColor = Colors.green;
      } else if (totalScore * 0.95 >= 40) {
        percentageColor = Colors.orange;
      } else if (totalScore < 0) {
        totalScore = 0;
        percentageColor = Colors.red;
      } else {
        percentageColor = Colors.red;
      }
    });

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
          child: Text('Done!',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
      SizedBox(
        height: 20,
      ),
      Text(
        'The result is ${totalScore * 0.95}%',
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: percentageColor),
      ),
      MaterialButton(
          child: Text(
            'Play again !',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          onPressed: widget.xx)
    ]);
  }
}
