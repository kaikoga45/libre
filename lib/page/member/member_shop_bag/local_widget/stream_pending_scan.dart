import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libre/domain/shop_bag_helper.dart';

class StreamPendingScan extends StatelessWidget {
  const StreamPendingScan({
    Key? key,
    required FirebaseFirestore firestore,
    required User? user,
    required TextTheme textTheme,
  })  : _firestore = firestore,
        _user = user,
        _textTheme = textTheme,
        super(key: key);

  final FirebaseFirestore _firestore;
  final User? _user;
  final TextTheme _textTheme;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('bag')
          .where('scan', isEqualTo: false)
          .where('uid', isEqualTo: _user!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final _doc = snapshot.data!.docs[index];
              return ListTile(
                leading: Text(
                  '${index + 1}',
                  style: _textTheme.headline6,
                ),
                title: Text(
                  _doc['book_name'],
                  style: _textTheme.headline6,
                ),
                subtitle: Text(
                  "Total price equal to Rp. ${_doc['total_cost']}, with quantity of ${_doc['quantity']}.",
                ),
                trailing: IconButton(
                  onPressed: () async {
                    bool _isSuccess = true;
                    final _shopBagHelper = ShopBagHelper();
                    _isSuccess = await _shopBagHelper.deleteItemInBag(_doc.id);

                    if (_isSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Deleted Succesfully Completed!'),
                        behavior: SnackBarBehavior.floating,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Deleted Failed!'),
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                  icon: Icon(FontAwesomeIcons.trash),
                ),
              );
            },
          );
        }
      },
    );
  }
}
