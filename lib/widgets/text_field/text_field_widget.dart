import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool hide;
  void Function(String)? onChanged;
  final FormFieldValidator validator;

   TextFieldWidget({Key? key, required this.controller, required this.hide, this.onChanged, required this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextFormField(
        obscureText: hide,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey)
          ),

        ),
        onChanged: onChanged,
      ),
    );
  }
}
