import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:libre/model/book.dart';

class BookHelper {
  final Book book;

  BookHelper({required this.book});

  final _firestore = FirebaseFirestore.instance;

  Future<bool> addBook() async {
    bool _isSuccess = true;

    try {
      await _firestore.collection('books').add({
        'author': this.book.author,
        'cost': this.book.cost,
        'description': this.book.description,
        'timestamps': Timestamp.now(),
        'title': this.book.title,
        'total_rent': 0,
        'url_image': this.book.urlImage,
      }).catchError((onError) {
        throw onError;
      });
    } catch (e) {
      _isSuccess = false;
    }

    return _isSuccess;
  }

  Future<bool> updateBook() async {
    bool _isSuccess = true;

    try {
      await _firestore.collection('books').doc(this.book.bookId).update({
        'author': this.book.author,
        'cost': this.book.cost,
        'description': this.book.description,
        'timestamp': Timestamp.now(),
        'title': this.book.title,
        'total_rent': 0,
        'url_image': this.book.urlImage,
      }).catchError((onError) {
        throw onError;
      });
    } catch (e) {
      _isSuccess = false;
    }

    return _isSuccess;
  }

  Future<bool> deleteBook() async {
    bool _isSuccess = true;

    try {
      await _firestore.collection('books').doc(this.book.bookId).delete();
    } catch (e) {
      _isSuccess = false;
    }
    return _isSuccess;
  }
}
