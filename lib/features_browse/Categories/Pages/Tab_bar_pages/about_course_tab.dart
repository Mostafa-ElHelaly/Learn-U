import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:flutter/material.dart';

class AboutCourseTab extends StatelessWidget {
  AboutCourseTab({super.key, required this.courses});
  final SearchModel courses;

  TextStyle labelstyle = TextStyle(
      fontSize: ConfigSize.defaultSize! * 2, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text(courses.desc.toString())),
        SizedBox(height: ConfigSize.defaultSize! * 2),
        Text(
          'What Will You Learn',
          style: labelstyle,
        ),
        SizedBox(height: ConfigSize.defaultSize! * 5),
        Text(
          'This Course Includes',
          style: labelstyle,
        ),
        ListTile(
          leading: Icon(Icons.library_books_outlined),
          title: Text(courses.lessonsCount.toString() + ' Lectures'),
        ),
        ListTile(
          leading: Icon(Icons.watch_later_rounded),
          title: Text(courses.courseLength.toString() +
              courses.courseLengthTime.toString() +
              ' on demand videos'),
        ),
        ListTile(
          leading: Icon(Icons.file_download_outlined),
          title: Text('0 downloadable resources'),
        ),
        Text(
          'Required Skills',
          style: labelstyle,
        ),
        Text(
          'Who Should Take This Course',
          style: labelstyle,
        ),
      ],
    );
  }
}
