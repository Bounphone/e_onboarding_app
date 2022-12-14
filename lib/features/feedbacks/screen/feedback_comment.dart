import 'package:e_onboarding_app/features/feedbacks/view_models/feedback_vm.dart';
import 'package:e_onboarding_app/widgets/icon/circle_avatar_icon.dart';
import 'package:e_onboarding_app/widgets/text_field/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../config/app_colors.dart';

class FeedbackComment extends StatefulWidget {
  const FeedbackComment({Key? key}) : super(key: key);

  @override
  State<FeedbackComment> createState() => _FeedbackCommentState();
}

class _FeedbackCommentState extends State<FeedbackComment> {
  final _formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final detail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CircleAvatarIconWidget(),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Feedback',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 20.h),
                      Text('Title'),
                      SizedBox(height: 5),
                      TextFieldWidget(
                          controller: title, hide: false,
                        validator: (title) {
                            if(title.isEmpty){
                             return 'Please enter some title';
                            }
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Detail'),
                      SizedBox(height: 5),
                      TextFieldWidget(controller: detail, hide: false,
                        validator: (detail) {
                          if(detail.isEmpty){
                            return 'Please enter some detail';
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )),
              GestureDetector(
                onTap: () {
                  if(_formKey.currentState!.validate()){
                    context
                        .read<FeedbackVM>()
                        .addNewFeedback(title.text, detail.text, context);
                  }
                },
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Text('Submit',
                          style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    )),
              )
            ],
          ),
        ));
  }
}
