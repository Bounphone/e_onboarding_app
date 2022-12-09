import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/features/auth/data/sign_up_data.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/text_field/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Sign up', style: TextStyle(fontSize: 20, color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    const Text('First Name'),
                    const SizedBox(height: 5),
                    TextFieldWidget(controller: firstname),
                    const SizedBox(height: 10),
                    const Text('Last Name'),
                    const SizedBox(height: 5),
                    TextFieldWidget(controller: lastname),
                    const SizedBox(height: 10),
                    const Text('Birthdate'),
                    const SizedBox(height: 5),
                    TextFieldWidget(controller: birthdate),
                    const SizedBox(height: 10),
                    const Text('Email'),
                    const SizedBox(height: 5),
                    TextFieldWidget(controller: email),
                    const SizedBox(height: 10),
                    const Text('Password'),
                    const SizedBox(height: 5),
                    TextFieldWidget(controller: password),
                    const SizedBox(height: 10),
                  ],
                ),
              )),
              ButtonWidgets(title: 'Next', onPress: (){}),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have an account already?'),
                  TextButton(onPressed: (){}, child: Text('Login', style: TextStyle(color: AppColor.primaryColor)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
