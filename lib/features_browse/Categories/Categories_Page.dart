import 'package:Learn_U/core/utils/constant_image_url.dart';
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
  TextStyle labelstyle = TextStyle(
    fontSize: ConfigSize.defaultSize! * 1.5,
    fontWeight: FontWeight.bold,
    color: ColorManager.whiteColor,
  );
  TextStyle descstyle = TextStyle(
    fontSize: ConfigSize.defaultSize! * 1.5,
    fontWeight: FontWeight.w200,
    color: ColorManager.whiteColor,
  );
  @override
  void initState() {
    BlocProvider.of<CategoriesDataBloc>(context).add(GetallCategoriesEvent());
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
          padding: EdgeInsets.all(ConfigSize.defaultSize! * 0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ConfigSize.defaultSize! * 2),
              BlocBuilder<CategoriesDataBloc, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesSuccessState) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.Categories.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio:
                            1 / 1.75, // Adjusted ratio for taller cards
                        crossAxisCount: 2,
                        crossAxisSpacing: ConfigSize.defaultSize! * 0.5,
                        mainAxisSpacing: ConfigSize.defaultSize! * 0.5,
                      ), // Adjust spacing if needed
                      itemBuilder: (context, index) {
                        return Container(
                          child: Card(
                            color: ColorManager.black.withOpacity(0.95),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              ConfigSize.defaultSize! * 1),
                                          child: Container(
                                            height: ConfigSize.defaultSize! *
                                                20, // Increased height
                                            width: double
                                                .infinity, // Make width fill the container
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    ConstantImageUrl
                                                            .constantimageurl +
                                                        state.Categories[index]
                                                            .thumbnail
                                                            .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                ColorManager.black,
                                                ColorManager.black
                                                    .withOpacity(0.25)
                                              ],
                                            ),
                                          ),
                                          padding: EdgeInsets.all(
                                              ConfigSize.defaultSize! * 1),
                                          child: Text(
                                            state.Categories[index].name
                                                .toString(),
                                            style: labelstyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        ConfigSize.defaultSize! * 1),
                                    child: Text(
                                      state.Categories[index].desc.toString(),
                                      style: descstyle,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if (state is CategoriesErrorState) {
                    return Text(state.errorMessage);
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
