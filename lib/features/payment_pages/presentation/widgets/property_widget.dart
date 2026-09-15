import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/constant/cached_image_widget.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({
    super.key,
    required this.propertyImageUrl,
    required this.propertyTitle,
    required this.propertyLocation,
    required this.rating,
  });

  final String propertyImageUrl;
  final String propertyTitle;
  final String propertyLocation;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 116.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.black, width: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 5.w),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12.r),
            child: propertyImageUrl.isNotEmpty
                ? CachedImageWidget(
                    imageUrl: propertyImageUrl,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 60.w,
                    height: 60.h,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
          ),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                propertyTitle,
                style: getMediumStyle(fontSize: 12.sp, color: AppColors.black),
              ),
              SizedBox(height: 10.h),
              Text(
                propertyLocation,
                style: getRegularStyle(fontSize: 8.sp, color: AppColors.grey),
              ),
              Row(
                children: [
                  Icon(Icons.star_border, color: AppColors.black),
                  Text(
                    "$rating",
                    style: getSmallStyle(
                      fontSize: 8.sp,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
