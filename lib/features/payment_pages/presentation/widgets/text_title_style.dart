import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class TextTitleWidget extends StatelessWidget {
  final String title;
  const TextTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: getRegularStyle(fontSize: 15.sp, color: AppColors.black),
        ),
      ],
    );
  }
}
