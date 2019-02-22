import 'package:flutter/material.dart';

class UniversityPage extends StatefulWidget {
  @override
  _UniversityPageState createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("大学"),
        ),
        body: Center(
          child: Text("大学"),
        ),
      ),
    );
  }
}
