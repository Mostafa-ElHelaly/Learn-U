import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/utils/constant_image_url.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/category/Presentation/Manager/trainers_bloc/trainers_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/trainers_bloc/trainers_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart' as html_parser;

import '../../../../features/category/Presentation/Manager/trainers_bloc/trainers_event.dart';

class AboutTrainerTabBrowse extends StatefulWidget {
  const AboutTrainerTabBrowse({super.key, required this.courses});
  final SearchModel courses;

  @override
  State<AboutTrainerTabBrowse> createState() => _AboutTrainerTabBrowseState();
}

class _AboutTrainerTabBrowseState extends State<AboutTrainerTabBrowse> {
  @override
  void initState() {
    BlocProvider.of<TrainersDataBloc>(context).add(GetallTrainersEvent());
    super.initState();
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
    return Padding(
      padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<TrainersDataBloc, TrainersState>(
              builder: (context, state) {
                if (state is TrainersSuccessState) {
                  final trainer = state.Trainers.where(
                          (element) => element.id == widget.courses.trainerId)
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
                                        (widget.courses.image ?? '')),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: ConfigSize.defaultSize! * 2),
                          Text(trainer.name ?? 'Unknown', style: labelStyle),
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
          ],
        ),
      ),
    );
  }
}
