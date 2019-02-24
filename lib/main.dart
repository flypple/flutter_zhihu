import 'package:flutter/material.dart';
import 'package:flutter_zhihu/pages/index/index.dart';
import 'global_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: GlobalConfig.themeData,
      home: Index(),
      debugShowCheckedModeBanner: false,
    );
  }
}
