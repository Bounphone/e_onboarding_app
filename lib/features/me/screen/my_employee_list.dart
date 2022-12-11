import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyEmployeeListScreen extends StatelessWidget {
  String firstName;
  String lastName;
  String email;
  int index;

  MyEmployeeListScreen(
      {required this.email,
      required this.lastName,
      required this.firstName,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border:
              Border.fromBorderSide(BorderSide(color: AppColor.primaryColor))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Row(
          children: [
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$firstName $lastName',
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10.h),
                Text(email,
                    style: TextStyle(
                        fontSize: 14.sp, color: AppColor.primaryColor)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
