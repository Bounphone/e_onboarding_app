import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyEmployeeListScreen extends StatefulWidget {
  const MyEmployeeListScreen({Key? key}) : super(key: key);

  @override
  State<MyEmployeeListScreen> createState() => _MyEmployeeListScreenState();
}

class _MyEmployeeListScreenState extends State<MyEmployeeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.fromBorderSide(
                      BorderSide(color: AppColor.primaryColor))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                child: Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10.h),
                        Text('Role',
                            style: TextStyle(
                                fontSize: 14.sp, color: AppColor.primaryColor)),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
