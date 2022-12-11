import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/config/app_icons.dart';
import 'package:e_onboarding_app/features/me/models/me_button_model.dart';
import 'package:e_onboarding_app/features/me/screen/my_company_screen.dart';
import 'package:e_onboarding_app/features/me/screen/my_previous_task.dart';
import 'package:e_onboarding_app/features/me/screen/uncomplete_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeScreen extends StatefulWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  List<MeButtonModel> buttons = [
    MeButtonModel(title: 'My company', image: AppIcons.companyIcon, screen: MyCompanyScreen()),
    MeButtonModel(title: 'My Previous task', image: AppIcons.previousIcon, screen: MyPreviousTaskScreen()),
    MeButtonModel(title: 'Undone task', image: AppIcons.unDoneIcon, screen: MyUnDoneTask()),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.thirdColor,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text('Hello!',
                    style: TextStyle(
                        color: AppColor.primaryColor, fontSize: 15.sp)),
                Text('Name',
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold)),
                Text('30-60-90 Day Plan',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.orangeColor)),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MyCompanyScreen()));
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: ImageIcon(
                              AssetImage(AppIcons.companyIcon),
                              color: AppColor.primaryColor,
                            )
                          ),
                          SizedBox(height: 5.h),
                          Text('My company')
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MyPreviousTaskScreen()));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: ImageIcon(
                              AssetImage(AppIcons.previousIcon),
                              color: AppColor.primaryColor,
                            )
                          ),
                          SizedBox(height: 5.h),
                          Text('My previous task')
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MyUnDoneTask()));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r)),
                           child: ImageIcon(
                             AssetImage(AppIcons.unDoneIcon),
                             color: AppColor.primaryColor,
                           )
                          ),
                          SizedBox(height: 5.h),
                          Text('Undone task')
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
