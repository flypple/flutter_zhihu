import 'package:flutter/material.dart';
import 'follow.dart';
import 'recommend.dart';
import 'hot.dart';

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
            title: Text("首页"),
            bottom: TabBar(
              labelColor: Color(0xFF63FDD9),
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: "关注",),
                Tab(text: "推荐",),
                Tab(text: "热榜",),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Follow(),
              Recommend(),
              Hot(),
            ],
          ),
        ),
      ),
    );
  }
}
