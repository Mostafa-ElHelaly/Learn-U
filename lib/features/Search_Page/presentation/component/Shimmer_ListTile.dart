import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
        ),
        title: Container(
          color: Colors.white,
          height: 10,
          width: double.infinity,
        ),
        subtitle: Container(
          color: Colors.white,
          height: 10,
          width: double.infinity,
        ),
      ),
    );
  }
}
