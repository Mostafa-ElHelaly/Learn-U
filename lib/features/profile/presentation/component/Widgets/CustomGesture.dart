import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter/material.dart';

TextStyle textbuttonstyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorManager.blue,
    fontSize: ConfigSize.defaultSize! * 1.5,
    decoration: TextDecoration.underline);

class CustomGestureDetector extends GestureDetector {
  CustomGestureDetector({
    required BuildContext context,
    required Widget NavigatorPage,
    required String title,
  }) : super(
          child: Text(title, style: textbuttonstyle),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return NavigatorPage;
              },
            ));
          },
        );
}
