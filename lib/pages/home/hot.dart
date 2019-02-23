import 'package:flutter/material.dart';
import 'data/question.dart';
import 'item.dart';

class Hot extends StatefulWidget {
  @override
  _HotState createState() => _HotState();
}

class _HotState extends State<Hot> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            HotItem(questionList[0]),
            HotItem(questionList[1]),
            HotItem(questionList[2]),
            HotItem(questionList[3]),
            HotItem(questionList[4]),
            HotItem(questionList[5]),
            HotItem(questionList[6]),
          ],
        ),
      ),
    );
  }
}
