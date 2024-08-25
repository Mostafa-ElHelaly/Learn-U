import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';

class CourseContentTab extends StatelessWidget {
  CourseContentTab({Key? key, required this.courses}) : super(key: key);

  final SearchModel courses;
  final TextStyle labelstyle = TextStyle(
    fontSize: ConfigSize.defaultSize! * 1.5,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Course Content', style: labelstyle),
            SizedBox(
                height:
                    ConfigSize.defaultSize!), // Adding space between elements
            Row(
              children: [
                Text('3 Sections'),
                VerticalDivider(
                  indent: 3,
                  thickness: 30,
                  width: 30,
                  color: Colors.black,
                ),
                Text('${courses.lessonsCount} Lectures'),
                Text(
                    '${courses.courseLength} ${courses.courseLengthTime} Total Length'),
              ],
            ),
            SizedBox(
                height:
                    ConfigSize.defaultSize!), // Adding space between elements
            Expanded(
              child: Accordion(
                headerBackgroundColor: ColorManager.gray,
                contentBorderColor: ColorManager.gray,
                children: [
                  AccordionSection(
                    content: Text('Content for Section 1'),
                    header: Container(
                      height: ConfigSize.defaultSize! * 8,
                      child: Padding(
                        padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
                        child: ListTile(
                          title: Text('Intro'),
                          subtitle: Text('1 Lecture'),
                        ),
                      ),
                    ),
                  ),
                  AccordionSection(
                    content: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (courses.lessonsCount! - 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
                          child: Center(
                            child: Container(
                              width: ConfigSize.defaultSize! * 10,
                              child: Text('Lesson ${index + 1}'),
                            ),
                          ),
                        );
                      },
                    ),
                    header: Container(
                      height: ConfigSize.defaultSize! * 8,
                      child: Padding(
                        padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
                        child: ListTile(
                          title: Text('Course Content'),
                          subtitle:
                              Text('${courses.lessonsCount! - 2} Lectures'),
                        ),
                      ),
                    ),
                  ),
                  AccordionSection(
                    content: Text('Content for Section 3'),
                    header: Container(
                      height: ConfigSize.defaultSize! * 8,
                      child: Padding(
                        padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
                        child: ListTile(
                          title: Text('Outro'),
                          subtitle: Text('1 Lecture'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
