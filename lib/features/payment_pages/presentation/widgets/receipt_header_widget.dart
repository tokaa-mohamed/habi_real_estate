import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class ReceiptHeaderWidget extends StatelessWidget {
  final double totalAmount;

  const ReceiptHeaderWidget({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check_circle, color: Colors.green, size: 48.sp),
        ),
        SizedBox(height: 16.h),
        Text(
          "\$${totalAmount.toStringAsFixed(3)}",
          style: getBoldStyle(fontSize: 28.sp, color: Colors.black),
        ),
        SizedBox(height: 8.h),
        Text(
          "Payment Successful!",
          style: getMediumStyle(fontSize: 14.sp, color: Colors.black),
        ),
      ],
    );
  }
}
