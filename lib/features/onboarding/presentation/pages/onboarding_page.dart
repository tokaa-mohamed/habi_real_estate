import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/app_texts.dart';
import '../../../auth/presentation/widgets/primary_button.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': AppTexts.onboardingTitle1,
      'subtitle': AppTexts.onboardingSubtitle1,
      'image': AppAssets.onboardingImage,
    },
    {
      'title': 'Discover Properties in Top Locations',
      'subtitle': 'Explore thousands of listings with detailed photos and real-time updates',
      'image':
          'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=1000',
    },
    {
      'title': 'Connect Directly with Trusted Agents',
      'subtitle': 'Schedule visits and negotiate directly from the comfort of your phone',
      'image':
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=1000',
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      setState(() {
        _currentPage++;
      });
    } else {
      context.router.replace(const LoginRoute());
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = _onboardingData[_currentPage];

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: item['image']!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: AppColors.bordergrey,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.bordergrey,
                      child: const Icon(
                        Icons.apartment,
                        size: 64,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: getBoldStyle(
                            fontSize: 22.sp,
                            color: AppColors.darkColor,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          item['subtitle']!,
                          style: getRegularStyle(
                            fontSize: 13.sp,
                            color: AppColors.grey2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            _onboardingData.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: EdgeInsets.only(right: 6.w),
                              width: _currentPage == index ? 24.w : 12.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? AppColors.primaryColor
                                    : AppColors.bordergrey,
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: _previousPage,
                              borderRadius: BorderRadius.circular(20.r),
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                                ),
                                child: Icon(
                                  Icons.chevron_left_rounded,
                                  color: AppColors.primaryColor,
                                  size: 24.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            InkWell(
                              onTap: _nextPage,
                              borderRadius: BorderRadius.circular(20.r),
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor,
                                ),
                                child: Icon(
                                  Icons.chevron_right_rounded,
                                  color: AppColors.white,
                                  size: 24.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    PrimaryButton(
                      text: AppTexts.continueButton,
                      onPressed: () {
                        context.router.replace(const LoginRoute());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
