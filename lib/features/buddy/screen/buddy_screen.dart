import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/config/app_image.dart';
import 'package:e_onboarding_app/config/firebase_collection.dart';
import 'package:e_onboarding_app/features/auth/screen/login_screen.dart';
import 'package:e_onboarding_app/features/home/home_vm/home_vm.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/my_buddy_model.dart';
import 'buddy_chat_screen.dart';

class BuddyScreen extends StatefulWidget {
  const BuddyScreen({Key? key}) : super(key: key);

  @override
  State<BuddyScreen> createState() => _BuddyScreenState();
}

class _BuddyScreenState extends State<BuddyScreen> {
  final Stream<QuerySnapshot> myBuddy = FirebaseCollection.myBuddy.snapshots();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(builder: (context, model, _) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImage.bgImage,
                ),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: StreamBuilder<QuerySnapshot>(
              stream: myBuddy,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                /// Error
                if (snapshot.hasError) {
                  return Text('Something went wrong ${snapshot.error}');
                }

                /// Loading
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              'introducing to you',
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  color: AppColor.primaryColor),
                            ),
                            Text(
                              'Your Buddy',
                              style: TextStyle(
                                  fontSize: 35.sp,
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 20.h),
                            ListView(
                              shrinkWrap: true,
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;

                                /// Parse data to model
                                MyBuddyModel buddyModel =
                                    MyBuddyModel.fromJson(data);
                                if (buddyModel.userEmail == model.getEmail) {
                                  List<Buddy>? buddies =
                                      buddyModel.buddies ?? [];
                                  for (var i in buddies) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return const BuddyChatScreen();
                                        }));
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.r),
                                            side: BorderSide(
                                                color: AppColor.primaryColor)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 13.0.h,
                                              horizontal: 20.w),
                                          child: Row(
                                            children: [
                                              CircleAvatar(),
                                              SizedBox(width: 15.w),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    i.buddyName ?? 'none',
                                                    style: TextStyle(
                                                        fontSize: 17.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColor
                                                            .primaryColor),
                                                  ),
                                                  Text(
                                                    i.buddySurname ?? 'none',
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: AppColor
                                                            .primaryColor),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }
                                return Container();
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                    ),
                    ButtonWidgets(
                        title: 'Say Hi to buddy',
                        onPress: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => LoginScreen()));
                        })
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
