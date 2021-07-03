import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libre/domain/book_helper.dart';
import 'package:libre/model/book.dart';
import 'package:libre/page/admin/admin_database/create_update_book.dart';

class StreamBook extends StatelessWidget {
  const StreamBook({
    Key? key,
    required FirebaseFirestore firetore,
    required ThemeData theme,
    required TextTheme textTheme,
  })  : _firetore = firetore,
        _theme = theme,
        _textTheme = textTheme,
        super(key: key);

  final FirebaseFirestore _firetore;
  final ThemeData _theme;
  final TextTheme _textTheme;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _firetore.collection('books').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: _theme.accentColor,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot? _doc = snapshot.data?.docs[index];
              return ListTile(
                leading: Text(
                  '${index + 1}',
                  style: _textTheme.headline6,
                ),
                title: Text(
                  "${_doc?['title']}",
                  style: _textTheme.headline6,
                ),
                subtitle: Text(
                  "By ${_doc?['author']} - ${_doc?['description']}",
                  style: _textTheme.bodyText2,
                  maxLines: 2,
                  softWrap: true,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          CreateUpdateBook.id,
                          arguments: Book(
                            bookId: _doc!.id,
                            title: _doc['title'],
                            author: _doc['author'],
                            description: _doc['description'],
                            cost: _doc['cost'],
                            urlImage: _doc['url_image'],
                          ),
                        );
                      },
                      icon: Icon(
                        FontAwesomeIcons.edit,
                        color: Color(0xFFB8B7B4),
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final _firestore =
                            BookHelper(book: Book(bookId: _doc!.id));

                        bool _isSuccess = await _firestore.deleteBook();

                        if (_isSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Book Succesfully Deleted!'),
                            behavior: SnackBarBehavior.floating,
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Book Failed To Delete!'),
                            behavior: SnackBarBehavior.floating,
                          ));
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.trash,
                        color: Color(0xFFB8B7B4),
                        size: 25,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
