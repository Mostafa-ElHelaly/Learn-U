import 'package:Learn_U/core/utils/methods.dart';
import 'package:Learn_U/core/widgets/Custom_Carsoul.dart';
import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:Learn_U/features/home/presentation/component/Widgets/Expandedcarousel.dart';
import 'package:Learn_U/features/home/presentation/component/Widgets/View_all_Categories_Widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../category/Presentation/Manager/categories_bloc/categories_bloc.dart';
import '../../../../category/Presentation/Manager/categories_bloc/categories_event.dart';
import '../../../../category/Presentation/Manager/categories_bloc/categories_state.dart';

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
  late PersistentTabController controller =
      PersistentTabController(initialIndex: 2);
  @override
  void initState() {
    BlocProvider.of<CategoriesDataBloc>(context).add(GetallCategoriesEvent());
    delayData();
    super.initState();
  }

  bool _isLoading = false;
  Future<void> delayData() async {
    await Future.delayed(Duration(seconds: 4)); // Simulate a network request
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    String code = Methods.instance.fetch_current_languagecode(context);

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
                            AppLocalizations.of(context)!.categories,
                            style: const TextStyle(
                                color: ColorManager.whiteColor,
                                fontSize: 25,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        ViewAllCategoriesWidget(
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
                          List<CategoriesModel> categories =
                              state.Categories.where(
                                      (element) => element.parent_id != null)
                                  .toList();
                          return Expandedcarousel(
                              categories: categories,
                              code: code,
                              isLoading: _isLoading);
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
