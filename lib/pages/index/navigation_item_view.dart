import 'package:flutter/material.dart';

class NavigationItemView {
  final BottomNavigationBarItem item;
  final AnimationController animController;

  NavigationItemView({Widget icon, Widget title, TickerProvider vsync})
      : item = BottomNavigationBarItem(
          icon: icon,
          title: title,
        ),
        animController = AnimationController(
          vsync: vsync,
          duration: kThemeAnimationDuration,
        );
}
