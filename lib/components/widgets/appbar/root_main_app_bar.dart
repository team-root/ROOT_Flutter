import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:root/components/root_images.dart';

import '../../../presentation/notification/ui/view/check_notification_screen.dart';

class RootMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RootMainAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Image.asset(
                  RootImages.rootLogo,
                  width: 72.w,
                  height: 31.h,
                ),
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
          ),
          centerTitle: true,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.h);
}
