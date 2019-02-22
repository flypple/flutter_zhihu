import 'package:flutter/material.dart';

class IdeaPage extends StatefulWidget {
  @override
  _IdeaPageState createState() => _IdeaPageState();
}

class _IdeaPageState extends State<IdeaPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("想法"),
        ),
        body: Center(
          child: Text("想法"),
        ),
      ),
    );
  }
}
