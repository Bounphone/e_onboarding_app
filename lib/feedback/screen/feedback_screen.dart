import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Feedback',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold)),
                      CircleAvatar(
                        backgroundColor: AppColor.secondColor,
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.add, color: AppColor.primaryColor)),
                      ),
                    ],
                  ),

                ],
              ),
            )),
      ),
    );
  }
}
