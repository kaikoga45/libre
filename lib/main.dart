import 'package:flutter/material.dart';
import 'package:libre/config/app_theme.dart';
import 'package:libre/config/routes.dart';
import 'package:libre/page/member/member_homepage/member_homepage.dart';

void main() {
  runApp(Libre());
}

class Libre extends StatelessWidget {
  const Libre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      routes: routes,
      initialRoute: MemberHomepage.id,
    );
  }
}
