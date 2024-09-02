import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerColumn extends StatelessWidget {
  const ShimmerColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: ConfigSize.defaultSize! * 15,
                width: ConfigSize.defaultSize! * 15,
                color: Colors.white,
              ),
            ),
            SizedBox(height: ConfigSize.defaultSize! * 1),
            Container(
              height: ConfigSize.defaultSize! * 2,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
