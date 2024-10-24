import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_repo.dart';
class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ///---------------------------------------------------------------
  @override
  Future<String> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        throw 'The email is not found';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        throw 'Wrong password';
      } else {
        print('Login failed: $e');
        throw 'Login failed: ${e.message}';
      }
    }
  }

  ///---------------------------------------------------------------
  @override
  Future<String> userRegister({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Save user details to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid)
          .set({
        'username': username,
        'email': email,
      });
      return userCredential.user!.uid;
      print(userCredential.user!.uid);
    }
    catch (e) {
      // Show an error message if registration fails
      print('Error registering user: $e');
      // You can show a snackbar or dialog to the user here
      return e.toString();
    }
  }


///---------------------------------------------------------
}