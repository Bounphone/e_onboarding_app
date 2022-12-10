
import 'package:dio/dio.dart';
import 'package:e_onboarding_app/config/app_url.dart';

class RegisterUser{
  static Future register(
      String firstname,
      String lastname,
      String email,
      String password,
      String birthday
      ) async{
      var body =
      {
        "first_name" : firstname,
        "last_name" : lastname,
        "email" : email,
        "password" : password,
        "birthday" : birthday
      };

      Response res = await Dio().post(
        AppUrl.url + AppUrl.register,
          data: body,
      );

      if(res.statusCode == 200){
        print('ok');
      }else{
        print('no');
      }
  }
}