import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/resource_manger/color_manager.dart';

class RatingBarWidgetBrowse extends StatelessWidget {
  const RatingBarWidgetBrowse({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      unratedColor: ColorManager.whiteColor,
      itemSize: ConfigSize.defaultSize! * 2,
      initialRating: 3,
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
    );
  }
}
