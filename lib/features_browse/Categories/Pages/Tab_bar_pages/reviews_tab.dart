import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/category/Presentation/Manager/get_reviews_bloc/get_reviews_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/get_reviews_bloc/get_reviews_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/get_reviews_bloc/get_reviews_state.dart';
import 'package:Learn_U/features/category/Presentation/Widgets/Reviews_Card.dart';
import 'package:Learn_U/features/category/data/model/reviews_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReviewsTabBrowse extends StatefulWidget {
  ReviewsTabBrowse({super.key, required this.courses});
  final SearchModel courses;

  @override
  State<ReviewsTabBrowse> createState() => _ReviewsTabBrowseState();
}

class _ReviewsTabBrowseState extends State<ReviewsTabBrowse> {
  TextStyle labelstyle = TextStyle(
      fontSize: ConfigSize.defaultSize! * 2, fontWeight: FontWeight.bold);
  @override
  void initState() {
    BlocProvider.of<GetReviewsBloc>(context)
        .add(GetallGetReviewEvent(course_id: widget.courses.id!));
    super.initState();
  }

  double Calculate_Rating(List<ReviewsModel> totalreview) {
    double sum = 0.0;
    for (var review in totalreview) {
      sum += double.parse(review.review.toString());
    }

    // Calculate and return the average
    return (sum / totalreview.length) / 2;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReviewsBloc, GetReviewsState>(
      builder: (context, state) {
        if (state is GetReviewsSuccessState) {
          List<ReviewsModel> totalreview = state.GetReviews;

          return Padding(
            padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: ColorManager.mainColor,
                      ),
                      Text(
                          state.GetReviews.isEmpty
                              ? "0 " +
                                  AppLocalizations.of(context)!.courserating
                              : Calculate_Rating(state.GetReviews)
                                      .toStringAsFixed(1) +
                                  ' ' +
                                  AppLocalizations.of(context)!.courserating,
                          style: labelstyle),
                    ],
                  ),
                  SizedBox(height: ConfigSize.defaultSize! * 1),
                  Text(state.GetReviews.isEmpty
                      ? "0 "
                      : state.GetReviews.length.toString() +
                          ' ' +
                          AppLocalizations.of(context)!.reviews),
                  SizedBox(height: ConfigSize.defaultSize! * 5),
                  Text(
                    AppLocalizations.of(context)!.reviews,
                    style: labelstyle,
                  ),
                  SizedBox(height: ConfigSize.defaultSize! * 3),
                  Container(
                    height: ConfigSize.defaultSize! * 15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ConfigSize.defaultSize! * 1),
                          child: ReviewsCard(
                            user_first_name: totalreview[index].firstName,
                            user_last_name: totalreview[index].lastName,
                            updated_date: totalreview[index].updatestamp,
                            review: totalreview[index].message ?? 'NONE',
                            rating: double.parse(
                                totalreview[index].review.toString()),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: state.GetReviews.length,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        if (state is GetReviewsErrorState) {
          return Text(state.errorMessage);
        }
        return const Center(
          child: CircularProgressIndicator(
            color: ColorManager.mainColor,
          ),
        );
      },
    );
  }
}
