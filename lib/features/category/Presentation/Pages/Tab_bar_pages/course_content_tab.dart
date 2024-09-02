import 'package:Learn_U/core/utils/methods.dart';
import 'package:Learn_U/core/widgets/main_button_3.dart';
import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_state.dart';
import 'package:Learn_U/features/category/Presentation/Pages/Swarmfy_video.dart';
import 'package:Learn_U/features/category/data/model/course_details_model.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseContentTab extends StatefulWidget {
  CourseContentTab({Key? key, required this.courses}) : super(key: key);

  final SearchModel courses;

  @override
  State<CourseContentTab> createState() => _CourseContentTabState();
}

class _CourseContentTabState extends State<CourseContentTab> {
  final TextStyle labelstyle = TextStyle(
    color: ColorManager.black,
    fontWeight: FontWeight.w600,
    fontSize: ConfigSize.defaultSize! * 1.3,
  );
  @override
  void initState() {
    BlocProvider.of<CourseDetailsDataBloc>(context)
        .add(CourseDetailsEvent(course_id: widget.courses.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String code = Methods.instance.fetch_current_languagecode(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
        child: BlocBuilder<CourseDetailsDataBloc, CourseDetailsState>(
          builder: (context, state) {
            if (state is CourseDetailsSuccessState) {
              String groupcount = state.CourseDetails.groups!.length.toString();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.coursecontent,
                      style: labelstyle),
                  SizedBox(
                      height: ConfigSize
                          .defaultSize!), // Adding space between elements
                  Row(
                    children: [
                      Text(
                          '${code == 'ar' ? Methods.instance.convertToArabicNumbers(groupcount) : groupcount} ${AppLocalizations.of(context)!.sections} | '),
                      Text(
                          '${code == 'ar' ? Methods.instance.convertToArabicNumbers(widget.courses.lessonsCount.toString()) : widget.courses.lessonsCount} ${AppLocalizations.of(context)!.lectures} | '),
                      Text(
                          '${code == 'ar' ? Methods.instance.convertToArabicNumbers(widget.courses.courseLength.toString()) : widget.courses.courseLength}${AppLocalizations.of(context)!.h} ${AppLocalizations.of(context)!.totallength}'),
                    ],
                  ), // Adding space between elements
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        List<Groups> groups = state.CourseDetails.groups!;
                        int lessoncount = groups[index].lessons!.length;
                        return Accordion(
                            headerBackgroundColor: ColorManager.gray,
                            contentBorderColor: ColorManager.gray,
                            children: [
                              AccordionSection(
                                content: Container(
                                  height: lessoncount > 1
                                      ? ConfigSize.defaultSize! * 12
                                      : ConfigSize.defaultSize! * 2,
                                  child: ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder: (context, index2) {
                                      String video_link = groups[index]
                                          .lessons![index2]
                                          .lessonVideo
                                          .toString();
                                      return Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height:
                                                  ConfigSize.defaultSize! * 2,
                                              child: MainButton3(
                                                  color: Colors.transparent,
                                                  onTap: () {
                                                    PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: SwarmfyVideoPage(
                                                          video_link:
                                                              video_link),
                                                      withNavBar: false,
                                                      pageTransitionAnimation:
                                                          PageTransitionAnimation
                                                              .fade,
                                                    );
                                                  },
                                                  title: groups[index]
                                                      .lessons![index2]
                                                      .name!),
                                            ),
                                            Visibility(
                                              visible: lessoncount > 1 &&
                                                      index2 != lessoncount - 1
                                                  ? true
                                                  : false,
                                              child: Divider(
                                                indent: 0,
                                                endIndent: 0,
                                                height:
                                                    ConfigSize.defaultSize! * 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: lessoncount,
                                    shrinkWrap: true,
                                  ),
                                ),
                                header: Container(
                                  height: ConfigSize.defaultSize! * 8,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        ConfigSize.defaultSize! * 1),
                                    child: ListTile(
                                      title: Text(
                                        state
                                            .CourseDetails.groups![index].name!,
                                        style: labelstyle,
                                      ),
                                      subtitle: Text(
                                          '${code == 'ar' ? Methods.instance.convertToArabicNumbers(lessoncount.toString()) : lessoncount} ${lessoncount == 1 ? AppLocalizations.of(context)!.lecture : AppLocalizations.of(context)!.lectures}'),
                                    ),
                                  ),
                                ),
                              ),
                            ]);
                      },
                      itemCount: state.CourseDetails.groups!.length,
                      shrinkWrap: true,
                    ),
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
