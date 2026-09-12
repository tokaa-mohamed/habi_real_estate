import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/constant/custom_toast.dart';
import 'package:real_estate/core/di.dart';
import 'package:real_estate/features/profile_page/presentation/cubit/profile_page_cubit.dart';
import 'package:real_estate/features/profile_page/presentation/widgets/header_widget.dart';
import 'package:real_estate/features/profile_page/presentation/widgets/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilePageCubit>(
      create: (context) => getIt<ProfilePageCubit>()..getProfileDataUsecase,

      child: Scaffold(
        body: BlocConsumer(
          builder: (BuildContext context, state) {
            if (state is ProfilePageLoadingState) {
              return CircularProgressIndicator();
            } else if (state is GetDataSuccessfulyState) {
              final userData = state.dataOfUser;
              String name = userData.full_name;
              String location = userData.location;
              String avatarUrl = userData.avatar_url;
              return Column(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: HeaderWidget(
                          name: name,
                          location: location,
                          avatarUrl: avatarUrl,
                        ),
                      ),
                      SliverFillRemaining(
                        child: // 2. The Settings Card (White background, rounded corners)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(32.r),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 32.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionTitle('Account Setting'),
                              ProfileMenuItem(
                                icon: Icons.person_outline,
                                title: 'Personal Information',
                                onTap: () {},
                              ),
                              ProfileMenuItem(
                                icon: Icons.manage_accounts_outlined,
                                title: 'My Account',
                                onTap: () {},
                              ),

                              SizedBox(height: 24.h),
                              _buildSectionTitle('Payment'),
                              ProfileMenuItem(
                                icon: Icons.credit_card_outlined,
                                title: 'Payment Method',
                                onTap: () {},
                              ),

                              SizedBox(height: 24.h),
                              _buildSectionTitle('Setting & Security'),
                              ProfileMenuItem(
                                icon: Icons.lock_outline,
                                title: 'Change Password',
                                onTap: () {},
                              ),
                              ProfileMenuItem(
                                icon: Icons.notifications_none_outlined,
                                title: 'Notification Preference',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
          listener: (BuildContext context, state) {
            if (state is FailGetDataState) {
              CustomToast.showWarning(state.errorMessege);
            }
          },
        ),
      ),
    );
  }
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.grey.shade600,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
