import 'package:flutter/material.dart';

class Hot extends StatefulWidget {
  @override
  _HotState createState() => _HotState();
}

class _HotState extends State<Hot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("热门"),
      ),
    );
  }
}
