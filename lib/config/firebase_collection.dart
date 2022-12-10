import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollection{
  static  CollectionReference userProfile = FirebaseFirestore.instance.collection('UserProfile');
}