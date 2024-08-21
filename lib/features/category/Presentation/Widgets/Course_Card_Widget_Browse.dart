import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/utils/constant_image_url.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features_browse/Categories/Widgets/Rating_Bar.dart';
import 'package:flutter/material.dart';

class CourseCardWidget extends StatelessWidget {
  CourseCardWidget({super.key, required this.courses, required this.index});
  final List<SearchModel> courses;
  final int index;
  TextStyle labelstyle = TextStyle(
    fontSize: ConfigSize.defaultSize! * 1.5,
    fontWeight: FontWeight.bold,
    color: ColorManager.whiteColor,
  );
  String modify_level(String level) {
    if (level == 'low') {
      return 'Begninner';
    } else if (level == 'med') {
      return 'Intermediate';
    } else {
      return 'Advanced';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(ConfigSize.defaultSize! * 1),
          child: Container(
            height: ConfigSize.defaultSize! * 30, // Increased height
            width: double.infinity, // Make width fill the container
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(ConstantImageUrl.constantimageurl +
                    courses[index].image.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(ConfigSize.defaultSize! * 1),
                  bottomRight: Radius.circular(ConfigSize.defaultSize! * 1)),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.black.withOpacity(0.95),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      ColorManager.black,
                      ColorManager.black.withOpacity(0.9)
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(courses[index].name.toString(), style: labelstyle),
                      SizedBox(height: ConfigSize.defaultSize! * 1),
                      RatingBarWidgetBrowse(),
                      SizedBox(height: ConfigSize.defaultSize! * 1),
                      Text(
                        modify_level(courses[index].courseLevel.toString()),
                        style: labelstyle,
                      ),
                      Row(
                        children: [
                          Text(
                            courses[index].courseLength.toString(),
                            style:
                                labelstyle.copyWith(color: ColorManager.gray),
                          ),
                          Text(
                            courses[index].courseLengthTime.toString(),
                            style:
                                labelstyle.copyWith(color: ColorManager.gray),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height: ConfigSize.defaultSize! * 15,
              ),
            ))
      ],
    ));
  }
}
