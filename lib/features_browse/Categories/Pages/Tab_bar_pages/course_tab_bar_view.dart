import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/courses/presentation/my_polcies_screen.dart';
import 'package:Learn_U/features_browse/Categories/Pages/Tab_bar_pages/about_course_tab.dart';
import 'package:Learn_U/features_browse/Categories/Pages/Tab_bar_pages/about_trainer_tab.dart';
import 'package:Learn_U/features_browse/Categories/Pages/Tab_bar_pages/course_content_tab.dart';
import 'package:Learn_U/features_browse/Categories/Pages/Tab_bar_pages/reviews_tab.dart';
import 'package:flutter/material.dart';

import '../../../../features/Search_Page/data/model/searchModel.dart';

class CourseTabBarView extends StatefulWidget {
  const CourseTabBarView({super.key, required this.courses});
  final SearchModel courses;

  @override
  State<CourseTabBarView> createState() => _CourseTabBarViewState();
}

class _CourseTabBarViewState extends State<CourseTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4, vsync: this); // Adjust the length based on your tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelPadding: EdgeInsets.all(10),
          indicatorColor: ColorManager.mainColor,
          labelColor: ColorManager.mainColor,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(text: 'About Course'),
            Tab(text: 'Course Content'),
            Tab(text: 'Reviews'),
            Tab(text: 'About Trainer'),
          ],
        ),
        Builder(builder: (BuildContext context) {
          return [
            AboutCourseTab(courses: widget.courses),
            CourseContentTab(),
            ReviewsTab(),
            AboutTrainerTab()
          ][_tabController.index];
        }),

        // TabBarView(
        //   controller: _tabController,
        //   physics: NeverScrollableScrollPhysics(),
        //   children: [
        //     AboutCourseTab(courses: widget.courses),
        //     CourseContentTab(),
        //     ReviewsTab(),
        //     AboutTrainerTab()
        //   ],
        // ),
      ],
    );
  }
}
