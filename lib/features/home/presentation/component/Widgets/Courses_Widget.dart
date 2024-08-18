import 'package:flutter/material.dart';

import '../../../../../core/resource_manger/color_manager.dart';
import '../../../../../core/utils/config_size.dart';

class LatestCoursesWidget extends StatelessWidget {
  const LatestCoursesWidget(
      {super.key,
      required this.courseName,
      required this.image,
      required this.courseHours,
      required this.courseLevel});

  final String courseName;
  final String image;
  final String courseHours;
  final String courseLevel;

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(color: ColorManager.whiteColor);
    return Container(
      height: ConfigSize.defaultSize! * 15,
      width: ConfigSize.defaultSize! * 15,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            courseName,
            style: style,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                courseHours,
                style: style,
              ),
              Text(
                courseLevel,
                style: style,
              )
            ],
          )
        ],
      ),
    );
  }
}
