import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class PaymentMethodWidget extends StatelessWidget {
  final String selectedMethod;
  final IconData icon;
  final VoidCallback onTap;

  const PaymentMethodWidget({
    super.key,
    required this.selectedMethod,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Method",
          style: getBoldStyle(fontSize: 16.sp, color: Colors.black),
        ),
        SizedBox(height: 12.h),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.black, size: 24.sp),
                SizedBox(width: 12.w),
                Text(
                  selectedMethod,
                  style: getRegularStyle(fontSize: 14.sp, color: Colors.black),
                ),
                const Spacer(),
                Icon(Icons.chevron_right, color: Colors.black, size: 20.sp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
