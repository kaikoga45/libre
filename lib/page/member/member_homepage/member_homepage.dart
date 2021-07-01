import 'package:flutter/material.dart';
import 'package:libre/domain/auth_helper.dart';

class MemberHomepage extends StatefulWidget {
  static const String id = '/member_homepage';

  const MemberHomepage({Key? key}) : super(key: key);

  @override
  _MemberHomepageState createState() => _MemberHomepageState();
}

class _MemberHomepageState extends State<MemberHomepage> {
  final _auth = AuthHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  _auth.signOut();
                },
                child: Text('LOGOUT'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
