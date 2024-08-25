import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:Learn_U/features_browse/Categories/Pages/Tab_bar_pages/course_tab_bar_view.dart';

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
  void initState() {
    super.initState();
    BlocProvider.of<TrainersDataBloc>(context).add(GetallTrainersEvent());
  }

  String modifyLevel(String level) {
    switch (level) {
      case 'low':
        return 'Beginner';
      case 'med':
        return 'Intermediate';
      case 'high':
        return 'Advanced';
      default:
        return 'Unknown';
    }
  }

  String transformFromHtml(String html) {
    return html_parser.parse(html).body?.text ?? '';
  }

  TextStyle labelStyle = TextStyle(
    fontSize: ConfigSize.defaultSize! * 2,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              (widget.courses.image ?? ''),
                          filterQuality: FilterQuality.high,
                          height: ConfigSize.defaultSize! * 15,
                          width: ConfigSize.defaultSize! * 15,
                        ),
                      ),
                      SizedBox(
                        width: ConfigSize.defaultSize! * 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.courses.name ?? 'Unknown',
                                style: labelStyle),
                            SizedBox(height: ConfigSize.defaultSize! * 1),
                            Text(
                              modifyLevel(
                                  widget.courses.courseLevel ?? 'unknown'),
                              style: TextStyle(color: ColorManager.gray),
                            ),
                            SizedBox(height: ConfigSize.defaultSize! * 1),
                            Text(widget.categories.name ?? 'Unknown',
                                style: TextStyle(color: ColorManager.gray)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),
                Text(
                  widget.courses.desc ?? 'No description available',
                  style: TextStyle(
                      fontSize: ConfigSize.defaultSize! * 2,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),
                BlocBuilder<TrainersDataBloc, TrainersState>(
                  builder: (context, state) {
                    if (state is TrainersSuccessState) {
                      final trainer = state.Trainers.where((element) =>
                              element.id == widget.courses.trainerId)
                          .toList()
                          .first;

                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: ConfigSize.defaultSize! * 7,
                                width: ConfigSize.defaultSize! * 7,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        ConstantImageUrl.constantimageurl +
                                            (trainer.thumbnail ?? '')),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: ConfigSize.defaultSize! * 2),
                              Text(trainer.name ?? 'Unknown',
                                  style: labelStyle),
                            ],
                          ),
                          SizedBox(height: ConfigSize.defaultSize! * 1),
                          Text(
                            transformFromHtml(
                                trainer.about?.replaceAll('    ', '') ?? ''),
                            style: TextStyle(letterSpacing: 0.5),
                          ),
                        ],
                      );
                    }
                    if (state is TrainersErrorState) {
                      return Center(child: Text(state.errorMessage));
                    }
                    return Center(
                        child: CircularProgressIndicator(
                            color: ColorManager.mainColor));
                  },
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),
                MainButton(onTap: () {}, title: 'Buy Now'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
