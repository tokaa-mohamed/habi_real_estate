import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class TextOfUserDetailsWidget extends StatelessWidget {
  final String textuser;
  const TextOfUserDetailsWidget({super.key, required this.textuser});

  @override
  Widget build(BuildContext context) {
    return Text(
      textuser,
      style: getRegularStyle(fontSize: 12.sp, color: AppColors.grey),
    );
  }
}
