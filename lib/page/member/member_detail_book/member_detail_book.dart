import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libre/domain/shop_bag_helper.dart';
import 'package:libre/model/book.dart';
import 'package:libre/util/count_bag.dart';

class MemberDetailBook extends StatefulWidget {
  static const id = '/member_detail_book';

  const MemberDetailBook({Key? key}) : super(key: key);

  @override
  _MemberDetailBookState createState() => _MemberDetailBookState();
}

class _MemberDetailBookState extends State<MemberDetailBook> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Book _book = ModalRoute.of(context)!.settings.arguments as Book;
    final _textTheme = Theme.of(context).textTheme;
    final _accentColor = Theme.of(context).accentColor;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: Color(0xFFFDF4E4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: FutureBuilder<int>(
                                future: getTotalBag(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Badge(
                                      badgeContent: Text(
                                          snapshot.data.toString(),
                                          style: _textTheme.overline!
                                              .copyWith(color: Colors.white)),
                                      child: Icon(
                                        FontAwesomeIcons.shoppingBag,
                                        color: _accentColor,
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: Container(
                                        height: 12,
                                        child: CircularProgressIndicator(
                                          color: _accentColor,
                                        ),
                                      ),
                                    );
                                  }
                                }),
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              height: 250,
                              width: 150,
                              fadeInCurve: Curves.bounceIn,
                              placeholder: 'assets/fade_placeholder.png',
                              image: _book.urlImage ?? '',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                          _book.title ?? '',
                          style: _textTheme.headline6!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: Text(
                          'By ${_book.author ?? ''}',
                          style: _textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Description',
                          style: _textTheme.subtitle1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text('Rp. ${_book.cost}', style: _textTheme.overline),
                      ],
                    ),
                    Text(
                      _book.description ?? '',
                      style: _textTheme.bodyText1,
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.infinity, 50),
                      ),
                      onPressed: () async {
                        bool _isSuccess = true;

                        setState(() {
                          _isLoading = !_isLoading;
                        });

                        final User? _user = FirebaseAuth.instance.currentUser;

                        final _shopBag = ShopBagHelper(
                          uid: _user!.uid,
                          bookId: _book.bookId ?? '',
                          bookAuthor: _book.author ?? '',
                          bookName: _book.title ?? '',
                          bookCost: _book.cost ?? 0,
                        );

                        final QuerySnapshot _isItemFoundInShopBag =
                            await _shopBag.checkExistingItemInBag();

                        if (_isItemFoundInShopBag.docs.isEmpty) {
                          _isSuccess = await _shopBag.addItemInBag();
                        } else {
                          _isSuccess = await _shopBag.updateItemInBag(
                              _isItemFoundInShopBag.docs[0], _book.cost ?? 0);
                        }

                        setState(() {
                          _isLoading = !_isLoading;
                        });

                        if (_isSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Successfully Add To Shopping Bag!'),
                            behavior: SnackBarBehavior.floating,
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Failed To Add Into Shopping Bag!'),
                              behavior: SnackBarBehavior.floating));
                        }
                      },
                      child: _isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              'ADD TO SHOP BAG',
                              style: _textTheme.button,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
