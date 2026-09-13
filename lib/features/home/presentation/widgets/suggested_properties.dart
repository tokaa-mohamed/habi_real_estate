import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class SuggestedPropertiesList extends StatelessWidget {
  final dynamic state;
  const SuggestedPropertiesList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.suggestedProperties.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final property = state.suggestedProperties[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.withOpacity(0.15)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      property.mediaUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 200,
                        color: Colors.grey[200],
                        child: const Icon(Icons.image_not_supported, size: 40),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.local_offer_outlined, size: 14, color: AppColors.primaryColor),
                          const SizedBox(width: 4),
                          Text(property.status, style: getBoldStyle(fontSize: 12, color: AppColors.darkColor)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            property.title,
                            style: getBoldStyle(fontSize: 16, color: AppColors.darkColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SvgPicture.asset('assets/icons/star-icon.svg', width: 24, height: 24),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(property.location, style: getRegularStyle(fontSize: 12, color: AppColors.secondaryColor.withOpacity(0.4))),
                        const SizedBox(width: 12),
                        const Icon(Icons.navigation_outlined, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text('${property.distanceMiles} miles', style: getRegularStyle(fontSize: 12, color: AppColors.secondaryColor.withOpacity(0.4))),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        if (property.bedrooms > 0) _buildFeatureChip(Icons.bed_outlined, '${property.bedrooms} Bedrooms'),
                        if (property.bathrooms > 0) _buildFeatureChip(Icons.bathtub_outlined, '${property.bathrooms} Bathrooms'),
                        if (property.kitchens > 0) _buildFeatureChip(Icons.kitchen_outlined, 'Kitchen'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '\$${property.price}',
                            style: getBoldStyle(fontSize: 16, color: AppColors.primaryColor),
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
      },
    );
  }

  Widget _buildFeatureChip(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(label, style: getRegularStyle(fontSize: 11, color: Colors.grey)),
        const SizedBox(width: 8),
      ],
    );
  }
}