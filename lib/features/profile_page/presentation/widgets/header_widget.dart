import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String location;
  final String avatarUrl;

  const HeaderWidget({
    super.key,
    required this.name,
    required this.location,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h, 
            child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 160.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.teal.shade700, 
                            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
          ),

          Positioned(
            top: 100.h,
                        left: 24.w,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4.w), 
                
              ),
              child: CircleAvatar(
                radius: 45.r,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: avatarUrl.isNotEmpty
                    ? NetworkImage(avatarUrl) as ImageProvider
                    : const AssetImage('assets/images/default_avatar.png'), 
                    
                onBackgroundImageError: (exception, stackTrace) {
                },
              ),
            ),
          ),

          // 3. زرار التعديل (Edit Icon)
          Positioned(
            top: 175.h,
            right: 24.w,
            child: IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.edit_outlined, color: Colors.teal, size: 26.sp),
            ),
          ),

          Positioned(
            top: 175.h,
            left: 135.w, 
                        right: 70.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getMediumStyle(fontSize: 18.sp, color: Colors.black),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 14.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getRegularStyle(fontSize: 14.sp, color: Colors.grey.shade600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}