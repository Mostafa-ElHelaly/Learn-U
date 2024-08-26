import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:flutter/material.dart';

showloading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("PLease Wait"),
          content: Container(
              color: Colors.transparent,
              height: 50,
              child: Center(
                  child: CircularProgressIndicator(
                color: ColorManager.mainColor,
              ))),
        );
      });
}
