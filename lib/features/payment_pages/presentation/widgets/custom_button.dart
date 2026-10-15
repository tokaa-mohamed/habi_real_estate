import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/features/payment_pages/presentation/pages/booking_details_page.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({
    super.key,
    required this.propertyId,
    required this.propertyTitle,
    required this.propertyImageUrl,
    required this.propertyPrice,
    required this.propertyLocation,
    required this.rating,
    required this.text,
  });

  final int propertyId;
  final String propertyTitle;
  final String propertyImageUrl;
  final double propertyPrice;
  final String propertyLocation;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        child: Center(child: Text(text)),
      ),
    );
  }
}
