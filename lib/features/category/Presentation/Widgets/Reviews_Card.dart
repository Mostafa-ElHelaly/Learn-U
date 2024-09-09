import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/widgets/Custom_Rating_Bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReviewsCard extends StatelessWidget {
  ReviewsCard(
      {super.key,
      this.rating,
      this.user_first_name,
      this.user_last_name,
      this.review,
      this.updated_date});
  final double? rating;
  final String? user_first_name;
  final String? user_last_name;
  final String? review;
  final String? updated_date;

  get_name_initials(String name) {
    return name.substring(0, 1).toUpperCase();
  }

  format_review_date() {
    DateTime dateTime = DateTime.parse(updated_date!);
    DateFormat formatter = DateFormat('dd MMM yyyy');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  final TextStyle initialsstyle = TextStyle(
      fontSize: ConfigSize.defaultSize! * 2,
      fontWeight: FontWeight.bold,
      color: ColorManager.whiteColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ConfigSize.defaultSize! * 1),
        border: Border.all(
            color: ColorManager.gray, width: ConfigSize.defaultSize! * 0.07),
      ),
      width: ConfigSize.defaultSize! * 32,
      height: ConfigSize.defaultSize! * 30,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ConfigSize.defaultSize! * 1.5,
            vertical: ConfigSize.defaultSize! * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: ConfigSize.defaultSize! * 5,
                  height: ConfigSize.defaultSize! * 5,
                  decoration: BoxDecoration(
                    color: ColorManager.mainColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      get_name_initials(user_first_name!) +
                          get_name_initials(user_last_name!),
                      style: initialsstyle,
                    ),
                  ),
                ),
                SizedBox(width: ConfigSize.defaultSize! * 1),
                Column(
                  children: [
                    Text(
                      user_first_name! +
                          " " +
                          user_last_name!.substring(0, 1) +
                          ".",
                      style: initialsstyle.copyWith(
                          fontSize: ConfigSize.defaultSize! * 1.5,
                          color: ColorManager.mainColor),
                    ),
                    CustomRatingBar(
                      rating: (rating! / 2).toString(),
                    )
                  ],
                ),
                SizedBox(width: ConfigSize.defaultSize! * 2),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    format_review_date(),
                    style: TextStyle(color: ColorManager.gray),
                  ),
                )
              ],
            ),
            Divider(
              color: ColorManager.gray,
            ),
            Row(
              children: [
                Text(review!),
                // Text(rating.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
