import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ChangingRatingBar extends StatelessWidget {
  const ChangingRatingBar({super.key, this.rating, this.onRatingUpdate});
  final String? rating;
  final void Function(double)? onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      unratedColor: ColorManager.gray,
      itemSize: ConfigSize.defaultSize! * 1.5,
      initialRating: double.parse(rating!) ?? 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: ColorManager.mainColor,
      ),
      onRatingUpdate: onRatingUpdate ?? (rating) {},
    );
  }
}
