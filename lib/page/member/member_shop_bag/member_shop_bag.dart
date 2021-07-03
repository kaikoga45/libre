import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libre/page/member/member_shop_bag/local_widget/display_qr_code.dart';
import 'package:libre/page/member/member_shop_bag/local_widget/stream_completed_scan.dart';
import 'package:libre/page/member/member_shop_bag/local_widget/stream_pending_scan.dart';

class MemberShopBag extends StatelessWidget {
  static const String id = '/member_shop_bag';

  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _accentColor = Theme.of(context).accentColor;

    final _firestore = FirebaseFirestore.instance;
    final _user = FirebaseAuth.instance.currentUser;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          bottom: TabBar(
            indicatorColor: _accentColor,
            indicatorWeight: 1.0,
            tabs: [
              Tab(
                child: Text(
                  'Pending',
                  style: _textTheme.button!.copyWith(
                    color: Color(0xFF4f4f4f),
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Completed',
                  style: _textTheme.button!.copyWith(
                    color: Color(0xFF4f4f4f),
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            'Shopping Bag',
            style: _textTheme.headline5,
          ),
        ),
        body: TabBarView(
          children: [
            Stack(
              children: [
                StreamPendingScan(
                  firestore: _firestore,
                  user: _user,
                  textTheme: _textTheme,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 25),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          DisplayQrCode.id,
                          arguments: _user!.uid,
                        );
                      },
                      child: Icon(
                        FontAwesomeIcons.qrcode,
                      ),
                    ),
                  ),
                )
              ],
            ),
            StreamCompletedScan(
                firestore: _firestore, user: _user, textTheme: _textTheme),
          ],
        ),
      ),
    );
  }
}
