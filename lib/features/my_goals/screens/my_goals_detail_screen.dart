import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/features/my_goals/models/my_task_model.dart';
import 'package:e_onboarding_app/widgets/button/my_goal_button.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../my_goals_vm/my_goals_vm.dart';

class MyGoalsDetailScreen extends StatefulWidget {
  final String title;
  final String detail;
  bool showButton;
  MyTaskModel? taskData;
  String? id;

  MyGoalsDetailScreen(
      {Key? key,
      required this.title,
      required this.detail,
      required this.showButton, this.taskData, this.id})
      : super(key: key);

  @override
  State<MyGoalsDetailScreen> createState() => _MyGoalsDetailScreenState();
}

class _MyGoalsDetailScreenState extends State<MyGoalsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatarIconWidget(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(widget.title,
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    Text(widget.detail, style: TextStyle(fontSize: 15.sp)),
                  ],
                ),
              ),
            ),
            widget.showButton
                ? MyGoalButton(taskData: widget.taskData!, id: widget.id ?? '')
                : Container(),
          ],
        ),
      ),
    );
  }
}
