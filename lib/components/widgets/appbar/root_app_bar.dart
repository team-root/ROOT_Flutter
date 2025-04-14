import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:root/components/root_images.dart';

import '../../../presentation/notification/ui/view/check_notification_screen.dart';
import '../../root_colors.dart';

class RootAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const RootAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            title,
            style: TextStyle(
              color: RootColors.gray100,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const CheckNotificationScreen(),
                  ),
                );
              },
              icon: Image.asset(
                RootImages.bell,
                width: 25.w,
                height: 25.h,
              ),
            ),
          ],
          centerTitle: true,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
