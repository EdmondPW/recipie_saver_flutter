import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthLogic {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInUser(
      TextEditingController email, TextEditingController password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  Future<void> signUpNewUser(
      TextEditingController email, TextEditingController password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
  }

  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
