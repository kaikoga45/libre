import 'package:cloud_firestore/cloud_firestore.dart';

class ShopBagHelper {
  String? uid;
  String? bookId;
  String? bookName;
  String? bookAuthor;
  int? bookCost;

  ShopBagHelper({
    this.uid,
    this.bookId,
    this.bookName,
    this.bookAuthor,
    this.bookCost,
  });

  final _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> checkExistingItemInBag() async {
    var _itemBag;

    _itemBag = _firestore
        .collection('bag')
        .where('uid', isEqualTo: this.uid)
        .where('book_id', isEqualTo: this.bookId)
        .where('scan', isEqualTo: false)
        .limit(1)
        .get();

    return _itemBag;
  }

  Future<bool> addItemInBag() async {
    bool _isSuccess = true;

    try {
      await _firestore.collection('bag').add({
        'uid': this.uid,
        'book_id': this.bookId,
        'book_name': this.bookName,
        'book_author': this.bookAuthor,
        'quantity': 1,
        'scan': false,
        'total_cost': this.bookCost,
        'timestamps': Timestamp.now(),
      }).catchError((onError) => throw onError);
    } catch (e) {
      _isSuccess = false;
    }

    return _isSuccess;
  }

  Future<bool> updateItemInBag(DocumentSnapshot snapshot, int cost) async {
    num newCost = cost + snapshot['total_cost'];
    num newQuantity = snapshot['quantity'] + 1;

    bool _isSuccess = true;

    try {
      await _firestore.collection('bag').doc(snapshot.id).update({
        'total_cost': newCost,
        'quantity': newQuantity,
      }).catchError((onError) => throw onError);
    } catch (e) {
      _isSuccess = false;
    }

    return _isSuccess;
  }

  Future<bool> deleteItemInBag(String docId) async {
    bool _isSuccess = true;

    try {
      await _firestore
          .collection('bag')
          .doc(docId)
          .delete()
          .catchError((onError) => throw onError);
    } catch (e) {
      _isSuccess = false;
    }

    return _isSuccess;
  }

  Future<QuerySnapshot> getMemberItemInBag(String? uid) async {
    var _snapshot;

    try {
      _snapshot = await _firestore
          .collection('bag')
          .where('uid', isEqualTo: uid)
          .where('scan', isEqualTo: false)
          .get()
          .catchError((onError) => throw onError);
    } catch (e) {
      _snapshot = null;
    }

    return _snapshot;
  }

  Future<bool> setItemHasBeenSoldInBag(QuerySnapshot? snapshot) async {
    bool _isSuccess = true;
    try {
      snapshot!.docs.forEach((element) async {
        await _firestore
            .collection('bag')
            .doc(element.id)
            .update({'scan': true}).catchError((onError) {
          throw onError;
        });
      });
      snapshot.docs.forEach((element) async {
        DocumentSnapshot _getTotalRent =
            await _firestore.collection('books').doc(element['book_id']).get();
        int _newTotalRent = _getTotalRent['total_rent'] + 1;
        await _firestore
            .collection('books')
            .doc(element['book_id'])
            .update({'total_rent': _newTotalRent}).catchError((onError) {
          throw onError;
        });
      });
    } catch (e) {
      print(e);
      _isSuccess = false;
    }

    return _isSuccess;
  }
}
