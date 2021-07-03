import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libre/page/admin/admin_database/admin_database.dart';
import 'package:libre/page/admin/admin_homepage/admin_homepage.dart';
import 'package:libre/page/admin/admin_settings/admin_settings.dart';

final List<Widget> _widgetOptionsAtHomepage = [
  AdminHomepage(),
  AdminDatabase(),
  AdminSettings(),
];

class AdminNavBar extends StatefulWidget {
  static const id = '/admin_nav_bar';

  @override
  _AdminNavBarState createState() => _AdminNavBarState();
}

class _AdminNavBarState extends State<AdminNavBar> {
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
              icon: Icon(Icons.receipt),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.database), label: 'Database'),
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
