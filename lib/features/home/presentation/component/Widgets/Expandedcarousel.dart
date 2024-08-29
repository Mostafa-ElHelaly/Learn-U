import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/utils/constant_image_url.dart';
import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:Learn_U/features/home/presentation/component/Widgets/Shimmer_Container.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Expandedcarousel extends StatefulWidget {
  const Expandedcarousel(
      {super.key,
      required this.categories,
      required this.code,
      required this.isLoading});
  final List<CategoriesModel> categories;
  final String code;
  final bool isLoading;

  @override
  State<Expandedcarousel> createState() => _ExpandedcarouselState();
}

class _ExpandedcarouselState extends State<Expandedcarousel> {
  @override
  Widget build(BuildContext context) {
    double carouselHeight = ConfigSize.defaultSize! * 25;

    return Expanded(
      child: CarouselSlider.builder(
        itemCount: 4,
        itemBuilder: (context, index, realIndex) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: widget.isLoading == true
                ? Column(
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
                                ConstantImageUrl.constantimageurl +
                                    widget.categories[index].thumbnail
                                        .toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: ConfigSize.defaultSize! * 0.5),
                      Container(
                        height: ConfigSize.defaultSize! * 2,
                        child: Text(
                          widget.code == 'ar'
                              ? widget.categories[index].nameAr.toString()
                              : widget.categories[index].name.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ConfigSize.defaultSize! * 1.5),
                        ),
                      ),
                    ],
                  )
                : ShimmerColumn(),
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
  }
}
