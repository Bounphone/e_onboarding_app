import 'package:e_onboarding_app/features/my_goals/models/my_task_model.dart';
import 'package:e_onboarding_app/features/my_goals/my_goals_vm/my_goals_vm.dart';
import 'package:e_onboarding_app/utils/set_color/set_my_goals_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyGoalButton extends StatelessWidget {
  MyTaskModel taskData;
  String id;

  MyGoalButton({required this.taskData, required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          context.read<MyGoalsVM>().updateTaskStatus(taskData, id);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: setMyGoalsColor(taskData.taskStatus ?? 'Do the task')),
          child: Text(
            taskData.taskStatus ?? 'Do the task',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
