
import 'package:dio/dio.dart';
import 'package:e_onboarding_app/config/app_url.dart';
import 'package:e_onboarding_app/features/home/my_goals/screens/my_goals_screen.dart';
import 'package:flutter/material.dart';

class Login{
  static Future login(context, String email, String password) async{
    var body = {
      'email' : email,
      'password' : password,
    };
    Response res = await Dio().post(AppUrl.url + AppUrl.login,
        data: body,
    );
      if(res.statusCode == 200){
        return Navigator.push(context, MaterialPageRoute(builder: (context) => MyGoalScreen()));
      }else{
        print('no');
      }
  }
}