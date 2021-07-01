import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:libre/config/app_theme.dart';
import 'package:libre/config/routes.dart';
import 'package:libre/page/auth/onboarding.dart';
import 'package:libre/page/member/member_homepage/member_homepage.dart';
import 'package:libre/page/member/member_nav_bar/member_nav_bar.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(InitFirebase());
}

class InitFirebase extends StatelessWidget {
  const InitFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Container(
                color: Colors.red,
              ),
            );
          } else {
            return Libre();
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class ValidationUser extends StatelessWidget {
  static const id = '/validation_user';

  const ValidationUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MemberHomepage();
        } else {
          return Onboarding();
        }
      },
    );
  }
}

class Libre extends StatelessWidget {
  const Libre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: appTheme,
      routes: routes,
      initialRoute: MemberNavBar.id,
    );
  }
}
