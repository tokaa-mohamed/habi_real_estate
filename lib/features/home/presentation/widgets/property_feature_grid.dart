import 'package:flutter/material.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class PropertyFeaturesGrid extends StatelessWidget {
  final dynamic property;
  const PropertyFeaturesGrid({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 2.2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        _buildFeatureItem(Icons.king_bed_outlined, "${property.bedrooms} Bedrooms"),
        _buildFeatureItem(Icons.bathtub_outlined, "${property.bathrooms} Bathrooms"),
        _buildFeatureItem(Icons.kitchen_outlined, "${property.kitchens} Kitchens"),
        _buildFeatureItem(Icons.garage_outlined, "${property.garages} Garages"),
        _buildFeatureItem(Icons.weekend_outlined, "${property.livingRooms} Living Room"),
        _buildFeatureItem(Icons.deck_outlined, "Backyard"),
        _buildFeatureItem(Icons.chair_outlined, "Family Room"),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.secondaryColor.withOpacity(0.40)),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 10, color: AppColors.secondaryColor.withOpacity(0.40), fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}