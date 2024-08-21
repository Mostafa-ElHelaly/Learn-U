import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/utils/constant_image_url.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:flutter/material.dart';

class CourseDetailsBrowse extends StatefulWidget {
  const CourseDetailsBrowse(
      {super.key, required this.courses, required this.categories});
  final SearchModel courses;
  final CategoriesModel categories;

  @override
  State<CourseDetailsBrowse> createState() => _CourseDetailsBrowseState();
}

class _CourseDetailsBrowseState extends State<CourseDetailsBrowse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(ConfigSize.defaultSize! * 1),
                    child: Image.network(
                      ConstantImageUrl.constantimageurl +
                          widget.courses.image.toString(),
                      filterQuality: FilterQuality.high,
                      height: ConfigSize.defaultSize! * 15,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.courses.name.toString(),
                        style: TextStyle(fontSize: ConfigSize.defaultSize! * 1),
                      ),
                      Text(widget.courses.courseLevel.toString()),
                      Text(widget.categories.name.toString()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
