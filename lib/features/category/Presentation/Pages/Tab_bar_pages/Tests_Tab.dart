import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestsTab extends StatefulWidget {
  const TestsTab({super.key, required this.courses});
  final SearchModel courses;

  @override
  State<TestsTab> createState() => _TestsTabState();
}

class _TestsTabState extends State<TestsTab> {
  @override
  void initState() {
    BlocProvider.of<CourseDetailsDataBloc>(context)
        .add(CourseDetailsEvent(course_id: widget.courses.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<CourseDetailsDataBloc, CourseDetailsState>(
            builder: (context, state) {
              if (state is CourseDetailsSuccessState) {
                return Text(
                    state.CourseDetails.test?.questions?[0].name ?? 'No Tests');
              }
              if (state is CourseDetailsErrorState) {
                return Text(state.errorMessage);
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.mainColor,
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
