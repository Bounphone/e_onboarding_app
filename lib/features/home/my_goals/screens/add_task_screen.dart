import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:e_onboarding_app/widgets/text_field/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../data/my_goals_data.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CircleAvatarIconWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            Expanded(
             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Text('Add Task'),
                  SizedBox(height: 20),
                  Text('Title'),
                  SizedBox(height: 5),
                  TextFieldWidget(controller: title, hide: false),
                  SizedBox(height: 20),
                  Text('Detail'),
                  SizedBox(height: 5),
                  TextFieldWidget(controller: detail, hide: false,),
                ],
            ),
             )),
            ButtonWidgets(title: 'Add to do today', onPress: (){}),
            ButtonWidgets(title: 'do it laer', onPress: (){}),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
