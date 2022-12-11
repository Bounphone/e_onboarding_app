import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/features/auth/screen/login_screen.dart';
import 'package:e_onboarding_app/features/auth/view_model/auth_vm.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/text_field/text_field_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  final _formKey = GlobalKey<FormState>();

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final birthdate = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final buddyInv = TextEditingController();
  final confirmPw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: firebase,
          builder: (context, snapshot) {
            /// if there's error
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.hasError.toString()),
              );
            }

            /// connect success
            else if (snapshot.connectionState == ConnectionState.done ||
                snapshot.connectionState == ConnectionState.active) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sign up',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.h),
                            Text('First Name', style: TextStyle(fontSize: 12.sp)),
                            SizedBox(height: 5.h),
                            TextFieldWidget(
                                controller: firstname, hide: false,
                              validator: (firstname) {
                                if(firstname == null){
                                  return 'Please enter some title';
                                }
                              },
                            ),
                            SizedBox(height: 10.h),
                            Text('Last Name'),
                            SizedBox(height: 5.h),
                            TextFieldWidget(controller: lastname, hide: false,
                              validator: (lastname) {
                                if(lastname == null){
                                  return 'Please enter some title';
                                }
                              },
                            ),
                            SizedBox(height: 10.h),
                            Text('Birthdate', style: TextStyle(fontSize: 12.sp)),
                            SizedBox(height: 5.h),
                            TextFieldWidget(controller: birthdate, hide: false,
                              validator: (birthdate) {
                                if(birthdate == null){
                                  return 'Please enter some title';
                                }
                              },
                            ),
                            SizedBox(height: 10.h),
                            Text('Email', style: TextStyle(fontSize: 12.sp)),
                            SizedBox(height: 5.h),
                            TextFieldWidget(controller: email, hide: false,
                              validator: (email) {
                                if(email == null){
                                  return 'Please enter some title';
                                }
                              },
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Password',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            SizedBox(height: 5.h),
                            TextFieldWidget(controller: password, hide: true,
                              validator: (password) {
                                if(password == null){
                                  return 'Please enter some title';
                                }
                              },
                            ),
                            SizedBox(height: 10.sp),
                            Text(
                              'Confirm password',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            SizedBox(height: 5.h),
                            TextFieldWidget(controller: confirmPw, hide: true,
                              validator: (confirmPw) {
                                if(confirmPw == null){
                                  return 'Please enter some title';
                                }
                              },
                            ),
                            SizedBox(height: 10.sp),
                          ],
                        ),
                      ),
                    )),
                    Consumer<AuthVM>(
                      builder: (context, model, _) {
                        return ButtonWidgets(
                            title: 'Next',
                            onPress: () async {
                              model.onSignUp(
                                  email.text,
                                  password.text,
                                  firstname.text,
                                  lastname.text,
                                  birthdate.text, context);
                            });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have an account already?',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return LoginScreen();
                              }));
                            },
                            child: Text('Login',
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 12.sp)))
                      ],
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
