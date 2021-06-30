import 'package:flutter/material.dart';
import 'package:libre/page/member/member_homepage/member_homepage.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  MemberHomepage.id: (context) => MemberHomepage(),
};
