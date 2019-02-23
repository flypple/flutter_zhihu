import 'package:flutter/material.dart';
import 'package:flutter_zhihu/pages/home/data/article.dart';
import 'package:flutter_zhihu/global_config.dart';
import 'data/question.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  final bool showUserInfo;

  ArticleItem(this.article, this.showUserInfo);

  @override
  Widget build(BuildContext context) {
    Widget markWidget;
    if (article.imgUrl == null) {
      markWidget = Text(
        article.mark,
        style: TextStyle(
          color: GlobalConfig.fontColor,
          height: 1.3,
        ),
      );
    } else {
      markWidget = Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                article.mark,
                style: TextStyle(
                  color: GlobalConfig.fontColor,
                  height: 1.3,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 3 / 2,
              child: Container(
                foregroundDecoration:new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage(article.imgUrl),
                      centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                    ),
                    borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                ),
              ),
            ),
          )
        ],
      );
    }

    Widget userInfoWidget;
    if (showUserInfo) {
      userInfoWidget = Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(article.headUrl),
                radius: 11,
              ),
            ),
            Text(
              "  ${article.user} ${article.action} · ${article.time}",
              style: TextStyle(
                  color: GlobalConfig.fontColor
              ),
            ),
          ],
        ),
      );
    } else {
      userInfoWidget = Container();
    }

    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      color: GlobalConfig.backgroundColor,
      child: FlatButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            userInfoWidget,
            Container(
              margin: const EdgeInsets.only(top: 6, bottom: 2),
              child: Text(
                article.title,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.3,
                    fontWeight: FontWeight.bold
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            Container(
              child: markWidget,
              margin: const EdgeInsets.only(top: 6),
              alignment: Alignment.topLeft,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text(
                        "${article.agreeNum} 赞同 · ${article.commentNum} 评论",
                        style: TextStyle(
                          color: GlobalConfig.fontColor,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.linear_scale, color: GlobalConfig.fontColor,),
                    itemBuilder: (context){
                      return [
                        PopupMenuItem(
                          value: "第一项的值",
                          child: Text("屏蔽这个问题"),
                        ),
                        PopupMenuItem(
                          value: "第二项的值",
                          child: Text("取消关注 ${article.user}"),
                        ),
                        PopupMenuItem(
                          value: "第三项的值",
                          child: Text("举报"),
                        ),
                      ];
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BillboardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      color: GlobalConfig.backgroundColor,
      child: FlatButton(
        onPressed: (){

        },
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://pic1.zhimg.com/50/v2-0c9de2012cc4c5e8b01657d96da35534_s.jpg",
                      ),
                      radius: 11,
                    ),
                    margin: const EdgeInsets.only(right: 6),
                  ),
                  Text("对啊网", style: TextStyle(color: GlobalConfig.fontColor),)
                ],
              ),
              margin: const EdgeInsets.only(top: 10,),
            ),
            Container(
              child: Text(
                "考过CPA，非名牌大学也能进名企",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1.3,
                ),
              ),
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 6, bottom: 2),
            ),
            Container(
              child: AspectRatio(
                aspectRatio: 3 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://pic2.zhimg.com/50/v2-6416ef6d3181117a0177275286fac8f3_hd.jpg"),
                      centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                    ),
                    borderRadius: BorderRadius.all(const Radius.circular(6)),
                  ),
                ),
              ),
            ),
            Container(
                child: new Text(
                    "还在羡慕别人的好工作？免费领取价值1980元的注册会计师课程，为自己充电！",
                    style: new TextStyle(height: 1.3, color: GlobalConfig.fontColor)
                ),
                padding: const EdgeInsets.only(bottom: 8.0)
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: GlobalConfig.fontColor),
                        borderRadius: BorderRadius.all(Radius.circular(2))
                    ),
                    padding: const EdgeInsets.only(left: 3, top: 2, right: 3, bottom: 2),
                    child: Text("广告", style: TextStyle(fontSize: 10, color: GlobalConfig.fontColor),),
                  ),
                  Expanded(
                    child: Container(
                      child: Text("查看详情", style: TextStyle(color: GlobalConfig.fontColor),),
                      margin: const EdgeInsets.only(left: 6),
                    ),
                  ),
                  Container(
                    child: Icon(Icons.clear, color: GlobalConfig.fontColor,),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(bottom: 10),
            )
          ],
        ),
      ),
    );
  }
}

class HotItem extends StatelessWidget {
  final Question question;

  HotItem(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: GlobalConfig.backgroundColor,
          border: new BorderDirectional(
              bottom: new BorderSide(color: Colors.white12)
          )
      ),
      child: FlatButton(
        onPressed: (){},
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          question.order,
                          style: TextStyle(
                              color: question.order.compareTo("03") <= 0 ? Colors.red : Colors.yellow,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1.3
                          ),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      question.rise == null ? Container() :
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.arrow_upward,
                            size: 10,
                            color: question.order.compareTo("03") <= 0 ? Colors.red : Colors.yellow,
                          ),
                          Text(
                              question.rise,
                              style: TextStyle(
                                  color: question.order.compareTo("03") <= 0 ? Colors.red : Colors.yellow,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 6, bottom: 2),
                        child: Text(
                          question.title,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      question.mark == null ? Container() :
                      Container(
                        child: Text(
                          question.mark,
                          style: TextStyle(
                            color: GlobalConfig.fontColor,
                            height: 1.3,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "${question.hotNum} 万热度",
                          style: TextStyle(
                            color: GlobalConfig.fontColor,
                            height: 1.3,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(question.imgUrl),
                            centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(6))
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
