import 'package:first_flutter/pages/home_page.dart';
import 'package:first_flutter/pages/my_page.dart';
import 'package:first_flutter/pages/search_page.dart';
import 'package:first_flutter/pages/trip_page.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();

}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  PageController _controller = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TripPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.home,
              color: _activeColor,
            ),
            title: Text('首页', style: TextStyle(color: _currentIndex == 0 ? _activeColor : _defaultColor),)
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.search,
              color: _activeColor,
            ),
            title: Text('搜索', style: TextStyle(color: _currentIndex == 1 ? _activeColor : _defaultColor),)
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.camera_alt,
              color: _activeColor,
            ),
            title: Text('旅拍', style: TextStyle(color: _currentIndex == 2 ? _activeColor : _defaultColor),)
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.account_circle,
              color: _activeColor,
            ),
            title: Text('我的', style: TextStyle(color: _currentIndex == 3 ? _activeColor : _defaultColor),)
          )
      ]),
    );
  }

}