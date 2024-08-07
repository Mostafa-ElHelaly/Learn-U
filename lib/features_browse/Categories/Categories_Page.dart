import 'package:Learn_U/core/resource_manger/routs_manager.dart';
import 'package:Learn_U/features/home/presentation/component/view_all_page/view_all_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../core/resource_manger/color_manager.dart';
import '../../../../../core/resource_manger/locale_keys.g.dart';
import '../../../../../core/utils/config_size.dart';

class CategoriesPageBrowse extends StatefulWidget {
  const CategoriesPageBrowse({super.key});

  @override
  State<CategoriesPageBrowse> createState() => _CategoriesPageBrowseState();
}

class _CategoriesPageBrowseState extends State<CategoriesPageBrowse> {
  TextStyle viewallstyle = TextStyle(
    fontSize: ConfigSize.defaultSize! * 1.5,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringManager.categories,
          style: TextStyle(
              fontSize: ConfigSize.defaultSize! * 2.5,
              fontWeight: FontWeight.bold,
              color: ColorManager.black),
        ),
        centerTitle: true,
        backgroundColor: ColorManager.mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Engeneering',
                    style: TextStyle(
                        fontSize: ConfigSize.defaultSize! * 3,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const ViewAllPage(
                            category: 'Engeneering',
                          ),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: Text(
                        'view all',
                        style: viewallstyle,
                      ))
                ],
              ),
              SizedBox(height: ConfigSize.defaultSize! * 2),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
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
                                          'assets/images/test111.jpg'),
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
              SizedBox(height: ConfigSize.defaultSize! * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Programming',
                    style: TextStyle(
                        fontSize: ConfigSize.defaultSize! * 3,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const ViewAllPage(
                            category: 'Programming',
                          ),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: Text(
                        'view all',
                        style: viewallstyle,
                      ))
                ],
              ),
              SizedBox(height: ConfigSize.defaultSize! * 2),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
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
                                          'assets/images/test111.jpg'),
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
      ),
    );
  }
}
