import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> historyList = ["机器学习和AI", "三体", "有哪些未来科技是可预期的", "流浪地球"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: _createSearchBar(),
        ),
        body: createHotRecommentAndHistory(),
      ),
    );
  }

  Widget _createSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: GlobalConfig.searchBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: GlobalConfig.fontColor,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "搜索知乎问题",
                  hintStyle: TextStyle(color: GlobalConfig.fontColor),
                ),
                autofocus: false,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createHotRecommentAndHistory() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "知乎热搜",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
            alignment: Alignment.topLeft,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RecommendItem("考公务员要怎么准备"),
                    RecommendItem("建筑部将取消公摊"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    RecommendItem("小米9"),
                    RecommendItem("京东辟谣刘强东被捕"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              "历史搜索",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
            alignment: Alignment.topLeft,
          ),
          Container(
            child: Flexible(
              child: ListView.builder(
                itemCount: historyList.length,
                itemBuilder: (context, index) {
                  return HistoryItem(historyList[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendItem extends StatelessWidget {
  final String text;

  RecommendItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(
        label: FlatButton(
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
              color: GlobalConfig.fontColor,
            ),
          ),
        ),
        backgroundColor: GlobalConfig.searchBackgroundColor,
      ),
      padding: EdgeInsets.only(left: 16, bottom: 16),
      alignment: Alignment.topLeft,
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String text;

  HistoryItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      padding: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.white10),
      )),
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.access_time,
              color: GlobalConfig.fontColor,
              size: 16,
            ),
            margin: EdgeInsets.only(right: 12),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: GlobalConfig.fontColor,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            child: Icon(
              Icons.clear,
              color: GlobalConfig.fontColor,
              size: 16,
            ),
          )
        ],
      ),
    );
  }
}
