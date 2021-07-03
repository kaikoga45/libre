import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:libre/config/app_theme.dart';
import 'package:libre/config/routes.dart';
import 'package:libre/page/admin/admin_navbar/admin_nav_bar.dart';
import 'package:libre/page/auth/onboarding.dart';
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
          final _auth = FirebaseAuth.instance;
          final user = _auth.currentUser;

          return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .where('source_UID', isEqualTo: user!.uid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final DocumentSnapshot? _doc = snapshot.data!.docs[0];
                  if (_doc!['type'] == '0') {
                    return MemberNavBar();
                  } else {
                    return AdminNavBar();
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              });
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
      initialRoute: ValidationUser.id,
    );
  }
}
