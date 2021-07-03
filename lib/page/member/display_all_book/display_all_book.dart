import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:libre/model/book.dart';
import 'package:libre/page/member/member_detail_book/member_detail_book.dart';

class DisplayAllBook extends StatelessWidget {
  const DisplayAllBook({Key? key}) : super(key: key);

  static final String id = '/display_all_book';

  @override
  Widget build(BuildContext context) {
    final _firetore = FirebaseFirestore.instance;
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Collection Of Our Book Of Choice!',
              style: _textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: _firetore
                  .collection('books')
                  .orderBy('timestamps', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Container(
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 9 / 16),
                        itemBuilder: (context, index) {
                          final DocumentSnapshot _doc =
                              snapshot.data!.docs[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                MemberDetailBook.id,
                                arguments: Book(
                                  bookId: _doc.id,
                                  title: _doc['title'],
                                  author: _doc['author'],
                                  description: _doc['description'],
                                  cost: _doc['cost'],
                                  urlImage: _doc['url_image'],
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 250,
                                  width: 150,
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      height: 250,
                                      width: 150,
                                      fadeInCurve: Curves.bounceIn,
                                      placeholder:
                                          'assets/fade_placeholder.png',
                                      image: _doc['url_image'],
                                    ),
                                  ),
                                ),
                                Text(
                                  _doc['title'],
                                  style: _textTheme.subtitle2,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
