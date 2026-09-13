import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';
import 'package:real_estate/features/home/domain/entitties/property_entity.dart';

class ListingAgentWidget extends StatelessWidget {
  final PropertyEntity property;

  const ListingAgentWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final agentName = property.agentName ?? "Jenny Wilson";
    final agentRole = property.agentRole ?? "Property Owner";
    final agentImage = property.agentImage ?? 'https://i.imgur.com/8Km9tLL.jpg';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Listing Agent", style: getBoldStyle(fontSize: 16, color: AppColors.black)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(agentImage),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(agentName, style: getBoldStyle(fontSize: 14, color: AppColors.black)),
                    const SizedBox(height: 2),
                    Text(
                      agentRole,
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