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
    return Stack(
      children: [
        Container(
          height: 180.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15).r,
              topRight: Radius.circular(15).r,
            ),
          ),
          child: Image.asset("", fit: BoxFit.contain),
        ),
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Positioned(
            top: 130.h,
            left: 30.w,
            child: CircleAvatar(
              radius: 50.r,
              backgroundImage: NetworkImage("$avatarUrl"),
            ),
          ),
        ),
        Positioned(
          top: 195.h,
          right: 24.w,
          child: IconButton(
            onPressed: () {
              // Navigate to edit profile or trigger edit mode
            },
            icon: Icon(Icons.edit_outlined, color: Colors.teal, size: 28.sp),
          ),
        ),
        Positioned(
          top: 160.h,
          left: 30.w,
          child: Text(
            name,
            style: getMediumStyle(fontSize: 20.sp, color: Colors.black),
          ),
        ),
        SizedBox(height: 10.h),
        Positioned(
          top: 180.h,
          left: 30.w,
          child: Text(
            location,
            style: getRegularStyle(fontSize: 20.sp, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
