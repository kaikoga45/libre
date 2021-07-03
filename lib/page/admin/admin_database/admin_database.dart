import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libre/model/book.dart';
import 'package:libre/page/admin/admin_database/create_update_book.dart';
import 'package:libre/page/admin/admin_database/local_widget/stream_book.dart';

class AdminDatabase extends StatelessWidget {
  AdminDatabase({Key? key}) : super(key: key);

  final _firetore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _textTheme = _theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _theme.primaryColor,
        elevation: 0,
        title: Text(
          'Books',
          style: _textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBook(
        firetore: _firetore,
        theme: _theme,
        textTheme: _textTheme,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateUpdateBook.id, arguments: Book());
        },
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }
}
