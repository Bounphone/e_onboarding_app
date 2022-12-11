import 'dart:io';
import 'package:e_onboarding_app/features/auth/screen/login_screen.dart';
import 'package:e_onboarding_app/features/auth/view_model/auth_vm.dart';
import 'package:e_onboarding_app/features/buddy/screen/buddy_profile_screen.dart';
import 'package:e_onboarding_app/features/home/home_vm/home_vm.dart';
import 'package:e_onboarding_app/features/my_goals/my_goals_vm/my_goals_vm.dart';
import 'package:e_onboarding_app/feedback/screen/feedback_comment.dart';
import 'package:e_onboarding_app/feedback/screen/feedback_screen.dart';
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
            ChangeNotifierProvider<HomeVM>(create: (_) => HomeVM())
          ],
          child: MaterialApp(
            theme: ThemeData(fontFamily: 'Montserrat'),
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home: const BuddyProfileScreen(),
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
