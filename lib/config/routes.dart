import 'package:flutter/material.dart';
import 'package:libre/main.dart';
import 'package:libre/page/admin/admin_database/create_update_book.dart';
import 'package:libre/page/admin/admin_navbar/admin_nav_bar.dart';
import 'package:libre/page/auth/onboarding.dart';
import 'package:libre/page/auth/sign_in.dart';
import 'package:libre/page/auth/sign_up.dart';
import 'package:libre/page/member/display_all_book/display_all_book.dart';
import 'package:libre/page/member/member_detail_book/member_detail_book.dart';
import 'package:libre/page/member/member_homepage/member_homepage.dart';
import 'package:libre/page/member/member_nav_bar/member_nav_bar.dart';
import 'package:libre/page/member/member_shop_bag/local_widget/display_qr_code.dart';
import 'package:libre/page/member/member_shop_bag/member_shop_bag.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  MemberHomepage.id: (context) => MemberHomepage(),
  ValidationUser.id: (context) => ValidationUser(),
  Onboarding.id: (context) => Onboarding(),
  SignUp.id: (context) => SignUp(),
  SignIn.id: (context) => SignIn(),
  MemberNavBar.id: (context) => MemberNavBar(),
  AdminNavBar.id: (context) => AdminNavBar(),
  CreateUpdateBook.id: (context) => CreateUpdateBook(),
  MemberDetailBook.id: (context) => MemberDetailBook(),
  MemberShopBag.id: (context) => MemberShopBag(),
  DisplayQrCode.id: (context) => DisplayQrCode(),
  DisplayAllBook.id: (context) => DisplayAllBook(),
};
