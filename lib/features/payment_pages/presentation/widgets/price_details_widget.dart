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
        border: Border(bottom: BorderSide(color: AppColors.grey, width: 0.5)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Price Details",
                style: getMediumStyle(fontSize: 15.sp, color: AppColors.black),
              ),
              SizedBox(height: 10.h),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextTitleWidget(title: "House price"),
              Text(
                "$propertyPrice",
                style: getRegularStyle(fontSize: 15.sp, color: AppColors.grey),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextTitleWidget(title: "HabiSpace service fee"),
              Text(
                "${0.01 * propertyPrice}",
                style: getRegularStyle(fontSize: 15.sp, color: AppColors.grey),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text("________________________________________"),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: getMediumStyle(fontSize: 15.sp, color: AppColors.black),
              ),
              Text(
                "${propertyPrice + (0.01 * propertyPrice)}",
                style: getMediumStyle(fontSize: 15.sp, color: AppColors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
