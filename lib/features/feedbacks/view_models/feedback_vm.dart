import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:e_onboarding_app/features/auth/screen/login_screen.dart';
import 'package:e_onboarding_app/features/auth/view_model/auth_vm.dart';
import 'package:e_onboarding_app/features/feedbacks/models/feedback_models.dart';
import 'package:e_onboarding_app/features/home/home_vm/home_vm.dart';
import 'package:e_onboarding_app/utils/shared_pref/auth_pref.dart';
import 'package:e_onboarding_app/utils/shared_pref/org_pref.dart';
import 'package:e_onboarding_app/widgets/dialog/dialog_error.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FeedbackVM extends ChangeNotifier {
  /// on add new feedback
  Future<void> addNewFeedback(
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
          String? orgName = await OrgPref().getOrgName();
          CollectionReference myFeedback = FirebaseCollection.feedback;
          DateTime now = DateTime.now();
          String formattedDate = DateFormat('yyyy-MM-dd kk:mm:ss').format(now);
          FeedbackModel feedbackData = FeedbackModel(
              title: title,
              detail: detail,
              postTime: formattedDate,
              liked: [],
              unLiked: [],
              orgFeedback: orgName);
          Map<String, dynamic> myFeedbackJSON = feedbackData.toJson();

          /// Add feedback to DB
          await myFeedback.add(myFeedbackJSON);
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

  /// When user like / unliked feedback
  Future<void> onLikeFeedBack(FeedbackModel feedbackModel, String id,
      BuildContext context, bool isLiked) async {
    try {
      CollectionReference feedback = FirebaseCollection.feedback;
      String? email = context.read<HomeVM>().getEmail;

      /// if user ever liked this post
      if (isLiked) {
        if (feedbackModel.liked!.any((element) => element == email)) {
          /// Unliked
          feedbackModel.liked!.removeWhere((element) => element == email);
        } else {
          /// Liked
          feedbackModel.liked!.add(email ?? '');
        }
        /// cancel unliked
        feedbackModel.unLiked!.removeWhere((element) => element == email);
      }

      /// if user unliked this post
      else {
        if (feedbackModel.unLiked!.any((element) => element == email)) {
          /// cancel
          feedbackModel.unLiked!.removeWhere((element) => element == email);
        } else {
          /// unliked
          feedbackModel.unLiked!.add(email ?? '');
        }
        /// cancel liked
        feedbackModel.liked!.removeWhere((element) => element == email);
      }

      /// Update to Database
      Map<String, dynamic> data = feedbackModel.toJson();
      feedback.doc(id).update(data);
    } catch (e) {
      rethrow;
    }
  }
}
