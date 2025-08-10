import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/util/exceptions.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
    required String bio,
    required String confirmpass,
  }) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        if (password == confirmpass) {
          UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
          _firestore.collection('users').doc(cred.user!.uid).set({
            'username': username,
            'uid': cred.user!.uid,
            'email': email,
            'bio': bio,
            'following': [],
            'followers': [],
          });
        } else {
          throw Exceptions('Password and confirmed password must match');
        }
      } else {
        throw Exceptions('Enter all fields');
      }
    } on FirebaseException catch (e) {
      throw Exceptions(e.message ?? 'Firebase error');
    }
  }

  Future<void> Login({required String email, required String password}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else if (email.isEmpty) {
        throw Exceptions('Enter your email');
      } else if (password.isEmpty) {
        throw Exceptions('Enter your password');
      }
    } on FirebaseException catch (e) {
      throw Exceptions(e.message ?? 'Firebase error');
    }
  }
}
