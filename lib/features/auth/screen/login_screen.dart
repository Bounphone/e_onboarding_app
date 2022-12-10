import 'package:e_onboarding_app/features/auth/view_model/auth_vm.dart';
import 'package:e_onboarding_app/widgets/dialog/dialog_loading.dart';
import 'package:provider/provider.dart';

import '../auth.dart';
import 'package:e_onboarding_app/features/auth/data/login_data.dart';
import 'package:e_onboarding_app/features/auth/screen/sign_up_screen.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/text_field/text_field_widget.dart';
import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImage.bgImage), fit: BoxFit.cover)),
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
                            TextFieldWidget(controller: email, hide: false),
                            const SizedBox(height: 10),
                            const Text('Password'),
                            const SizedBox(height: 5),
                            TextFieldWidget(controller: password, hide: true),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Consumer<AuthVM>(builder: (context, model, _) {
                    return ButtonWidgets(
                        title: 'Login',
                        onPress: () {
                          showDialog(context: context, builder: (_){
                            return const DialogLoading();
                          });
                          // model.signIn(email.text, password.text, context);
                        });
                  }),
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
  }
}
