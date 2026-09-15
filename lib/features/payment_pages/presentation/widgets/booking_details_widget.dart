import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/select_date_widget.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/select_number_of_person.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/text_title_style.dart';

class BookingDetailsWidget extends StatefulWidget {
  const BookingDetailsWidget({super.key});

  @override
  State<BookingDetailsWidget> createState() => _BookingDetailsWidgetState();
}

class _BookingDetailsWidgetState extends State<BookingDetailsWidget> {
  int? _numberOfGuests = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.black, width: 0.5),
          bottom: BorderSide(color: AppColors.black, width: 0.5),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Booking Detail",
                style: getMediumStyle(fontSize: 12.sp, color: AppColors.black),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          TextTitleWidget(title: "Book Appointment"),
          SizedBox(height: 10.h),
          Padding(padding: EdgeInsets.all(8.0.sp), child: SelectDateWidget()),
          SizedBox(height: 5.h),
          TextTitleWidget(title: "Person"),
          SizedBox(height: 2.h),
          GuestSelectionWidget(
            currentGuests: _numberOfGuests!,
            onGuestsChanged: (newGuestCount) {
              setState(() {
                _numberOfGuests = newGuestCount;
              });
            },
          ),
        ],
      ),
    );
  }
}
