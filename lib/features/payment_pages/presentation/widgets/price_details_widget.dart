import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/text_title_style.dart';

class PriceDetailsWidgets extends StatelessWidget {
  const PriceDetailsWidgets({super.key, required this.propertyPrice});

  final double propertyPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.black, width: 0.5)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Price Details",
                style: getMediumStyle(fontSize: 12.sp, color: AppColors.black),
              ),
              SizedBox(height: 5.h),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextTitleWidget(title: "House price"),
              Text(
                "$propertyPrice",
                style: getRegularStyle(fontSize: 12.sp, color: AppColors.grey),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextTitleWidget(title: "HabiSpace service fee"),
              Text(
                "${0.01 * propertyPrice}",
                style: getRegularStyle(fontSize: 12.sp, color: AppColors.grey),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            "______________________________________________________________",
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: getMediumStyle(fontSize: 12, color: AppColors.black),
              ),
              Text(
                "${propertyPrice + (0.01 * propertyPrice)}",
                style: getMediumStyle(fontSize: 12.sp, color: AppColors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
