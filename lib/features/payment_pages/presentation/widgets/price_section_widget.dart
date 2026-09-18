import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class PriceBreakdownWidget extends StatelessWidget {
  final double basePrice;
  final double serviceFee;
  final double total;

  const PriceBreakdownWidget({
    super.key,
    required this.basePrice,
    required this.serviceFee,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price details",
          style: getBoldStyle(fontSize: 16.sp, color: Colors.black),
        ),
        SizedBox(height: 16.h),
        _buildPriceRow(
          "House Prices",
          "\$${basePrice.toStringAsFixed(0)}",
          isBold: false,
        ),
        SizedBox(height: 12.h),
        _buildPriceRow(
          "HabiSpace service fee",
          "\$${serviceFee.toStringAsFixed(0)}",
          isBold: false,
        ),
        SizedBox(height: 16.h),
        Divider(color: Colors.grey.shade200, thickness: 1.h),
        SizedBox(height: 16.h),
        _buildPriceRow("Total", "\$${total.toStringAsFixed(0)}", isBold: true),
      ],
    );
  }

  Widget _buildPriceRow(String title, String amount, {required bool isBold}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: isBold
              ? getBoldStyle(fontSize: 14.sp, color: Colors.black)
              : getRegularStyle(fontSize: 14.sp, color: Colors.black),
        ),
        Text(
          amount,
          style: isBold
              ? getBoldStyle(fontSize: 16.sp, color: Colors.black)
              : getRegularStyle(fontSize: 14.sp, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
