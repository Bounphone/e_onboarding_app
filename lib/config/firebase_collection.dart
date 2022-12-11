import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollection {
  static CollectionReference userProfile =
      FirebaseFirestore.instance.collection('UserProfile');
  static CollectionReference myBuddy =
      FirebaseFirestore.instance.collection('MyBuddy');
  static CollectionReference myTask =
  FirebaseFirestore.instance.collection('MyTask');
  static CollectionReference organizations =
  FirebaseFirestore.instance.collection('Organizations');
  static CollectionReference feedback =
  FirebaseFirestore.instance.collection('Feedback');
}
