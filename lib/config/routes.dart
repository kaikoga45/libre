import 'package:flutter/material.dart';
import 'package:libre/page/auth/onboarding.dart';
import 'package:libre/page/auth/sign_in.dart';
import 'package:libre/page/auth/sign_up.dart';
import 'package:libre/page/member/member_homepage/member_homepage.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  MemberHomepage.id: (context) => MemberHomepage(),
  Onboarding.id: (context) => Onboarding(),
  SignUp.id: (context) => SignUp(),
  SignIn.id: (context) => SignIn(),
};
