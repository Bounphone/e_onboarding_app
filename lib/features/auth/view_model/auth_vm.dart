import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:e_onboarding_app/features/home/buddy/screen/buddy_screen.dart';
import 'package:e_onboarding_app/features/home/screens/home_screen.dart';
import 'package:e_onboarding_app/widgets/dialog/dialog_error.dart';
import 'package:e_onboarding_app/widgets/dialog/dialog_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthVM extends ChangeNotifier {
  CollectionReference userProfileCollection = FirebaseCollection.userProfile;
  final FirebaseAuth auth = FirebaseAuth.instance;

  /// On sign up
  Future<void> onSignUp(String email, String password, String firstName,
      String lastName, String birthDay, BuildContext context) async {
    try {
      await signUp(email, password);
      await addUser(firstName, lastName, birthDay, email);
    } on FirebaseAuthException catch (e) {
      /// if cannot upload data
      String message = '';
      if (e.code == 'email-already-in-use') {
        message = "You're email has registered.\nPlease enter another email";
      } else {
        message = e.message!;
      }
      showDialog(
          context: context,
          builder: (_) {
            return DialogError(message: message);
          });
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
        'orgs': []
      });
    } catch (e) {
      rethrow;
    }
  }

  /// Sign in
  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: (_) {
            return const DialogLoading();
          });
     await auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
        return BuddyScreen();
      }), (route) => false);
    } catch (e) {
      Navigator.pop(context);
      rethrow;
    }
  }
}
