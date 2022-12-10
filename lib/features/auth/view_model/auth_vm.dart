import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthVM extends ChangeNotifier {
  CollectionReference userProfileCollection = FirebaseCollection.userProfile;
  /// Sign up new user
  Future<void> signUp(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  /// Add user to userProfile collection
  Future<void> addUser(
      String firstName, String lastName, String birthDay, String email) async {
    try {
      await userProfileCollection.add({
        'firstName': firstName,
        'lastName': lastName,
        'birthDay': birthDay,
        'email': email
      });
    } catch (e) {
      rethrow;
    }
  }
}
