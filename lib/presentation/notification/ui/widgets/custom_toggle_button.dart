import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:root/components/widgets/appbar/root_app_bar.dart';
import '../../../../components/root_colors.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({super.key});

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool isMetric = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildToggleButton('정기적', isMetric, true),
        SizedBox(width: 25.w),
        _buildToggleButton('단기적', !isMetric, false),
      ],
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, bool metricValue) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMetric = metricValue;
        });
      },
      child: Container(
        width: 159.w,
        height: 49.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? RootColors.main200 : RootColors.gray500,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? RootColors.main200 : RootColors.gray500,
            ),
          ),
        ),
      ),
    );
  }
}
