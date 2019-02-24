import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';

class ReplyPage extends StatefulWidget {
  @override
  _ReplyPageState createState() => _ReplyPageState();
}

class _ReplyPageState extends State<ReplyPage> {

  Widget buildBottomIcon(String title, IconData icon){
    return Container(
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: GlobalConfig.fontColor, size: 20,),
            Text(title,
              style: TextStyle(color: GlobalConfig.fontColor, fontSize: 10),)
          ],
        ),
        onPressed: () {},
      ),
      margin: EdgeInsets.only(left: 4,),
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget appBarTitle = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: GlobalConfig.fontColor,),
            onPressed: (){},
          ),
          PopupMenuButton(
            icon: Icon(Icons.format_list_bulleted, color: GlobalConfig.fontColor,),
            itemBuilder: (context){
              return buildPopupMenu();
            },
          ),
        ],
      )
    );

    Widget body = SingleChildScrollView(
      child: Container(
        color: GlobalConfig.backgroundColor,
        child: Column(
          children: <Widget>[
            Container( //title
              child: Text(
                "你认为《三体》中最牛的文明是？",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10,),
              alignment: Alignment.centerLeft,
              color: GlobalConfig.itemBackgroundColor,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: FlatButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.edit, color: Colors.blue, size: 16,),
                      label: Text("写回答", style: TextStyle(color: Colors.blue,),),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 8),
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: (){},
                      child: Row(
                        children: <Widget>[
                          Text("查看全部1,030个回答", style: TextStyle(color: GlobalConfig.fontColor),),
                          Icon(Icons.arrow_forward_ios, color: GlobalConfig.fontColor, size: 16,)
                        ],
                      ),
                    ),
                    alignment: Alignment.centerRight,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              color: GlobalConfig.itemBackgroundColor,
            ),
            Container(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://pic3.zhimg.com/v2-cd467bb9bb31d0384f065cf0bd677930_xl.jpg"),
                  radius: 20,
                ),
                title: Text("Flutter", style: TextStyle(fontSize: 16, color: Colors.white70),),
                subtitle: Text(
                  "人生如戏，全靠演技，演的不好，孤独终老。",
                  style: TextStyle(fontSize: 14, color: Colors.white30, ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                trailing: Container(
                  child: FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(Icons.add, color: Colors.blue,),
                    label: Text("关注", style: TextStyle(color: Colors.blue,),),
                    color: GlobalConfig.searchBackgroundColor,
                  ),
                  margin: EdgeInsets.only(left: 16),
                ),
              ),
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(top: 6, bottom: 6),
              color: GlobalConfig.itemBackgroundColor,
            ),
            Container(
              child: Text("learner 赞同了该回答", style: TextStyle(color: Colors.white30,),),
              padding: EdgeInsets.only(left: 16, top: 6, right: 16, bottom: 6),
              color: GlobalConfig.itemBackgroundColor,
              alignment: Alignment.centerLeft,
            ),
            Container(
              child: Text(
                content,
                style: new TextStyle(
                  height: 1.4,
                  fontSize: 16.0,
                  color: GlobalConfig.fontColor,
                ),
                textAlign: TextAlign.start,
              ),
              padding: EdgeInsets.only(left: 16, top: 6, right: 16, bottom: 6),
              color: GlobalConfig.itemBackgroundColor,
            )
          ],
        ),
      ),
    );

    Widget bottomBar = BottomAppBar(
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white10)),
          color: GlobalConfig.itemBackgroundColor,
        ),
        padding: EdgeInsets.only(left: 16, right: 16,),
        height: 64,
        child: Row(
          children: <Widget>[
            Container(
              height: 30,
              child: FlatButton.icon(onPressed: () {},
                icon: Icon(Icons.arrow_drop_up, color: Colors.blue,),
                label: Text("已赞同16K", style: TextStyle(color: Colors.blue,),),
                color: GlobalConfig.searchBackgroundColor,
              ),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.arrow_drop_down, color: GlobalConfig.fontColor,),
                onPressed: () {},
                padding: const EdgeInsets.all(0.0),
              ),
              height: 30,
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: GlobalConfig.searchBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buildBottomIcon("感谢 2K", Icons.favorite),
                    buildBottomIcon("收藏", Icons.star),
                    buildBottomIcon("评论 1.6K", Icons.mode_comment),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: GlobalConfig.fontColor,),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          title: appBarTitle,
          elevation: 0,
        ),
        body: body,
        bottomNavigationBar: bottomBar,
      ),
    );
  }

  List<PopupMenuItem> buildPopupMenu() {
    return [
      PopupMenuItem(
        child: Text("邀请回答"),
      ),
      PopupMenuItem(
        child: Text("举报回答"),
      ),
      PopupMenuItem(
        child: Text("字体大小"),
      ),
      PopupMenuItem(
        child: Text("复制链接"),
      ),
      PopupMenuItem(
        child: Text("分享"),
      ),
    ];
  }
}

const content = """谢邀！

以下是个人意见，不包括人类文明以及把海弄干的鱼、归零者、魔戒、波江座卡通女孩、星云文明这种没有对文明本身的细节描述而几乎只有一个概念的文明：

第一层级：完全纯能化的文明，没有物质实体，完全摆脱生存压力，在宇宙中来去自如，近似于神一般的存在，包括李白、镜子音乐家、冰冻艺术家和排险者

第二层级：可以实现维度操作的文明，但还没有完全摆脱生存压力，又可以细分两个层级，髙层级的可以实施维度黑暗森林打击，比如歌者文明，低层级的还不行，但能逃离大宇宙，比如三体文明

第三层级：可以实现超光速飞行，利用正反物质湮灭获取能量的文明，但有时不得不为生存发动战争，包括碳基联邦、硅基帝国、上帝文明、泡文明

第四层级：没有实现超光速飞行，但能进行星际移民的文明，比如大环文明（吞食帝国）、第一地球（哥哥）

人类文明中最强的应该是《信使》中的，可以时间旅行，并可以将纯能转化为物质，已经接近神了

谢谢 望采纳""";
