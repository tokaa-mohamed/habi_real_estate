import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/constant/custom_app_bar.dart';
import 'package:real_estate/core/di.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/add_on_card.widget.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/property_widget.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/text_of_user_details_widget.dart';

import 'package:real_estate/features/profile_page/presentation/cubit/profile_page_cubit.dart';

class BookingDetailsPage extends StatefulWidget {
  final int propertyId;
  final String propertyTitle;
  final String propertyImageUrl;
  final double propertyPrice;
  final String propertyLocation;
  final double rating;
  const BookingDetailsPage({
    super.key,
    required this.propertyId,
    required this.propertyTitle,
    required this.propertyImageUrl,
    required this.propertyPrice,
    required this.propertyLocation,
    required this.rating,
  });

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  late double _currentTotal;
  bool _isTrashMoneySelected = false;

  @override
  void initState() {
    super.initState();
    // 2. Set the initial total to the base price passed from the previous screen
    _currentTotal = widget.propertyPrice;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilePageCubit>(
      create: (context) =>
          getIt<ProfilePageCubit>()..getDataOfUser(), // ✅ Correct
      child: Scaffold(
        appBar: CustomAppBar(title: "Booking Detail"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PropertyWidget(
                propertyImageUrl: widget.propertyImageUrl,
                propertyTitle: widget.propertyTitle,
                propertyLocation: widget.propertyLocation,
                rating: widget.rating,
              ),
              BlocBuilder<ProfilePageCubit, ProfilePageState>(
                builder: (BuildContext context, ProfilePageState state) {
                  if (state is ProfilePageLoadingState) {
                    return CircularProgressIndicator();
                  } else if (state is GetDataSuccessfulyState) {
                    final user = state.dataOfUser;
                    return Container(
                      width: double.infinity,
                      height: 240.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Resident Details",
                            style: getMediumStyle(
                              fontSize: 12.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          TextOfUserDetailsWidget(textuser: user.full_name),
                          SizedBox(height: 5.h),
                          TextOfUserDetailsWidget(textuser: user.email),
                          SizedBox(height: 5.h),
                          TextOfUserDetailsWidget(textuser: user.location),
                          SizedBox(height: 5.h),
                          Container(
                            width: 371.w,
                            height: 78.h,
                            decoration: BoxDecoration(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              "Original identification card (KTP/KITAS) and Marriage Certificate (for couples) are required at check-in.",
                              style: getRegularStyle(
                                fontSize: 10.sp,
                                color: AppColors.darkGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Text("There is an error here");
                },
              ),
              SizedBox(height: 5.h),
              AddOnCardWidget(
                icon: Icons.delete,
                title: "Trash Money",
                price: "Rp 30.000/month",
                // Change color if selected to give the user visual feedback!
                color: _isTrashMoneySelected
                    ? AppColors.primaryColor
                    : AppColors.grey,
                onTap: () {
                  // 3. Update the state inside setState so the UI rebuilds
                  setState(() {
                    _isTrashMoneySelected = !_isTrashMoneySelected;
                    if (_isTrashMoneySelected) {
                      _currentTotal += 30;
                    } else {
                      _currentTotal -= 30; // Remove it if they tap again
                    }
                  });
                },
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 361.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12).r,
                  ),
                  child: Center(child: Text("Next: Payment Details")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
