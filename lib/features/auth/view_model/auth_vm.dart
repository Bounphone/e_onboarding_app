import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:e_onboarding_app/features/home/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthVM extends ChangeNotifier {
  CollectionReference userProfileCollection = FirebaseCollection.userProfile;
  final FirebaseAuth auth = FirebaseAuth.instance;

  /// On sign up
  Future<void> onSignUp(String email, String password, String firstName,
      String lastName, String birthDay) async {
    try {
      await Future.wait([
        signUp(email, password),
        addUser(firstName, lastName, birthDay, email)
      ]);
    } catch (e) {
      rethrow;
    }
  }

  /// Sign up new user
  Future<void> signUp(String email, String password) async {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
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
        'email': email,
        'orgs' : []
      });
    } catch (e) {
      rethrow;
    }
  }

  /// Sign in
  Future<void> signIn(String email, String password, BuildContext context) async {
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (_){
        return HomeScreens();
      }));
    } catch (e) {
      rethrow;
    }
  }
}
