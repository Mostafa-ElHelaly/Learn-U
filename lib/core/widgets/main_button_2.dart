import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';

class MainButton2 extends StatelessWidget {
  final Function() onTap;
  final Color? color;
  final Color? textColor;
  final Widget? child;

  const MainButton2({
    super.key,
    required this.onTap,
    this.color,
    this.textColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: ConfigSize.screenWidth!,
        height: ConfigSize.defaultSize! * 5,
        decoration: BoxDecoration(
          color: color ?? ColorManager.kPrimaryBlueDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: child),
      ),
    );
  }
}
