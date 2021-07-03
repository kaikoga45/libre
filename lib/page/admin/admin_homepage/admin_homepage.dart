import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libre/domain/shop_bag_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class AdminHomepage extends StatefulWidget {
  const AdminHomepage({Key? key}) : super(key: key);

  @override
  _AdminHomepageState createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  String? _uid;
  bool _isScan = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _shopBagHelper = ShopBagHelper();
    return Scaffold(
      body: _isScan
          ? FutureBuilder<QuerySnapshot>(
              future: _shopBagHelper.getMemberItemInBag(_uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          final _doc = snapshot.data?.docs[index];
                          return ListTile(
                            leading: Text(
                              '${index + 1}',
                              style: _textTheme.headline6,
                            ),
                            title: Text(
                              _doc?['book_name'],
                              style: _textTheme.headline6,
                            ),
                            subtitle: Text(
                              "Total price equal to Rp. ${_doc?['total_cost']}, with quantity of ${_doc?['quantity']}.",
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 25),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                _isLoading = !_isLoading;
                              });

                              bool _isSuccess = true;

                              final _shopBagHelper = ShopBagHelper();

                              _isSuccess = await _shopBagHelper
                                  .setItemHasBeenSoldInBag(snapshot.data);

                              setState(() {
                                _isLoading = !_isLoading;
                                _isScan = !_isScan;
                              });

                              if (_isSuccess) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Proccess Completed!'),
                                  behavior: SnackBarBehavior.floating,
                                ));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Proccess Failed!'),
                                  behavior: SnackBarBehavior.floating,
                                ));
                              }
                            },
                            child: Text(
                              'COMPLETED',
                              style: _textTheme.button,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0B0D14),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () async {
                            await [
                              Permission.camera,
                              Permission.storage,
                            ].request();
                            String? _result = await scanner.scan();
                            setState(() {
                              _uid = _result;
                              _isScan = !_isScan;
                            });
                          },
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'LIBRE ID CARD \nSCANNER',
                        style: _textTheme.headline6!.copyWith(
                          color: Color(0xFF0B0D14),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Pressed the icon button to start scanning!',
                        style: _textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
