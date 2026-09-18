import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class ReceiptDetailRowWidget extends StatelessWidget {
  final String label;
  final String value;

  const ReceiptDetailRowWidget({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: getRegularStyle(
              fontSize: 12.sp,
              color: Colors.grey.shade500,
            ),
          ),
          Text(
            value,
            style: getMediumStyle(fontSize: 12.sp, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
