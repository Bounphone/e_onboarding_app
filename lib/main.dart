import 'dart:io';
import 'package:e_onboarding_app/features/auth/screen/login_screen.dart';
import 'package:e_onboarding_app/features/auth/view_model/auth_vm.dart';
import 'package:e_onboarding_app/features/feedbacks/view_models/feedback_vm.dart';
import 'package:e_onboarding_app/features/home/home_vm/home_vm.dart';
import 'package:e_onboarding_app/features/my_goals/my_goals_vm/my_goals_vm.dart';
import 'package:e_onboarding_app/features/org/view_model/org_vm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthVM>(create: (_) => AuthVM()),
            ChangeNotifierProvider<MyGoalsVM>(create: (_) => MyGoalsVM()),
            ChangeNotifierProvider<HomeVM>(create: (_) => HomeVM()),
            ChangeNotifierProvider<OrgVM>(create: (_) => OrgVM()),
            ChangeNotifierProvider<FeedbackVM>(create: (_) => FeedbackVM()),
          ],
          child: MaterialApp(
            theme: ThemeData(fontFamily: 'Montserrat'),
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          ),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
