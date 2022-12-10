import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:e_onboarding_app/features/auth/screen/login_screen.dart';
import 'package:e_onboarding_app/features/home/my_goals/models/my_task_model.dart';
import 'package:e_onboarding_app/utils/auth_pref.dart';
import 'package:e_onboarding_app/widgets/dialog/dialog_error.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyGoalsVM extends ChangeNotifier {
  /// on Add Task
  Future<void> addNewTask(
      String title, String detail, BuildContext context) async {
    try {
      /// Validate title and detail
      if (title.isNotEmpty && detail.isNotEmpty) {
        /// Get user data from Local DB
        String? email = await AuthPref().getEmail();
        String? firstName = await AuthPref().getFirstName();
        String? lastName = await AuthPref().getLastName();

        /// if one of them no data, must login again
        if (email == null && firstName == null && lastName == null) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
            return LoginScreen();
          }), (route) => false);
        } else {
          CollectionReference myTask = FirebaseCollection.myTask;
          DateTime now = DateTime.now();
          String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
          MyTaskModel myTaskData = MyTaskModel(
              data: Data(
                  assigneeEmail: email,
                  assigneeFirstname: firstName,
                  assigneeLastname: lastName,
                  assignorEmail: email,
                  assignorFirstname: firstName,
                  assignorLastname: lastName,
                  taskCreatedTime: formattedDate,
                  taskDetail: detail,
                  taskStatus: 'UnCompleted',
                  taskTitle: title));
          Map<String, dynamic> myTaskJsonData = myTaskData.toJson();
          await myTask.add(myTaskJsonData);
          final snackBar = SnackBar(
            content: Text('Insert success'),
          );
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        showDialog(
            context: context,
            builder: (_) {
              return DialogError(message: 'ກະລຸນາປ້ອນຂໍ້ມູນໃຫ້ຄົບຖ້ວນ');
            });
      }
    } catch (e) {
      rethrow;
    }
  }
}
