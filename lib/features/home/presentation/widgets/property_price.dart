import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class PropertyPriceSection extends StatelessWidget {
  final dynamic property;
  const PropertyPriceSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${property.price}',
          style: getBoldStyle(fontSize: 22, color: AppColors.darkColor),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.local_offer_outlined, size: 14, color: AppColors.primaryColor),
                    const SizedBox(width: 4),
                    Text(
                      property.status,
                      style: getBoldStyle(fontSize: 12, color: AppColors.black),
                    ),
                    const SizedBox(width: 16),
                    SvgPicture.asset(
                      'assets/icons/star-icon.svg',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}