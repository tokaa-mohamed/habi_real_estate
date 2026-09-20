import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 361.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
