import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("通知"),
        ),
        body: Center(
          child: Text("通知"),
        ),
      ),
    );
  }
}
