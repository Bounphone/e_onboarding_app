import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:flutter/material.dart';

class BuddyChatScreen extends StatefulWidget {
  const BuddyChatScreen({Key? key}) : super(key: key);

  @override
  State<BuddyChatScreen> createState() => _BuddyChatScreenState();
}

class _BuddyChatScreenState extends State<BuddyChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i){
          return Container(
            child: Align(
              //wait for status message recieve or sender
              // alignment: ,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //for receive use second color for sender use primary
                  // color:
                ),
                padding: EdgeInsets.all(10),
                child: Text(''),
              ),
            ),
          );
          }),
    );
  }
}
