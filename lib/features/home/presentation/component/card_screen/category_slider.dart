import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';

class CategoryScreen extends StatelessWidget {
  final String text1;
  final String image;

  const CategoryScreen(
      {super.key,
      required this.text1,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ConfigSize.defaultSize! * 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,

        children: [
          Image.asset(image),
          SizedBox(
            height: ConfigSize.defaultSize! * 1,
          ),
          Container(width: ConfigSize.screenWidth,
            height: ConfigSize.defaultSize! * 2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Text(
              textAlign: TextAlign.center,
              text1,
              style: TextStyle(

                  color: ColorManager.whiteColor,
                  fontSize: ConfigSize.defaultSize! * 2,
                  fontWeight: FontWeight.bold),
            ),
          ),

        ],
      ),
    );
  }
}
