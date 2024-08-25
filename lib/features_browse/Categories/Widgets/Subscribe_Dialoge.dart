import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/widgets/main_button.dart';
import 'package:flutter/material.dart';

import '../../../core/resource_manger/routs_manager.dart';

SubscribeDialog(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Please Login",
            style: TextStyle(
                fontSize: ConfigSize.defaultSize! * 2,
                fontWeight: FontWeight.bold),
          ),
          content: Container(
              color: Colors.transparent,
              height: ConfigSize.defaultSize! * 12,
              child: Column(
                children: [
                  Text("Start your ducation plan pow and signin with us"),
                  SizedBox(height: ConfigSize.defaultSize! * 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: ConfigSize.defaultSize! * 15,
                          height: ConfigSize.defaultSize! * 5,
                          child: MainButton(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, Routes.login, (route) => false);
                              },
                              title: 'Login Now')),
                      Container(
                        width: ConfigSize.defaultSize! * 10,
                        height: ConfigSize.defaultSize! * 5,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  width: 2, color: ColorManager.mainColor)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: ColorManager.mainColor,
                              fontWeight: FontWeight.w600,
                              fontSize: ConfigSize.defaultSize! * 1.7,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
        );
      });
}
