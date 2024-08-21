import 'dart:ui';
import 'package:Learn_U/features_browse/Categories/Pages/Tab_bar_pages/course_tab_bar_view.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/utils/constant_image_url.dart';
import 'package:Learn_U/core/widgets/main_button.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/category/Presentation/Manager/trainers_bloc/trainers_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/trainers_bloc/trainers_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/trainers_bloc/trainers_state.dart';
import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:Learn_U/features/category/data/model/trainers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsBrowse extends StatefulWidget {
  const CourseDetailsBrowse(
      {super.key, required this.courses, required this.categories});
  final SearchModel courses;
  final CategoriesModel categories;

  @override
  State<CourseDetailsBrowse> createState() => _CourseDetailsBrowseState();
}

class _CourseDetailsBrowseState extends State<CourseDetailsBrowse> {
  String modify_level(String level) {
    if (level == 'low') {
      return 'Begninner';
    } else if (level == 'med') {
      return 'Intermediate';
    } else {
      return 'Advanced';
    }
  }

  String transform_from_html(String html) {
    return html_parser.parse(html).body!.text;
  }

  @override
  void initState() {
    BlocProvider.of<TrainersDataBloc>(context).add(GetallTrainersEvent());
    super.initState();
  }

  TextStyle labelstyle = TextStyle(
      fontSize: ConfigSize.defaultSize! * 2, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: ConfigSize.defaultSize! * 20,
                child: Row(
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
                        width: ConfigSize.defaultSize! * 15,
                      ),
                    ),
                    Container(
                      width: ConfigSize.defaultSize! * 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.courses.name.toString(),
                              style: labelstyle),
                          SizedBox(height: ConfigSize.defaultSize! * 1),
                          Text(
                            modify_level(widget.courses.courseLevel.toString()),
                            style: TextStyle(color: ColorManager.gray),
                          ),
                          SizedBox(height: ConfigSize.defaultSize! * 1),
                          Text(widget.categories.name.toString(),
                              style: TextStyle(color: ColorManager.gray)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.courses.desc.toString(),
                style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 2,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: ConfigSize.defaultSize! * 2),
              BlocBuilder<TrainersDataBloc, TrainersState>(
                builder: (context, state) {
                  if (state is TrainersSuccessState) {
                    List<TrainersModel> trainers = state.Trainers.where(
                      (element) => element.id == widget.courses.trainerId,
                    ).toList();

                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: ConfigSize.defaultSize! * 7,
                              width: ConfigSize.defaultSize! * 7,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(ConstantImageUrl
                                            .constantimageurl +
                                        trainers.first.thumbnail.toString())),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: ConfigSize.defaultSize! * 2),
                            Text(trainers.first.name.toString(),
                                style: labelstyle),
                          ],
                        ),
                        Text(
                          transform_from_html(trainers.first.about!
                              .replaceAll('    ', '')
                              .toString()),
                          style: TextStyle(letterSpacing: 0.5),
                        ),
                      ],
                    );
                  }
                  if (state is TrainersErrorState) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      color: ColorManager.mainColor,
                    ));
                  }
                },
              ),
              SizedBox(height: ConfigSize.defaultSize! * 2),
              MainButton(onTap: () {}, title: 'Buy Now'),
              CourseTabBarView(
                courses: widget.courses,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
