import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/utils/methods.dart';
import 'package:Learn_U/core/widgets/Changing_Rating_Bar.dart';
import 'package:Learn_U/features/category/data/model/reviews_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.rating});
  final String rating;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ChangingRatingBar(
        rating: rating,
      ),
    );
  }
}
