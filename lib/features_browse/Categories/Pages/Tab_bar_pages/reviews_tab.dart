import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReviewsTabBrowse extends StatelessWidget {
  ReviewsTabBrowse({super.key});
  TextStyle labelstyle = TextStyle(
      fontSize: ConfigSize.defaultSize! * 2, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
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
                Text('0 ' + AppLocalizations.of(context)!.courserating,
                    style: labelstyle),
              ],
            ),
            SizedBox(height: ConfigSize.defaultSize! * 1),
            Text('0 ' + AppLocalizations.of(context)!.reviews),
            SizedBox(height: ConfigSize.defaultSize! * 5),
            Text(AppLocalizations.of(context)!.courserating),
          ],
        ),
      ),
    );
  }
}
