import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:Learn_U/features/courses/presentation/my_polcies_screen.dart';
import 'package:Learn_U/features_browse/Categories/Pages/Tab_bar_pages/about_course_tab.dart';
import 'package:Learn_U/features_browse/Categories/Pages/Tab_bar_pages/about_trainer_tab.dart';
import 'package:Learn_U/features_browse/Categories/Pages/Tab_bar_pages/course_content_tab.dart';
import 'package:Learn_U/features_browse/Categories/Pages/Tab_bar_pages/reviews_tab.dart';
import 'package:flutter/material.dart';

import '../../../../features/Search_Page/data/model/searchModel.dart';

class CourseTabBarView extends StatelessWidget {
  CourseTabBarView(
      {super.key, required this.courses, required this.categories});
  final SearchModel courses;
  final CategoriesModel categories;
  double icon_size = ConfigSize.defaultSize! * 4;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Course Details'),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: ColorManager.whiteColor,
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: ColorManager.mainColor,
            labelColor: ColorManager.mainColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                child: Container(
                    width: ConfigSize.defaultSize! * 10,
                    child: Icon(
                      Icons.short_text,
                      size: icon_size,
                    )),
              ),
              Tab(
                child: Container(
                    width: ConfigSize.defaultSize! * 10,
                    child: Icon(
                      Icons.description,
                      size: icon_size,
                    )),
              ),
              Tab(
                child: Container(
                    width: ConfigSize.defaultSize! * 10,
                    child: Icon(
                      Icons.reviews_outlined,
                      size: icon_size,
                    )),
              ),
              Tab(
                child: Container(
                    width: ConfigSize.defaultSize! * 10,
                    child: Icon(
                      Icons.portrait,
                      size: icon_size,
                    )),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            AboutCourseTab(courses: courses, categories: categories),
            CourseContentTab(courses: courses),
            ReviewsTab(),
            AboutTrainerTab()
          ],
        ),
      ),
    );
  }
}

//  Builder(builder: (BuildContext context) {
        //   return [
        //     AboutCourseTab(courses: widget.courses),
        //     CourseContentTab(),
        //     ReviewsTab(),
        //     AboutTrainerTab()
        //   ][_tabController.index];
        // }),