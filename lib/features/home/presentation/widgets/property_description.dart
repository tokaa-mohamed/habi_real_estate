import 'package:flutter/material.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class PropertyDescriptionSection extends StatelessWidget {
  final dynamic property;
  const PropertyDescriptionSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description", style: getBoldStyle(fontSize: 18, color: AppColors.darkColor)),
        const SizedBox(height: 8),
        Text(
          property.description,
          style: TextStyle(
            color: AppColors.secondaryColor.withOpacity(0.52),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}