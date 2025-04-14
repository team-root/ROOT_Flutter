import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:root/components/root_colors.dart';
import 'package:root/components/widgets/root_layout.dart';
import 'package:root/components/widgets/appbar/root_detail_app_bar.dart';

class CheckNotificationScreen extends StatefulWidget {
  const CheckNotificationScreen({super.key});

  @override
  State<CheckNotificationScreen> createState() => _CheckNotificationScreenState();
}

class _CheckNotificationScreenState extends State<CheckNotificationScreen> {
  final List<Map<String, dynamic>> alarms = [
    {
      "title": "환경 지킴이 활동",
      "content": "환경 지킴이 활동 짼 시키들 당장 내려와서 활동 진행하세요",
    },
    {
      "title": "신입생 2차 전형 면접 도우미들",
      "content": "금일 신입생 2차 전형 면접이 진행될 예정입니다.\n도우미 신청한 학생은 8시까지 학교에 도착해주세용.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return RootLayout(
      appBar: const RootDetailAppBar(title: '알림'),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 758.h,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        alarms[index]['title'],
                        style: TextStyle(
                          color: RootColors.gray100,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        alarms[index]['content'],
                        style: TextStyle(
                          color: RootColors.gray100,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Divider(
                        height: 1.h,
                        color: RootColors.gray500,
                      )
                    ],
                  );
                },
                itemCount: alarms.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
