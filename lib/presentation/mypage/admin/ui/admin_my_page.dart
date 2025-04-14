import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:root/components/widgets/appbar/root_app_bar.dart';
import 'package:root/components/widgets/root_layout.dart';

import '../../../../components/root_colors.dart';
import '../../../../components/root_images.dart';
import '../../../notification/ui/view/notification_management_screen.dart';
import '../../../user/login_screen.dart';

class AdminMyPage extends StatefulWidget {
  const AdminMyPage({super.key});

  @override
  State<AdminMyPage> createState() => _AdminMyPageState();
}

class _AdminMyPageState extends State<AdminMyPage> {
  @override
  Widget build(BuildContext context) {
    return RootLayout(
      appBar: const RootAppBar(title: '마이페이지'),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              '슨생님',
              style: TextStyle(
                color: RootColors.gray100,
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '교실 분리수거',
              style: TextStyle(
                color: RootColors.gray300,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 31.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const NotificationManagementScreen())
                );
              },
              child: Container(
                width: 353.w,
                height: 55.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: RootColors.gray550,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '알림 관리/생성 하기',
                      style: TextStyle(
                        color: const Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Image.asset(
                      RootImages.rightChevron,
                      width: 25.w,
                      height: 25.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                renderDialog();
              },
              child: Container(
                width: 353.w,
                height: 55.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: RootColors.gray550,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '로그아웃',
                      style: TextStyle(
                        color: RootColors.error100,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Image.asset(
                      RootImages.rightChevron,
                      width: 25.w,
                      height: 25.h,
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }

  renderDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: RootColors.gray700,
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '로그아웃',
                style: TextStyle(
                  color: RootColors.gray100,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '정말 로그아웃 하시겠습니까?',
                style: TextStyle(
                  color: RootColors.gray100,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(100.w, 32.h),
                  backgroundColor: RootColors.gray550,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  )),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                '취소',
                style: TextStyle(
                  color: RootColors.gray100,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(100.w, 32.h),
                  backgroundColor: RootColors.main100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  )),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: Text(
                '로그아웃',
                style: TextStyle(
                  color: RootColors.gray100,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
