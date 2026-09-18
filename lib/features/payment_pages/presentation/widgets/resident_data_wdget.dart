import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/text_of_user_details_widget.dart';
import 'package:real_estate/features/profile_page/presentation/cubit/profile_page_cubit.dart';

class ResidentDataWidget extends StatelessWidget {
  const ResidentDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageCubit, ProfilePageState>(
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
                bottom: BorderSide(color: AppColors.black, width: 0.5),
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
    );
  }
}
