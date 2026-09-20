import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Icon(icon, size: 24.sp, color: AppColors.black),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: getRegularStyle(fontSize: 15.sp, color: AppColors.black),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}
