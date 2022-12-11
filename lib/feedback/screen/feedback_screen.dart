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
                        child: IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.add, color: AppColor.primaryColor)),
                      ),
                    ],
                  ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             MyGoalsDetailScreen(
                  //               title: taskData.taskTitle ?? "",
                  //               detail: taskData.taskDetail ?? "",
                  //             )));
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(8.r),
                        side: const BorderSide(
                            color: AppColor.primaryColor)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text('title', style: TextStyle(fontSize: 22.sp, color: AppColor.primaryColor)),
                          SizedBox(height: 10),
                          Text('detail'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up)),
                              Text('like'),
                              IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down)),
                              Text('dislike'),
                            ],
                          )
                          // Align(
                          //   alignment: Alignment.centerRight,
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       // data.update('taskStatus',
                          //       //         (value) {
                          //       //       return value ==
                          //       //           'Do the task'
                          //       //           ? 'Completed'
                          //       //           : 'Do the task';
                          //       //     });
                          //     },
                          //     child: Container(
                          //       padding: EdgeInsets.symmetric(
                          //           vertical: 8.h,
                          //           horizontal: 20.w),
                          //       decoration: BoxDecoration(
                          //           borderRadius:
                          //           BorderRadius.circular(
                          //               10),
                          //           color: AppColor.primaryColor),
                          //       child: Text('Do the task',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight:
                          //             FontWeight.w700),
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              )
                ],
              ),
            )),
      ),
    );
  }
}
