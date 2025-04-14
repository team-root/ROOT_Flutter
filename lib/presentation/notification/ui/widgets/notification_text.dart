import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/root_colors.dart';

class NotificationText extends StatelessWidget {
  final String text;

  const NotificationText({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: RootColors.gray100,
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
