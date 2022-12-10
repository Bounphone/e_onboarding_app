
import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/config/app_image.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:flutter/material.dart';

class BuddyScreen extends StatefulWidget {
  const BuddyScreen({Key? key}) : super(key: key);

  @override
  State<BuddyScreen> createState() => _BuddyScreenState();
}

class _BuddyScreenState extends State<BuddyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImage.bgImage))
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('introducing to you'),
                        Text('Your Buddy'),
                        SizedBox(height: 20),
                        ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: 3,
                            itemBuilder: (context,i){
                              return Card(
                                shape: Border.fromBorderSide(BorderSide(color: AppColor.primaryColor)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                                  child: Row(
                                    children: [
                                      Column(
                                          children: [
                                            CircleAvatar()
                                          ]),
                                      SizedBox(width: 10),
                                      Column(
                                        children: [
                                          Text('Name'),
                                          SizedBox(height: 20),
                                          Text('Ux/Ui')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  ButtonWidgets(title: 'Say Hi to buddy', onPress: (){})
                ],
              ),
            ),
          ),
        ),
    );
  }
}
