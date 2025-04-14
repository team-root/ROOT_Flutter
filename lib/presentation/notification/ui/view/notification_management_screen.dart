import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:root/presentation/notification/ui/widgets/root_notification_appbar.dart';
import 'package:root/components/widgets/root_layout.dart';

import '../../../../components/root_colors.dart';

class NotificationManagementScreen extends StatefulWidget {
  const NotificationManagementScreen({super.key});

  @override
  State<NotificationManagementScreen> createState() =>
      _NotificationManagementScreenState();
}

class _NotificationManagementScreenState
    extends State<NotificationManagementScreen> {
  final List<Map<String, dynamic>> alarms = [
    {"title": "기상 알림", "time": "13:00", "isWeekly": '정기적', 'isOn': true},
    {"title": "WOW 알림", "time": "01:00", "isWeekly": '단기적', 'isOn': false},
  ];

  @override
  Widget build(BuildContext context) {
    return RootLayout(
      appBar: const RootNotificationAppBar(title: '알림관리'),
      child: ListView.separated(
        itemCount: alarms.length,
        itemBuilder: (context, index) {
          return _AlarmList(
            title: alarms[index]['title'].toString(),
            time: alarms[index]['time'].toString(),
            isWeekly: alarms[index]['isWeekly'].toString(),
            isOn: alarms[index]['isOn'],
            onToggle: (value) {
              setState(() {
                alarms[index]['isOn'] = value;
              });
            },
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: 20.h,
          color: RootColors.gray500,
        ),
      ),
    );
  }
}

class _AlarmList extends StatelessWidget {
  final String title;
  final String time;
  final String isWeekly;
  final bool isOn;
  final Function(bool) onToggle;

  const _AlarmList({
    super.key,
    required this.title,
    required this.time,
    required this.isWeekly,
    required this.isOn,
    required this.onToggle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xffFFFFFF),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Container(
                    width: 40.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: RootColors.main200,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Center(
                      child: Text(
                        isWeekly,
                        style: TextStyle(
                          color: RootColors.main200,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 9.h),
              Text(
                time,
                style: TextStyle(
                    color: const Color(0xffFFFFFF),
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          Switch(
            value: isOn,
            onChanged: onToggle,
            activeTrackColor: RootColors.main200,
            inactiveTrackColor: RootColors.gray500,
            thumbColor: MaterialStateProperty.all<Color>(const Color(0xff000000)),
          ),
        ],
      ),
    );
  }
}
