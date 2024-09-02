import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Card(),
        baseColor: ColorManager.black.withOpacity(0.5),
        highlightColor: ColorManager.black.withOpacity(0.1));
  }
}
