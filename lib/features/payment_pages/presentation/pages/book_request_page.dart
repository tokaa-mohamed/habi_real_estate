import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:real_estate/core/constant/custom_app_bar.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';
import 'package:real_estate/features/payment_pages/presentation/pages/booking_details_page.dart';

import 'package:real_estate/features/payment_pages/presentation/widgets/booking_details_widget.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/price_details_widget.dart';

import 'package:real_estate/features/payment_pages/presentation/widgets/property_widget.dart';

class BookRequestPage extends StatelessWidget {
  final int propertyId;
  final String propertyTitle;
  final String propertyImageUrl;
  final double propertyPrice;
  final String propertyLocation;
  final double rating;
  const BookRequestPage({
    super.key,
    required this.propertyId,
    required this.propertyTitle,
    required this.propertyImageUrl,
    required this.propertyPrice,
    required this.propertyLocation,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: "Book Request"),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              children: [
                PropertyWidget(
                  propertyImageUrl: propertyImageUrl,
                  propertyTitle: propertyTitle,
                  propertyLocation: propertyLocation,
                  rating: rating,
                ),
                BookingDetailsWidget(),
                PriceDetailsWidgets(propertyPrice: propertyPrice),
                Container(
                  width: double.infinity,
                  height: 160.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border(
                      bottom: BorderSide(color: AppColors.grey, width: 0.5),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),
                      Text(
                        "Cancellation Policy",
                        style: getMediumStyle(
                          fontSize: 15,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Free cancellation within 48 hours. If canceled before June 1, you will receive a partial refund. Read the Full Accommodation Policy for more details.",
                        style: getRegularStyle(
                          fontSize: 15,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingDetailsPage(
                    propertyId: propertyId,
                    propertyTitle: propertyTitle,
                    propertyImageUrl: propertyImageUrl,
                    propertyPrice: propertyPrice,
                    propertyLocation: propertyLocation,
                    rating: rating,
                  ),
                ),
              );
            },
            child: Container(
              width: 361.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12).r,
              ),
              child: Center(child: Text("Next: Review Data")),
            ),
          ),
        ],
      ),
    );
  }
}
