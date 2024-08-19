import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../core/resource_manger/color_manager.dart';
import '../../../../../core/utils/config_size.dart';

class ViewAllPage extends StatefulWidget {
  const ViewAllPage({super.key, required this.category});
  final String category;

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.category,
                    style: TextStyle(
                        fontSize: ConfigSize.defaultSize! * 3,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: ConfigSize.defaultSize! * 2),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3,
                    crossAxisCount: 2,
                    crossAxisSpacing: ConfigSize.defaultSize! * 2,
                    mainAxisSpacing: ConfigSize.defaultSize! * 2),
                itemBuilder: (context, index) {
                  return Card(
                    color: ColorManager.mainColor,
                    child: Padding(
                      padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
                      child: Column(
                        children: [
                          Text('Course $index'),
                          SizedBox(height: ConfigSize.defaultSize! * 2),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                ConfigSize.defaultSize! * 1),
                            child: Container(
                              height: ConfigSize.defaultSize! * 15,
                              width: ConfigSize.defaultSize! * 15,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Group 8@1x.png'),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          SizedBox(height: ConfigSize.defaultSize! * 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('2h'),
                              Text('Level'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
