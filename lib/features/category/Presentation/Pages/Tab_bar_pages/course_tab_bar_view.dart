import 'package:Learn_U/core/resource_manger/asset_path.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/category/Presentation/Pages/Tab_bar_pages/Tests_Tab.dart';
import 'package:Learn_U/features/category/Presentation/Pages/Tab_bar_pages/about_course_tab.dart';
import 'package:Learn_U/features/category/Presentation/Pages/Tab_bar_pages/about_trainer_tab.dart';
import 'package:Learn_U/features/category/Presentation/Pages/Tab_bar_pages/course_content_tab.dart';
import 'package:Learn_U/features/category/Presentation/Pages/Tab_bar_pages/reviews_tab.dart';
import 'package:flutter/material.dart';

class CourseTabBarView extends StatelessWidget {
  CourseTabBarView({super.key, required this.courses});
  final SearchModel courses;
  double icon_size = ConfigSize.defaultSize! * 3;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          centerTitle: true,
          title: Image.asset(
            AssetsPath.logo,
            height: ConfigSize.defaultSize! * 3,
          ),
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
              Tab(
                child: Container(
                    width: ConfigSize.defaultSize! * 10,
                    child: Icon(
                      Icons.table_restaurant_rounded,
                      size: icon_size,
                    )),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            AboutCourseTab(courses: courses),
            CourseContentTab(courses: courses),
            ReviewsTab(
              courses: courses,
            ),
            AboutTrainerTab(courses: courses),
            TestsTab(
              courses: courses,
            )
          ],
        ),
      ),
    );
  }
}
