import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/Search_Page/presentation/manager/search_bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/constant_image_url.dart';
import '../../features/Search_Page/presentation/manager/search_bloc/search_event.dart';
import '../../features/Search_Page/presentation/manager/search_bloc/search_state.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key, required this.id});
  final int id;

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context).add(SearchEvent());
    super.initState();
  }

  TextStyle labelstyle = TextStyle(
    fontSize: ConfigSize.defaultSize! * 1.5,
    fontWeight: FontWeight.bold,
    color: ColorManager.whiteColor,
  );
  String modify_level(String level) {
    if (level == 'low') {
      return 'Begninner';
    } else if (level == 'med') {
      return 'Intermediate';
    } else {
      return 'Advanced';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccessState) {
                  List<SearchModel> courses = state.SearchList.where(
                      (element) => element.categoryId == widget.id).toList();
                  return Padding(
                    padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
                          child: Card(
                              child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    ConfigSize.defaultSize! * 1),
                                child: Container(
                                  height: ConfigSize.defaultSize! *
                                      20, // Increased height
                                  width: double
                                      .infinity, // Make width fill the container
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          ConstantImageUrl.constantimageurl +
                                              courses[index].image.toString()),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(
                                            ConfigSize.defaultSize! * 1),
                                        bottomRight: Radius.circular(
                                            ConfigSize.defaultSize! * 1)),
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            ConfigSize.defaultSize! * 0.5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              courses[index].name.toString(),
                                              style: labelstyle,
                                            ),
                                            SizedBox(
                                                height:
                                                    ConfigSize.defaultSize! *
                                                        1),
                                            Text(
                                              modify_level(courses[index]
                                                  .courseLevel
                                                  .toString()),
                                              style: labelstyle,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  courses[index]
                                                      .courseLength
                                                      .toString(),
                                                  style: labelstyle,
                                                ),
                                                Text(
                                                  courses[index]
                                                      .courseLengthTime
                                                      .toString(),
                                                  style: labelstyle,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      height: ConfigSize.defaultSize! * 10,
                                      color:
                                          ColorManager.black.withOpacity(0.95),
                                    ),
                                  ))
                            ],
                          )),
                        );
                      },
                      shrinkWrap: true,
                      itemCount: courses.length,
                      physics: BouncingScrollPhysics(),
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
            )
          ],
        )),
      ),
    );
  }
}
