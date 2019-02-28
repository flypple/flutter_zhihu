import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';
import 'package:flutter_zhihu/pages/home/search_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  Widget _createItem1(String title, String number){
    return Expanded(
      flex: 1,
      child: FlatButton(
        onPressed: (){},
        child: Container(
          padding: EdgeInsets.only(bottom: 12),
          child: Column(
            children: <Widget>[
              Text(number, style: TextStyle(color: GlobalConfig.fontColor, fontSize: 16,),),
              Text(title, style: TextStyle(color: GlobalConfig.fontColor, fontSize: 12,),),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createItem2(String title, IconData icon, Color color){
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: ScreenUtil().setHeight(180),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              child: Icon(icon, color: Colors.white,),
              backgroundColor: color,
            ),
            Text(title, style: TextStyle(color: GlobalConfig.fontColor),)
          ],
        ),
      ),
    );
  }

  Widget _createItem3(String url, {double ratio, double width, EdgeInsets margin}){
    return Container(
      width: width == null ? MediaQuery.of(context).size.width / 2.5 : width,
      child: AspectRatio(
        aspectRatio: ratio == null ? 2 / 1 : ratio,
        child: Container(
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              image: DecorationImage(
                image: NetworkImage(url),
                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
              )
          ),
        ),
      ),
      margin: margin == null ? EdgeInsets.only(right: 6) : margin,
    );
  }

  Widget _createItem4(String title, String subTitle, String url, {EdgeInsets margin,}){
    return Container(
      decoration: BoxDecoration(
        color: GlobalConfig.searchBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      padding: EdgeInsets.all(10),
      margin: margin == null ? EdgeInsets.only(right: 6) : margin,
      width: MediaQuery.of(context).size.width * 3 / 4 ,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.3),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(color: GlobalConfig.fontColor, height: 1.3,),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          _createItem3(
            url,
            ratio: 1,
            width: MediaQuery.of(context).size.width / 5,
            margin: EdgeInsets.all(0),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget searchBar = Container(
      child: FlatButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>SearchPage(),
          ));
        },
        child: Row(
          children: <Widget>[
            Icon(Icons.search, color: Colors.white70,),
            Expanded(
              child: Container(
                child: Text("搜索知乎内容", style: TextStyle(color: Colors.white70,),),
                margin: EdgeInsets.only(left: 16),
              ),
            ),
            IconButton(icon: Icon(Icons.settings_overscan, color: Colors.white70,), onPressed: (){})
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: GlobalConfig.searchBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );

    Widget body = Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12,),
            color: GlobalConfig.itemBackgroundColor,
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://pic1.zhimg.com/v2-ec7ed574da66e1b495fcad2cc3d71cb9_xl.jpg"),
                      radius: 20,
                    ),
                    title: Text("Learner", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    subtitle: Text("查看或编辑个人主页", style: TextStyle(color: GlobalConfig.fontColor),),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: GlobalConfig.searchBackgroundColor
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _createItem1("我的创作", "57"),
                      Container(
                        width: 1,
                        height: 14,
                        color: Colors.white24,
                      ),
                      _createItem1("关注", "210"),
                      Container(
                        width: 1,
                        height: 14,
                        color: Colors.white24,
                      ),
                      _createItem1("我的收藏", "88"),
                      Container(
                        width: 1,
                        height: 14,
                        color: Colors.white24,
                      ),
                      _createItem1("最近浏览", "33"),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(480),
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 12, top: 4, right: 12, bottom: 4),
            color: GlobalConfig.itemBackgroundColor,
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                _createItem2("学习记录", Icons.chrome_reader_mode, Colors.blueAccent),
                _createItem2("已购", Icons.shopping_basket, Colors.lightBlueAccent),
                _createItem2("余额礼券", Icons.credit_card, Colors.blueAccent),
                _createItem2("我的Live", Icons.flash_on, Colors.blue),
                _createItem2("我的书架", Icons.book, Colors.green),
                _createItem2("下载中心", Icons.file_download, Colors.deepOrange),
                _createItem2("付费咨询", Icons.monetization_on, Colors.amber),
                _createItem2("活动广场", Icons.extension, Colors.deepPurpleAccent),
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(240),
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 2),
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                _createItem2("社区建设", Icons.invert_colors, Colors.orangeAccent),
                _createItem2("反馈与帮助", Icons.flag, Colors.blueGrey),
                _createItem2("日间模式", Icons.wb_sunny, Colors.orange),
                _createItem2("设置", Icons.settings, Colors.grey),
              ],
            ),
            color: GlobalConfig.itemBackgroundColor,
          ),
          Container(
            margin: EdgeInsets.only(top: 10,),
            padding: EdgeInsets.only(left: 8, top: 10, right: 6, bottom: 10,),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.videocam, color: Colors.white,),
                      backgroundColor: Colors.orange,
                    ),
                    title: Text(
                      "视频创作",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){},
                  child: Text("拍一个", style: TextStyle(color: Colors.blue),),
                )
              ],
            ),
            color: GlobalConfig.itemBackgroundColor,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 6, bottom: 10,),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  _createItem3("https://pic2.zhimg.com/50/v2-5942a51e6b834f10074f8d50be5bbd4d_400x224.jpg"),
                  _createItem3("https://pic3.zhimg.com/50/v2-7fc9a1572c6fc72a3dea0b73a9be36e7_400x224.jpg"),
                  _createItem3("https://pic4.zhimg.com/50/v2-898f43a488b606061c877ac2a471e221_400x224.jpg"),
                  _createItem3("https://pic1.zhimg.com/50/v2-0008057d1ad2bd813aea4fc247959e63_400x224.jpg"),
                ],
              ),
            ),
            color: GlobalConfig.itemBackgroundColor,
          ),
          Container(
            margin: EdgeInsets.only(top: 10,),
            padding: EdgeInsets.only(left: 8, top: 10, right: 6, bottom: 10,),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.all_inclusive, color: Colors.white,),
                      backgroundColor: Colors.lightBlue,
                    ),
                    title: Text(
                      "想法",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){},
                  child: Text("去往想法首页", style: TextStyle(color: Colors.blue),),
                )
              ],
            ),
            color: GlobalConfig.itemBackgroundColor,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 6, bottom: 10,),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  _createItem4(
                    "苹果 WWDC 2018 正在举行",
                    "软件更新意料之中，硬件之谜...",
                    "https://pic2.zhimg.com/50/v2-55039fa535f3fe06365c0fcdaa9e3847_400x224.jpg",
                  ),
                  _createItem4(
                    "此刻你的桌子是什么样子",
                    "晒一晒你的书桌/办公桌",
                    "https://pic3.zhimg.com/v2-b4551f702970ff37709cdd7fd884de5e_294x245|adx4.png",
                  ),_createItem4(
                    "关于高考你印象最深的是...",
                    "聊聊你的高三生活",
                    "https://pic2.zhimg.com/50/v2-ce2e01a047e4aba9bfabf8469cfd3e75_400x224.jpg",
                  ),
                  _createItem4(
                    "夏天一定要吃的食物有哪些",
                    "最适合夏天吃的那种",
                    "https://pic1.zhimg.com/50/v2-bb3806c2ced60e5b7f38a0aa06b89511_400x224.jpg",
                  ),
                ],
              ),
            ),
            alignment: Alignment.centerLeft,
            color: GlobalConfig.itemBackgroundColor,
          ),
        ],
      ),
      color: GlobalConfig.backgroundColor,
    );

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: searchBar,
        ),
        body: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }
}