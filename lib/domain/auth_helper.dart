import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  final String? email;
  final String? pass;

  AuthHelper({this.email, this.pass});

  final _authFire = FirebaseAuth.instance;
  static final AuthHelper instance = AuthHelper();

  Future<Map<String, dynamic>> signUp() async {
    try {
      UserCredential data = await _authFire.createUserWithEmailAndPassword(
        email: this.email ?? '',
        password: this.pass ?? '',
      );

      User? user = data.user;

      FirebaseFirestore.instance.collection('users').add({
        "source_UID": user!.uid,
        "email": this.email,
        "type": '0',
      });

      return {
        "valid": true,
        "message": "Sign Up Success",
      };
    } on FirebaseAuthException catch (error) {
      return {
        "valid": false,
        "message": error.code,
      };
    }
  }

  Future<Map<String, dynamic>> signIn() async {
    try {
      await _authFire.signInWithEmailAndPassword(
        email: this.email ?? '',
        password: this.pass ?? '',
      );

      return {
        "valid": true,
        "message": "Sign In Success",
      };
    } on FirebaseAuthException catch (error) {
      return {
        "valid": false,
        "message": error.code,
      };
    }
  }

  Future<String> signOut() async {
    try {
      _authFire.signOut();
      return "Sign Out Success";
    } on FirebaseAuthException catch (error) {
      return error.code;
    } catch (e) {
      rethrow;
    }
  }
}
