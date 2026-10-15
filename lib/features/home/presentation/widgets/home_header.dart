import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_fonts.dart';
import 'package:real_estate/core/utils/app_styles.dart';
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
return Row(
  children: [
    Image.asset(
  
    'assets/icons/location-png-icon.png',
  width: 20,
  height: 20,
)     ,

const SizedBox(width: 10),
     Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             Text("Location", style: getRegularStyle(fontSize: AppFonts.bodySmall, color: AppColors.black.withOpacity(0.44))), // مستخدم من الـ core

                const SizedBox(width: 7),
                Text("Los Angeles, California", style: getBoldStyle(fontSize: AppFonts.bodyLarge, color: AppColors.darkColor)),
          ],
        ),

     const SizedBox(width: 50),
        Row(
          children: [
SvgPicture.asset(
  
    'assets/icons/notification.svg',
  width: 20,
  height: 20,
)     ,
            const SizedBox(width: 12),
SvgPicture.asset(
  
    'assets/icons/fluent-chat.svg',
  width: 20,
  height: 20,
)     ,
          ],
        ),
      ],
    ),

  ],
);

  }
}