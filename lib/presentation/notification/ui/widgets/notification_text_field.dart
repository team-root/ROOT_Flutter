import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:root/components/root_colors.dart';

class NotificationTextField extends StatelessWidget {
  final String hintText;

  const NotificationTextField({super.key, required this.hintText,});

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: RootColors.gray500,
          width: 2.0.w,
        )
    );

    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: TextStyle(
          color: RootColors.gray300,
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w500,
        ),
        // fillColor: INPUT_BG_COLOR,
        filled: true,
        fillColor: RootColors.gray550,
        //false-테두리 X, true-테두리 O
        border: baseBorder,
        //모든 Input 상태의 기본 스타일 세팅
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(
              // color: PRIMARY_COLOR,
            ),
        ),
      ),
    );
  }
}
