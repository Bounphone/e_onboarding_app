import '../auth.dart';
import 'package:e_onboarding_app/features/auth/data/login_data.dart';
import 'package:e_onboarding_app/features/auth/screen/sign_up_screen.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/text_field/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_textstyle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    enablePw = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImage.bgImage),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Hello buddy',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            const Text('Email'),
                            const SizedBox(height: 5),
                            TextFieldWidget(controller: username),
                            const SizedBox(height: 10),
                            const Text('Password'),
                            const SizedBox(height: 5),
                            TextFieldWidget(controller: password),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ButtonWidgets(title: 'Login', onPress: () {}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account yet?"),
                      TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen())),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: AppColor.primaryColor),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // return SafeArea(
    //   child: Scaffold(
    //     body: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: SizedBox(
    //           height: MediaQuery.of(context).size.height,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const Spacer(),
    //               const Text('Hello buddy'),
    //               const SizedBox(height: 10),
    //               const Text('Email'),
    //               const SizedBox(height: 5),
    //               TextFieldWidget(controller: username),
    //               const SizedBox(height: 10),
    //               const Text('Password'),
    //               const SizedBox(height: 5),
    //               TextFieldWidget(controller: password),
    //               const Spacer(),
    //               SizedBox(
    //                   width: double.infinity,
    //                   child: ElevatedButton(
    //                       onPressed: () {}, child: const Text("Login"))),
    //               const SizedBox(height: 20),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   const Text("Don't have an account yet?"),
    //                   TextButton(onPressed: (){}, child: const Text('Sign up')),
    //                 ],
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
