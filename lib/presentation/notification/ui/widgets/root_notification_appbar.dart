import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:root/components/root_images.dart';

import '../../../../components/root_colors.dart';
import '../view/notification_generation_screen.dart';

class RootNotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const RootNotificationAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            icon: Image.asset(
              RootImages.backIcon,
              width: 25.w,
              height: 25.h,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: RootColors.gray100,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => const NotificationGenerationScreen()),
                );
              },
              icon: Image.asset(
                RootImages.plus,
                width: 25.w,
                height: 25.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.h);
}
