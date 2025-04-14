import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:root/components/widgets/appbar/root_detail_app_bar.dart';
import 'package:root/components/widgets/root_layout.dart';
import 'package:root/presentation/notification/ui/widgets/custom_toggle_button.dart';
import 'package:root/presentation/notification/ui/widgets/notification_text.dart';
import 'package:root/presentation/notification/ui/widgets/notification_text_field.dart';
import 'package:root/presentation/notification/ui/widgets/root_notification_appbar.dart';

import '../../../../components/root_colors.dart';



class NotificationGenerationScreen extends StatelessWidget {
  const NotificationGenerationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RootLayout(
      appBar: const RootDetailAppBar(title: '알림생성'),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              renderHeight(text: '제목'),
              const NotificationTextField(hintText: '제목을 입력해 주세요',),
              renderHeight(text: '알림유형'),
              const CustomToggleButton(),
              renderHeight(text: '반복 요일'),
              const Text('토글토글', style: TextStyle(color: Colors.white),),
              renderHeight(text: '시간'),
              const Text('대충 드랍다운 버튼', style: TextStyle(color: Colors.white),),
              renderHeight(text: '내용'),
            ],
          ),
        ),
      ),
    );
  }

  renderHeight({required String text}) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        NotificationText(text: text),
        SizedBox(height: 13.h),
      ],
    );
  }
}
