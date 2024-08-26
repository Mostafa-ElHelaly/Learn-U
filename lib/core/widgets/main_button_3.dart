import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';

class MainButton3 extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Color? color;
  final Color? textColor;

  const MainButton3({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: ConfigSize.defaultSize! * 5,
        decoration: BoxDecoration(
          color: color ?? ColorManager.kPrimaryBlueDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor ?? ColorManager.black,
              fontWeight: FontWeight.w600,
              fontSize: ConfigSize.defaultSize! * 1.7,
            ),
          ),
        ),
      ),
    );
  }
}
