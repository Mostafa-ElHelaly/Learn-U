import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/utils/methods.dart';
import 'package:Learn_U/core/widgets/main_button.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_bloc.dart';
import 'package:Learn_U/features_browse/Categories/Widgets/Subscribe_Dialoge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/resource_manger/color_manager.dart';
import '../../../../core/utils/constant_image_url.dart';
import '../../../../features/category/Presentation/Manager/categories_bloc/categories_state.dart';
import '../../../../features/category/data/model/categories_model.dart';

class AboutCourseTabBrowse extends StatefulWidget {
  AboutCourseTabBrowse({super.key, required this.courses});
  final SearchModel courses;

  @override
  State<AboutCourseTabBrowse> createState() => _AboutCourseTabBrowseState();
}

class _AboutCourseTabBrowseState extends State<AboutCourseTabBrowse> {
  TextStyle labelstyle = TextStyle(
      fontSize: ConfigSize.defaultSize! * 2, fontWeight: FontWeight.bold);
  String modifyLevel(String level) {
    switch (level) {
      case 'low':
        return AppLocalizations.of(context)!.begninner;
      case 'med':
        return AppLocalizations.of(context)!.intermediate;
      case 'high':
        return AppLocalizations.of(context)!.advanced;
      default:
        return 'Unknown';
    }
  }

  TextStyle labelStyle = TextStyle(
    fontSize: ConfigSize.defaultSize! * 2,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    String code = Methods.instance.fetch_current_languagecode(context);
    return Padding(
      padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
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
                        Text(
                            (code == 'ar'
                                    ? widget.courses.nameAr
                                    : widget.courses.name) ??
                                'Unknown',
                            style: labelStyle),
                        SizedBox(height: ConfigSize.defaultSize! * 1),
                        Text(
                          modifyLevel(widget.courses.courseLevel ?? 'unknown'),
                          style: TextStyle(color: ColorManager.gray),
                        ),
                        SizedBox(height: ConfigSize.defaultSize! * 1),
                        BlocBuilder<CategoriesDataBloc, CategoriesState>(
                          builder: (context, state) {
                            if (state is CategoriesSuccessState) {
                              List<CategoriesModel> categories =
                                  state.Categories.where((element) =>
                                      element.id ==
                                      widget.courses.categoryId).toList();
                              return Text((code == 'ar'
                                      ? categories.first.nameAr
                                      : categories.first.name) ??
                                  'Unknown');
                            }
                            if (state is CategoriesErrorState) {
                              return Text(state.errorMessage);
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.mainColor,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MainButton(
                onTap: () {
                  SubscribeDialog(context);
                },
                title: AppLocalizations.of(context)!.subscribenow),
            SizedBox(height: ConfigSize.defaultSize! * 2),
            Center(
                child: Text((code == 'ar'
                        ? widget.courses.descar.toString()
                        : widget.courses.desc.toString()) ??
                    '')),
            SizedBox(height: ConfigSize.defaultSize! * 2),
            Text(
              AppLocalizations.of(context)!.whatwillyoulearn,
              style: labelstyle,
            ),
            SizedBox(height: ConfigSize.defaultSize! * 5),
            Text(
              AppLocalizations.of(context)!.thiscourseincludes,
              style: labelstyle,
            ),
            ListTile(
              leading: Icon(Icons.library_books_outlined),
              title: Text(widget.courses.lessonsCount.toString() +
                  ' ' +
                  AppLocalizations.of(context)!.lectures),
            ),
            ListTile(
              leading: Icon(Icons.watch_later_rounded),
              title: Text(Methods.instance.convertToArabicNumbers(
                      widget.courses.courseLength.toString()) +
                  AppLocalizations.of(context)!.h +
                  ' ' +
                  AppLocalizations.of(context)!.ondemandvideos),
            ),
            ListTile(
              leading: Icon(Icons.file_download_outlined),
              title: Text(Methods.instance.convertToArabicNumbers('0') +
                  ' ' +
                  AppLocalizations.of(context)!.downloadableresources),
            ),
            SizedBox(height: ConfigSize.defaultSize! * 5),
            Text(
              AppLocalizations.of(context)!.requiredskills,
              style: labelstyle,
            ),
            SizedBox(height: ConfigSize.defaultSize! * 5),
            Text(
              AppLocalizations.of(context)!.whoshouldtakethiscourse,
              style: labelstyle,
            ),
            SizedBox(height: ConfigSize.defaultSize! * 1),
            code == 'ar'
                ? Text(Methods.instance.transformFromHtml(
                    widget.courses.courseTargetAudienceAr.toString()))
                : Text(''),
          ],
        ),
      ),
    );
  }
}
