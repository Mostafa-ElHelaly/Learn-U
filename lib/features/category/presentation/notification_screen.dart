import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';

import 'widgets/notification_item.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: ConfigSize.defaultSize!,
            ),
            Center(
              child: Text(
                StringManager.notifications.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ConfigSize.defaultSize! * 2,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
                child: ListView.separated(
                  itemBuilder: (context, index) => const NotificationItem(),
                  separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: ConfigSize.defaultSize! * 2,
                    ),
                    child: Container(
                      width: ConfigSize.screenHeight!,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  itemCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
