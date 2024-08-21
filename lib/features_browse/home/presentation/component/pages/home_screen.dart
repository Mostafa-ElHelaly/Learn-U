import 'package:Learn_U/core/utils/constant_image_url.dart';
import 'package:Learn_U/core/widgets/Custom_Carsoul.dart';
import 'package:Learn_U/features/cart/presentation/cart_screen.dart';
import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_state.dart';
import 'package:Learn_U/features_browse/home/presentation/component/Widgets/View_all_Categories_Widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../features/category/Presentation/Manager/categories_bloc/categories_bloc.dart';
import '../../../../../features/category/Presentation/Manager/categories_bloc/categories_event.dart';
import '../../../../../main_screen_browse.dart';
import '../../../../Categories/Pages/Categories_Page.dart';

class HomeScreenBrowse extends StatefulWidget {
  const HomeScreenBrowse({super.key});

  @override
  State<HomeScreenBrowse> createState() => _HomeScreenBrowseState();
}

class _HomeScreenBrowseState extends State<HomeScreenBrowse> {
  final items = [
    "assets/images/bg@2x.png",
    "assets/images/bg2.png",
  ];

  int currentIndexPage = 0;
  @override
  void initState() {
    BlocProvider.of<CategoriesDataBloc>(context).add(GetallCategoriesEvent());

    super.initState();
  }

  GlobalKey<NavigatorState> navBarKey = GlobalKey<NavigatorState>();
  late PersistentTabController controller =
      PersistentTabController(initialIndex: 2);

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
                    CustomCarsoul(
                      items: items,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndexPage = index;
                        });
                      },
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
                  ],
                ),
              ),
              Container(
                width: ConfigSize.screenWidth,
                height: ConfigSize.defaultSize! * 25,
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
                        ViewAllCategoriesWidgetBrowse(
                          controller: controller,
                        )
                      ],
                    ),
                    SizedBox(height: ConfigSize.defaultSize! * 1),
                    BlocBuilder<CategoriesDataBloc, CategoriesState>(
                      builder: (context, state) {
                        if (state is CategoriesErrorState) {
                          return Text(state.errorMessage);
                        }
                        if (state is CategoriesSuccessState) {
                          double carouselHeight = ConfigSize.defaultSize! * 25;
                          return // Example dynamic height
                              Expanded(
                            child: CarouselSlider.builder(
                              itemCount: 4,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          height: carouselHeight *
                                              0.6, // Adjust height relative to the parent
                                          width: carouselHeight * 0.6,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                ConstantImageUrl
                                                        .constantimageurl +
                                                    state.Categories[index]
                                                        .thumbnail
                                                        .toString(),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              ConfigSize.defaultSize! * 0.5),
                                      Text(
                                        state.Categories[index].name.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                ConfigSize.defaultSize! * 2),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                autoPlay: true,
                                viewportFraction: 0.5,
                                enlargeCenterPage: true,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlayAnimationDuration: Duration(seconds: 1),
                                height: carouselHeight,
                              ),
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: ColorManager.mainColor,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ConfigSize.defaultSize! * 2,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: ConfigSize.defaultSize! * 2,
                    ),
                    CustomCarsoul(
                      items: items,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndexPage = index;
                        });
                      },
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
