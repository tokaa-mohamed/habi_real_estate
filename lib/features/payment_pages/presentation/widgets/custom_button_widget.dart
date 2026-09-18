import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 361.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: Center(child: Text("Next: Payment Details")),
      ),
    );
  }
}
