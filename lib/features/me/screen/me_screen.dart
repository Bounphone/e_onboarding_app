import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/config/app_icons.dart';
import 'package:e_onboarding_app/features/home/home_vm/home_vm.dart';
import 'package:e_onboarding_app/features/me/models/me_button_model.dart';
import 'package:e_onboarding_app/features/me/screen/my_company_screen.dart';
import 'package:e_onboarding_app/features/me/screen/my_employee_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MeScreen extends StatefulWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  List<MeButtonModel> buttons = [
    MeButtonModel(
        title: 'My company',
        image: AppIcons.companyIcon,
        screen: MyCompanyScreen()),
    // MeButtonModel(
    //     title: 'Completed task',
    //     image: AppIcons.previousIcon,
    //     screen: MyGoalScreen(
    //       status: 'Completed',
    //     )),
    // MeButtonModel(
    //     title: 'Undone task',
    //     image: AppIcons.unDoneIcon,
    //     screen: MyGoalScreen(
    //       status: "Do the task",
    //     )),
  ];

  @override
  Widget build(BuildContext context) {
    String? firstName = context.read<HomeVM>().getFirstName;
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
                Text(firstName ?? 'None',
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
                  children: buttons
                      .map((e) => InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => e.screen));
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(8.h),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: ImageIcon(
                                      AssetImage(e.image),
                                      color: AppColor.primaryColor,
                                    )),
                                SizedBox(height: 5.h),
                                Text(e.title)
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          )),
    );
  }
}
