import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/utils/methods.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/category/Presentation/Manager/get_reviews_bloc/get_reviews_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/get_reviews_bloc/get_reviews_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/get_reviews_bloc/get_reviews_state.dart';
import 'package:Learn_U/features/category/data/model/reviews_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/resource_manger/color_manager.dart';

class RatingBarWidgetBrowse extends StatefulWidget {
  const RatingBarWidgetBrowse(
      {super.key, required this.courses, required this.labelstyle});
  final SearchModel courses;
  final TextStyle labelstyle;

  @override
  State<RatingBarWidgetBrowse> createState() => _RatingBarWidgetBrowseState();
}

class _RatingBarWidgetBrowseState extends State<RatingBarWidgetBrowse> {
  @override
  void initState() {
    BlocProvider.of<GetReviewsBloc>(context)
        .add(GetallGetReviewEvent(course_id: widget.courses.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReviewsBloc, GetReviewsState>(
      builder: (context, state) {
        if (state is GetReviewsSuccessState) {
          return Row(
            children: [
              IgnorePointer(
                child: RatingBar.builder(
                  unratedColor: ColorManager.whiteColor,
                  itemSize: ConfigSize.defaultSize! * 2,
                  initialRating:
                      Methods.instance.Calculate_Rating(state.GetReviews),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: ColorManager.mainColor,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              SizedBox(width: ConfigSize.defaultSize! * 1),
              Text(
                state.GetReviews.isNotEmpty
                    ? Methods.instance
                        .Calculate_Rating(state.GetReviews)
                        .toStringAsFixed(1)
                    : '5.0',
                style: widget.labelstyle,
              ),
            ],
          );
        }
        if (state is GetReviewsErrorState) {
          return Text(state.errorMessage);
        }
        return Center(
            child: Container(
          height: ConfigSize.defaultSize! * 1.5,
          width: ConfigSize.defaultSize! * 1.5,
          child: CircularProgressIndicator(
            color: ColorManager.mainColor,
          ),
        ));
      },
    );
  }
}
