import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libre/page/member/member_homepage/member_homepage.dart';
import 'package:libre/page/member/member_settings/member_setting.dart';
import 'package:libre/page/member/member_shop_bag/member_shop_bag.dart';

final List<Widget> _widgetOptionsAtHomepage = [
  MemberHomepage(),
  MemberShopBag(),
  MemberSettings(),
];

class MemberNavBar extends StatefulWidget {
  static const id = '/member_nav_bar';

  @override
  _MemberNavBarState createState() => _MemberNavBarState();
}

class _MemberNavBarState extends State<MemberNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      body: _widgetOptionsAtHomepage.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          backgroundColor: _theme.accentColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: _theme.primaryColor,
          unselectedItemColor: Color(0xFFB8B7B4),
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.shoppingBag),
                label: 'Shopping Bag'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          onTap: (values) {
            setState(() {
              _selectedIndex = values;
            });
          },
        ),
      ),
    );
  }
}
