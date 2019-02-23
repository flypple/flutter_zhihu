import 'package:flutter/material.dart';
import 'item.dart';
import 'package:flutter_zhihu/pages/home/data/article.dart';

class Follow extends StatefulWidget {
  @override
  _FollowState createState() => _FollowState();
}

class _FollowState extends State<Follow> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          children: <Widget>[
            ArticleItem(articleList[0], true),
            ArticleItem(articleList[1], true),
            BillboardItem(),
            ArticleItem(articleList[2], true),
            ArticleItem(articleList[3], true),
          ],
        ),
      ),
    );
  }
}
