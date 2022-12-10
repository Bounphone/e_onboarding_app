import 'package:e_onboarding_app/config/app_colors.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:flutter/material.dart';

class MyGoalScreen extends StatefulWidget {
  const MyGoalScreen({Key? key}) : super(key: key);

  @override
  State<MyGoalScreen> createState() => _MyGoalScreenState();
}

class _MyGoalScreenState extends State<MyGoalScreen> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('My Goals'),
                    Switch(value: isSwitch, onChanged: (value){
                      isSwitch = value;
                      setState(() {

                      });
                    },
                    activeTrackColor: AppColor.primaryColor,
                      activeColor: AppColor.secondColor,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Task progress'),
                    Text('10%'),
                  ],
                ),
                SizedBox(height: 5),
                ButtonWidgets(title: 'Add new task', onPress: (){}),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: const Border.fromBorderSide(BorderSide(color: AppColor.secondColor)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Time'),
                          Text("lorem"),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey
                              ),
                              child: Text('Completed'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
