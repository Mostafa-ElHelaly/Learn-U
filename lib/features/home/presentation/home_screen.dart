import 'package:Learn_U/features/cart/presentation/cart_screen.dart';
import 'package:Learn_U/features/home/presentation/component/Widgets/Categories_Widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'component/Widgets/Courses_Widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final items = [
    "assets/images/bg@2x.png",
    "assets/images/bg2.png",
  ];

  int currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ConfigSize.defaultSize! * 2,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: ConfigSize.defaultSize! * 2,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndexPage = index;
                          });
                        },
                        height: ConfigSize.defaultSize! * 20,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeFactor: 0.3,
                      ),
                      items: items.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: ConfigSize.screenWidth!,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(i), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: ConfigSize.defaultSize! * 1,
                    ),
                    DotsIndicator(
                      dotsCount: items.length,
                      position: currentIndexPage,
                      decorator: const DotsDecorator(
                          activeColor: ColorManager.kPrimaryBlueDark),
                      onTap: (index) {},
                    ),
                    SizedBox(
                      height: ConfigSize.defaultSize! * 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringManager.latestCourses.tr(),
                          style: const TextStyle(
                              color: ColorManager.kPrimaryBlueDark,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const HomeScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ConfigSize.defaultSize! * 1),
                            child: Text(
                              StringManager.viewAll.tr(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ConfigSize.defaultSize! * 1,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const LatestCoursesWidget(
                            courseName: 'Cooling Load Estimation Using HAP 5.1',
                            image: "assets/images/test111.jpg",
                            courseHours: '(2H)',
                            courseLevel: 'Mid',
                          ),
                          SizedBox(
                            width: ConfigSize.defaultSize! * 1,
                          ),
                          const LatestCoursesWidget(
                            courseName: 'Cooling Load Estimation Using HAP 5.1',
                            image: "assets/images/test111.jpg",
                            courseHours: '(2H)',
                            courseLevel: 'Mid',
                          ),
                          SizedBox(
                            width: ConfigSize.defaultSize! * 1,
                          ),
                          const LatestCoursesWidget(
                            courseName: 'Cooling Load Estimation Using HAP 5.1',
                            image: "assets/images/test111.jpg",
                            courseHours: '(2H)',
                            courseLevel: 'Mid',
                          ),
                          SizedBox(
                            width: ConfigSize.defaultSize! * 1,
                          ),
                          const LatestCoursesWidget(
                            courseName: 'Cooling Load Estimation Using HAP 5.1',
                            image: "assets/images/test111.jpg",
                            courseHours: '(2H)',
                            courseLevel: 'Mid',
                          ),
                          SizedBox(
                            width: ConfigSize.defaultSize! * 1,
                          ),
                          const LatestCoursesWidget(
                            courseName: 'Cooling Load Estimation Using HAP 5.1',
                            image: "assets/images/test111.jpg",
                            courseHours: '(2H)',
                            courseLevel: 'Mid',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ConfigSize.defaultSize! * 3,
                    ),
                  ],
                ),
              ),
              Container(
                width: ConfigSize.screenWidth,
                height: ConfigSize.defaultSize! * 22,
                decoration:
                    const BoxDecoration(color: ColorManager.kPrimaryBlueDark),
                child: Column(
                  children: [
                    SizedBox(
                      height: ConfigSize.defaultSize! * 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ConfigSize.defaultSize! * 2),
                          child: Text(
                            StringManager.category.tr(),
                            style: const TextStyle(
                                color: ColorManager.whiteColor,
                                fontSize: 25,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const Cart(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ConfigSize.defaultSize! * 1),
                            child: Text(
                              StringManager.viewAll.tr(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ConfigSize.defaultSize! * 2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ConfigSize.defaultSize! * 2),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const CategoryWidget(
                              text1: 'Programming',
                              image: "assets/images/test111.jpg",
                            ),
                            SizedBox(
                              width: ConfigSize.defaultSize! * 3,
                            ),
                            const CategoryWidget(
                              text1: 'Engineering',
                              image: "assets/images/test111.jpg",
                            ),
                            SizedBox(
                              width: ConfigSize.defaultSize! * 3,
                            ),
                            const CategoryWidget(
                              text1: 'Personal Development',
                              image: "assets/images/test111.jpg",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
