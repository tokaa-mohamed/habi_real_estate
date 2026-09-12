import 'package:flutter/material.dart';
import '../../../../core/constant/cached_image_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/property_location_entity.dart';

class MapPropertyCard extends StatelessWidget {
  final PropertyLocationEntity property;
  final VoidCallback? onClose;
  final VoidCallback? onTapDetails;

  const MapPropertyCard({
    super.key,
    required this.property,
    this.onClose,
    this.onTapDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: property.mainImageUrl.isNotEmpty
                    ? CachedImageWidget(
                        imageUrl: property.mainImageUrl,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 90,
                        height: 90,
                        color: AppColors.lightGrayColor,
                        child: const Icon(Icons.home, color: AppColors.grey),
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColorLight,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            property.status,
                            style: getMediumStyle(
                              fontSize: 10,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        if (property.rating > 0) ...[
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          const SizedBox(width: 2),
                          Text(
                            property.rating.toStringAsFixed(1),
                            style: getBoldStyle(fontSize: 11, color: AppColors.darkColor),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      property.title,
                      style: getBoldStyle(
                        fontSize: 14,
                        color: AppColors.textPrimaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: AppColors.textSecondaryColor,
                        ),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            property.location,
                            style: getRegularStyle(
                              fontSize: 12,
                              color: AppColors.textSecondaryColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${property.price.toStringAsFixed(0)} ${property.priceUnit}',
                          style: getBoldStyle(
                            fontSize: 15,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        if (property.bedrooms > 0 || property.bathrooms > 0)
                          Row(
                            children: [
                              if (property.bedrooms > 0) ...[
                                const Icon(Icons.king_bed_outlined, size: 14, color: AppColors.grey2),
                                const SizedBox(width: 2),
                                Text('${property.bedrooms}', style: getMediumStyle(fontSize: 11, color: AppColors.grey2)),
                                const SizedBox(width: 8),
                              ],
                              if (property.bathrooms > 0) ...[
                                const Icon(Icons.bathtub_outlined, size: 14, color: AppColors.grey2),
                                const SizedBox(width: 2),
                                Text('${property.bathrooms}', style: getMediumStyle(fontSize: 11, color: AppColors.grey2)),
                              ],
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (onClose != null)
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: onClose,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.lightGrayColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 14,
                    color: AppColors.grey2,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
