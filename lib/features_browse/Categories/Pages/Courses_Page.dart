import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/Search_Page/presentation/manager/search_bloc/search_bloc.dart';
import 'package:Learn_U/features_browse/Categories/Widgets/Course_Card_Widget_Browse.dart';
import 'package:Learn_U/features_browse/Categories/Widgets/Rating_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/utils/constant_image_url.dart';
import '../../../features/Search_Page/presentation/manager/search_bloc/search_event.dart';
import '../../../features/Search_Page/presentation/manager/search_bloc/search_state.dart';

class CoursesPageBrowse extends StatefulWidget {
  const CoursesPageBrowse({super.key, required this.id});
  final int id;

  @override
  State<CoursesPageBrowse> createState() => _CoursesPageBrowseState();
}

class _CoursesPageBrowseState extends State<CoursesPageBrowse> {
  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context).add(SearchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccessState) {
            List<SearchModel> courses = state.SearchList.where(
                (element) => element.categoryId == widget.id).toList();
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                            padding:
                                EdgeInsets.all(ConfigSize.defaultSize! * 1),
                            child: CourseCardWidgetBrowse(
                              courses: courses,
                              index: index,
                            ));
                      },
                      shrinkWrap: true,
                      itemCount: courses.length,
                      physics: BouncingScrollPhysics(),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is SearchErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: ColorManager.mainColor,
            ));
          }
        },
      )),
    );
  }
}
