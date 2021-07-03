import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<int> getTotalBag() async {
  final _firestore = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser;
  QuerySnapshot total = await _firestore
      .collection('bag')
      .where('uid', isEqualTo: _user!.uid)
      .where('scan', isEqualTo: false)
      .get();
  return total.size;
}
