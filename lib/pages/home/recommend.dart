import 'package:flutter/material.dart';
import 'item.dart';
import 'package:flutter_zhihu/pages/home/data/article.dart';

class Recommend extends StatefulWidget {
  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: Column(
          children: <Widget>[
            ArticleItem(articleList[2], false),
            ArticleItem(articleList[0], false),
            ArticleItem(articleList[1], false),
          ],
        ),
      ),
    );
  }
}