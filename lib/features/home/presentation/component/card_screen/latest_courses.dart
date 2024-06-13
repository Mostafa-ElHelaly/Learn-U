import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/asset_path.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../courses/presentation/my_polcies_screen.dart';
import '../medical_form/medical_form_main_person_data .dart';

class LatestCourses extends StatelessWidget {
  final String courseName;
  final String courseHours;
  final String courseLevel;
  final String image;

  const LatestCourses(
      {super.key,
      required this.courseName,
      required this.image,
      required this.courseHours,
      required this.courseLevel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ConfigSize.defaultSize! * 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            image,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  courseName,
                  style: TextStyle(
                    color: ColorManager.whiteColor,
                    fontSize: ConfigSize.defaultSize! * 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        courseHours,
                        style: TextStyle(
                            color: ColorManager.whiteColor,
                            fontSize: ConfigSize.defaultSize! * 1,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        courseLevel,
                        style: TextStyle(
                            color: ColorManager.whiteColor,
                            fontSize: ConfigSize.defaultSize! * 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
