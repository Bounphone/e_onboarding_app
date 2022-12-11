import 'package:e_onboarding_app/features/my_goals/my_goals_vm/my_goals_vm.dart';
import 'package:e_onboarding_app/widgets/button/button_widgets.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:e_onboarding_app/widgets/text_field/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  final title = TextEditingController();
  final detail = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Consumer<MyGoalsVM>(builder: (context, model, _) {
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Add Task', style: TextStyle(fontSize: 14.sp)),
                      SizedBox(height: 20.h),
                      Text('Title', style: TextStyle(fontSize: 14.sp)),
                      SizedBox(height: 5.h),
                      TextFieldWidget(
                        controller: title,
                        hide: false,
                        validator: (value) {
                          if(value.isEmpty){
                            return 'Please enter some title';
                          }
                        },
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Detail',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(height: 5.h),
                      TextFieldWidget(
                        controller: detail,
                        hide: false,
                        validator: (value) {
                          if(value.isEmpty){
                            return 'Please enter some detail';
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )),
              ButtonWidgets(
                  title: 'Add to do today',
                  onPress: () {
                    if(_formKey.currentState!.validate()){
                        model.addNewTask(title.text, detail.text, context);
                    }
                  }),
              // ButtonWidgets(title: 'do it later', onPress: () {}),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      );
    });
  }
}
