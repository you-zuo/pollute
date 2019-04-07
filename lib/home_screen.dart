import 'package:flutter/material.dart';
import 'constants.dart';

enum ActionItems { GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : item = BottomNavigationBarItem(
          icon: Icon(icon),
          activeIcon: Icon(activeIcon),
          title: Text(title),
          backgroundColor: Colors.white,
        );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;
  int _currentIndex = 0;
  PageController _pageController;

  //初始化操作
  void initState() {
    super.initState();
    //底栏
    _navigationViews = [
      NavigationIconView(
        title: '首页',
        icon: IconData(
          0xe6d9,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe628,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
          title: '社区',
          icon: IconData(
            0xe67c,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe67b,
            fontFamily: Constants.IconFontFamily,
          )),
      NavigationIconView(
          title: '环保指数',
          icon: IconData(
            0xe618,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe611,
            fontFamily: Constants.IconFontFamily,
          )),
      NavigationIconView(
          title: '我的',
          icon: IconData(
            0xe80a,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe676,
            fontFamily: Constants.IconFontFamily,
          )),
    ];

    _pageController = PageController(initialPage: _currentIndex);

    _pages = [
//      conversationPage(),
//      ContactsPage(),
      Container(
        color: Colors.greenAccent,
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.greenAccent,
      ),
      Container(
        color: Colors.yellow,
      )
    ];
  }

  _buildPopupMunuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(
            IconData(
              iconName,
              fontFamily: Constants.IconFontFamily,
            ),
            size: 22.0,
            color: const Color(AppColors.AppBarPopupMenuColor)),
        Container(width: 12.0),
        Text(title,
            style:
                TextStyle(color: const Color(AppColors.AppBarPopupMenuColor))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      //当前用户选择的
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex,
              duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        });
      },
    );

    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
