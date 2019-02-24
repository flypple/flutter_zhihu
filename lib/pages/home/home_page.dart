import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';
import 'follow.dart';
import 'recommend.dart';
import 'hot.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // 使用 DefaultTabController，就不用再TabBar和TabBarView中添加controller属性了
      // 当然，也可以 with混入 TickerProviderStateMixin 类来创建TabController
      length: 3,
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: SearchBar(),
            bottom: TabBar(
              labelColor: Color(0xFF63FDD9),
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: "关注",),
                Tab(text: "推荐",),
                Tab(text: "热榜",),
              ],
            ),
            elevation: 0,
          ),
          body: Container(
            child: TabBarView(
              children: [
                Follow(),
                Recommend(),
                Hot(),
              ],
            ),
            color: GlobalConfig.backgroundColor,
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: GlobalConfig.searchBackgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Expanded(
              child: FlatButton.icon(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>SearchPage(),
                  ));
                },
                icon: Icon(Icons.search, color: GlobalConfig.fontColor, size: 16,),
                label: Container(
                  child: Text("字节锤子", style: TextStyle(color: GlobalConfig.fontColor),),
                ),
              ),
            ),
          ),
          Container(
            width: 1,
            height: 14,
            color: GlobalConfig.fontColor,
          ),
          Container(
            child: FlatButton.icon(
              onPressed: (){},
              icon: Icon(Icons.border_color, color: GlobalConfig.fontColor, size: 14,),
              label: Container(
                child: Text("提问", style: TextStyle(color: GlobalConfig.fontColor),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
