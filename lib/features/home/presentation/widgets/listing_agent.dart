import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class ListingAgentWidget extends StatelessWidget {
  const ListingAgentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Listing Agent", style: getBoldStyle(fontSize: 16, color: AppColors.black)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage('https://i.imgur.com/8Km9tLL.jpg'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jenny Wilson", style: getBoldStyle(fontSize: 14, color: AppColors.black)),
                    const SizedBox(height: 2),
                    Text(
                      "Owner Sunnyslade House",
                      style: TextStyle(color: AppColors.secondaryColor.withOpacity(0.5), fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.lightPrimaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset('assets/icons/call-icon.svg', width: 24, height: 24),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.lightPrimaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset('assets/icons/fluent-chat.svg', width: 24, height: 24),
              ),
            ],
          ),
        ),
      ],
    );
  }
}