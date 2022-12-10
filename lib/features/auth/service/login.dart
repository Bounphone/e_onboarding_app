import 'package:dio/dio.dart';
import 'package:e_onboarding_app/config/app_url.dart';

class Login{
  static Future login(String email, String password) async{
    var body = {
      'email' : email,
      'password' : password,
    };
    Response res = await Dio().post(AppUrl.url + AppUrl.login,
        data: body,
    );
      
  }
}