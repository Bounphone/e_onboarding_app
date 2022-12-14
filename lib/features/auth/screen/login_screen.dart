import 'package:e_onboarding_app/config/app_image.dart';
import 'package:e_onboarding_app/features/auth/view_model/auth_vm.dart';
import 'package:e_onboarding_app/utils/validator/check_login.dart';
import 'package:provider/provider.dart';
import 'package:e_onboarding_app/features/auth/screen/sign_up_screen.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/text_field/text_field_widget.dart';
import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  bool enablePw = false;
  @override
  Widget build(BuildContext context) {
    checkLogin(context);
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
              child: Form(
                key: _formKey,
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
                              TextFieldWidget(
                                controller: email,
                                hide: false,
                                validator: (email) {
                                  if(email.isEmpty){
                                    return 'Please enter your email';
                                  }
                                }),
                              const SizedBox(height: 10),
                              const Text('Password'),
                              const SizedBox(height: 5),
                              TextFieldWidget(
                                controller: password, hide: true,
                                  validator: (password) {
                                    if(password.isEmpty){
                                      return 'Please enter your password';
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Consumer<AuthVM>(builder: (context, model, _) {
                      return ButtonWidgets(
                          title: 'Login',
                          onPress: () {
                            if(_formKey.currentState!.validate()){
                              model.signIn(email.text, password.text, context);
                            }
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
      ),
    );
  }
}
