import 'package:flutter/material.dart';
import 'navigation_item_view.dart';
import 'package:flutter_zhihu/pages/home/home_page.dart';
import 'package:flutter_zhihu/pages/idea/idea_page.dart';
import 'package:flutter_zhihu/pages/university/university_page.dart';
import 'package:flutter_zhihu/pages/notice/notice_page.dart';
import 'package:flutter_zhihu/pages/my/my_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin {

  int _currentIndex = 0;
  StatefulWidget _currentPage;
  List<NavigationItemView> _navitionItems;
  List<StatefulWidget> _pages;

  @override
  void initState() {
    super.initState();
    initNavigation();
  }

  void initNavigation() {
    _navitionItems = [
      NavigationItemView(
        icon: Icon(Icons.assignment),
        title: Text("首页"),
        vsync: this,
      ),
      NavigationItemView(
        icon: Icon(Icons.all_inclusive),
        title: Text("想法"),
        vsync: this,
      )
      ,NavigationItemView(
        icon: Icon(Icons.school),
        title: Text("大学"),
        vsync: this,
      )
      ,NavigationItemView(
        icon: Icon(Icons.add_alert),
        title: Text("通知"),
        vsync: this,
      ),
      NavigationItemView(
        icon: Icon(Icons.perm_identity),
        title: Text("我的"),
        vsync: this,
      ),
    ];

    _navitionItems.forEach((item){
      item.animController.addListener((){
        _rebuil();
      });
    });

    _pages = [
      HomePage(),
      IdeaPage(),
      UniversityPage(),
      NoticePage(),
      MyPage(),
    ];

    _currentPage = _pages[_currentIndex];
  }

  void _rebuil(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920,)..init(context);

    var bottomNavigationBar = BottomNavigationBar(
      items: _navitionItems.map((navigationItem)=>navigationItem.item).toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        setState(() {
          _currentIndex = index;
          _currentPage = _pages[_currentIndex];
        });
      },
    );

    return Container(
      child: Scaffold(
        body: Container(
          child: _currentPage,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

