import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_state.dart';
import 'package:Learn_U/features/home/presentation/component/view_all_page/view_all_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../core/resource_manger/color_manager.dart';
import '../../../../../core/resource_manger/locale_keys.g.dart';
import '../../../../../core/utils/config_size.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  TextStyle viewallstyle = TextStyle(
    fontSize: ConfigSize.defaultSize! * 1.5,
    fontWeight: FontWeight.bold,
  );
  @override
  void initState() {
    // BlocProvider.of<CategoriesDataBloc>(context).add(GetallCategoriesEvent());
    super.initState();
  }

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
              SizedBox(height: ConfigSize.defaultSize! * 2),
              BlocBuilder<CategoriesDataBloc, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesSuccessState) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
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
                            padding:
                                EdgeInsets.all(ConfigSize.defaultSize! * 1),
                            child: Column(
                              children: [
                                Text("state.Categories[index].name.toString()"),
                                SizedBox(height: ConfigSize.defaultSize! * 2),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      ConfigSize.defaultSize! * 1),
                                  child: Container(
                                    height: ConfigSize.defaultSize! * 15,
                                    width: ConfigSize.defaultSize! * 15,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Group 8@1x.png'),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                                SizedBox(height: ConfigSize.defaultSize! * 1),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                    );
                  }
                  if (state is CategoriesErrorState) {
                    return Text('error');
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.mainColor,
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
