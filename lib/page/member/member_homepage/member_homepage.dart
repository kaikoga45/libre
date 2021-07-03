import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:libre/model/book.dart';
import 'package:libre/page/member/display_all_book/display_all_book.dart';
import 'package:libre/page/member/member_detail_book/member_detail_book.dart';
import 'package:libre/util/time.dart';

class MemberHomepage extends StatefulWidget {
  static const String id = '/member_homepage';

  const MemberHomepage({Key? key}) : super(key: key);

  @override
  _MemberHomepageState createState() => _MemberHomepageState();
}

class _MemberHomepageState extends State<MemberHomepage> {
  final _firetore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 0,
                child: Text(
                  Time.getGreetingMessages(),
                  style: _textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  'Let\'s discover!',
                  style: _textTheme.headline4,
                ),
              ),
              Expanded(
                flex: 3,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: DefaultTabController(
                    initialIndex: 1,
                    length: 2,
                    child: Container(
                      width: 250,
                      child: Column(
                        children: [
                          RotatedBox(
                            quarterTurns: 0,
                            child: TabBar(
                              indicatorColor: Theme.of(context).accentColor,
                              indicatorWeight: 1.0,
                              tabs: [
                                Tab(
                                  child: Text(
                                    'Popular',
                                    style: _textTheme.button!.copyWith(
                                      color: Color(0xFF4f4f4f),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Newest',
                                    style: _textTheme.button!.copyWith(
                                      color: Color(0xFF4f4f4f),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: TabBarView(children: [
                              StreamBuilder<
                                  QuerySnapshot<Map<String, dynamic>>>(
                                stream: _firetore
                                    .collection('books')
                                    .orderBy('total_rent', descending: true)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return Container(
                                      height: 150,
                                      width: 250,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data?.docs.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          final DocumentSnapshot? _doc =
                                              snapshot.data?.docs[index];
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                MemberDetailBook.id,
                                                arguments: Book(
                                                  bookId: _doc!.id,
                                                  title: _doc['title'],
                                                  author: _doc['author'],
                                                  description:
                                                      _doc['description'],
                                                  cost: _doc['cost'],
                                                  urlImage: _doc['url_image'],
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 150,
                                              width: 250,
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: RotatedBox(
                                                quarterTurns: 1,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child:
                                                      FadeInImage.assetNetwork(
                                                    fit: BoxFit.cover,
                                                    height: 150,
                                                    width: 250,
                                                    fadeInCurve:
                                                        Curves.bounceIn,
                                                    placeholder:
                                                        'assets/fade_placeholder.png',
                                                    image: _doc!['url_image'],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                              StreamBuilder<
                                  QuerySnapshot<Map<String, dynamic>>>(
                                stream: _firetore
                                    .collection('books')
                                    .orderBy('timestamps', descending: true)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return Container(
                                      height: 150,
                                      width: 250,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data?.docs.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          final DocumentSnapshot? _doc =
                                              snapshot.data?.docs[index];
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                MemberDetailBook.id,
                                                arguments: Book(
                                                  bookId: _doc!.id,
                                                  title: _doc['title'],
                                                  author: _doc['author'],
                                                  description:
                                                      _doc['description'],
                                                  cost: _doc['cost'],
                                                  urlImage: _doc['url_image'],
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 150,
                                              width: 250,
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: RotatedBox(
                                                quarterTurns: 1,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child:
                                                      FadeInImage.assetNetwork(
                                                    fit: BoxFit.cover,
                                                    height: 150,
                                                    width: 250,
                                                    fadeInCurve:
                                                        Curves.bounceIn,
                                                    placeholder:
                                                        'assets/fade_placeholder.png',
                                                    image: _doc!['url_image'],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Discover All Our Book',
                            style: _textTheme.subtitle1,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, DisplayAllBook.id);
                            },
                            child: Row(
                              children: [
                                Text(
                                  'View All',
                                  style: _textTheme.overline,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                  color: Color(0xFF4f4f4f),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: _firetore
                            .collection('books')
                            .orderBy('timestamps')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data?.docs.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final DocumentSnapshot? _doc =
                                      snapshot.data?.docs[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        MemberDetailBook.id,
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
                                    child: Container(
                                      margin: EdgeInsets.only(right: 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: FadeInImage.assetNetwork(
                                          fit: BoxFit.cover,
                                          height: 150,
                                          width: 100,
                                          fadeInCurve: Curves.bounceIn,
                                          placeholder:
                                              'assets/fade_placeholder.png',
                                          image: _doc!['url_image'],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      /*
        INFORMATION!
        The FAB is for experiment only!
       */
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
