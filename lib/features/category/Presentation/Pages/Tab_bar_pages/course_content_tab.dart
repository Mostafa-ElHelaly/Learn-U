import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_state.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseContentTab extends StatefulWidget {
  CourseContentTab({Key? key, required this.courses}) : super(key: key);

  final SearchModel courses;

  @override
  State<CourseContentTab> createState() => _CourseContentTabState();
}

class _CourseContentTabState extends State<CourseContentTab> {
  final TextStyle labelstyle = TextStyle(
    fontSize: ConfigSize.defaultSize! * 1.5,
    fontWeight: FontWeight.bold,
  );
  @override
  void initState() {
    BlocProvider.of<CourseDetailsDataBloc>(context)
        .add(CourseDetailsEvent(course_id: widget.courses.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
        child: BlocBuilder<CourseDetailsDataBloc, CourseDetailsState>(
          builder: (context, state) {
            if (state is CourseDetailsSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Course Content', style: labelstyle),
                  SizedBox(
                      height: ConfigSize
                          .defaultSize!), // Adding space between elements
                  Row(
                    children: [
                      Text('${state.CourseDetails.groups!.length} Sections | '),
                      Text('${widget.courses.lessonsCount} Lectures | '),
                      Text(
                          '${widget.courses.courseLength}${widget.courses.courseLengthTime} Total Length'),
                    ],
                  ),
                  SizedBox(
                      height: ConfigSize
                          .defaultSize!), // Adding space between elements
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Accordion(
                            headerBackgroundColor: ColorManager.gray,
                            contentBorderColor: ColorManager.gray,
                            children: [
                              AccordionSection(
                                content: ListView.builder(
                                  itemBuilder: (context, index2) {
                                    Text(state.CourseDetails.groups![index]
                                        .lessons![index2].name!);
                                  },
                                  itemCount: state.CourseDetails.groups![index]
                                      .lessons!.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                ),
                                header: Container(
                                  height: ConfigSize.defaultSize! * 8,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        ConfigSize.defaultSize! * 1),
                                    child: ListTile(
                                      title: Text(state
                                          .CourseDetails.groups![index].name!),
                                      subtitle: Text('1 Lecture'),
                                    ),
                                  ),
                                ),
                              ),
                            ]);
                      },
                      itemCount: state.CourseDetails.groups!.length,
                      shrinkWrap: true,
                    ),
                    // Accordion(

                    //   children: [
                    //     AccordionSection(
                    //       content: Text(state.CourseDetails.groups![0].name!),
                    //       header: Container(
                    //         height: ConfigSize.defaultSize! * 8,
                    //         child: Padding(
                    //           padding:
                    //               EdgeInsets.all(ConfigSize.defaultSize! * 1),
                    //           child: ListTile(
                    //             title: Text(state.CourseDetails.groups![0].name
                    //                 .toString()),
                    //             subtitle: Text('1 Lecture'),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     AccordionSection(
                    //       content: ListView.builder(
                    //         physics: NeverScrollableScrollPhysics(),
                    //         shrinkWrap: true,
                    //         itemCount: (widget.courses.lessonsCount! - 2),
                    //         itemBuilder: (context, index) {
                    //           return Padding(
                    //             padding:
                    //                 EdgeInsets.all(ConfigSize.defaultSize! * 1),
                    //             child: Center(
                    //               child: Container(
                    //                 width: ConfigSize.defaultSize! * 10,
                    //                 child: Text('Lesson ${index + 1}'),
                    //               ),
                    //             ),
                    //           );
                    //         },
                    //       ),
                    //       header: Container(
                    //         height: ConfigSize.defaultSize! * 8,
                    //         child: Padding(
                    //           padding:
                    //               EdgeInsets.all(ConfigSize.defaultSize! * 1),
                    //           child: ListTile(
                    //             title: Text('Course Content'),
                    //             subtitle: Text(
                    //                 '${widget.courses.lessonsCount! - 2} Lectures'),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     AccordionSection(
                    //       content: Text('Outro'),
                    //       header: Container(
                    //         height: ConfigSize.defaultSize! * 8,
                    //         child: Padding(
                    //           padding:
                    //               EdgeInsets.all(ConfigSize.defaultSize! * 1),
                    //           child: ListTile(
                    //             title: Text('Outro'),
                    //             subtitle: Text('1 Lecture'),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ),
                ],
              );
            }
            if (state is CourseDetailsErrorState) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.mainColor,
                  strokeWidth: ConfigSize.defaultSize!,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
