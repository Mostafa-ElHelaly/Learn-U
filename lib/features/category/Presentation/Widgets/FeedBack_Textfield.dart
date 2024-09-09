import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter/material.dart';

class FeedbackTextfield extends StatelessWidget {
  FeedbackTextfield({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: ColorManager.black,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.black),
          borderRadius: BorderRadius.circular(ConfigSize.defaultSize! * 1),
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.gray)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.black),
          borderRadius: BorderRadius.circular(ConfigSize.defaultSize! * 1),
        ),
      ),
    );
  }
}
