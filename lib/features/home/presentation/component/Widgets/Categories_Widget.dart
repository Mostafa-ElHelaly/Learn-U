import 'package:flutter/material.dart';

import '../../../../../core/utils/config_size.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.text1, required this.image});

  final String text1;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConfigSize.defaultSize! * 15,
      width: ConfigSize.defaultSize! * 15,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high)),
      child: Column(
        children: [
          Center(
            child: Text(text1),
          ),
        ],
      ),
    );
  }
}
