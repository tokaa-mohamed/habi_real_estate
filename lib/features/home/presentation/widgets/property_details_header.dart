import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

// 1. الهيدر العلوي للصورة الرئيسية مع تفاصيل العقار
class PropertyHeaderWidget extends StatelessWidget {
  final dynamic property;
  const PropertyHeaderWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
          child: Image.network(
            property.mediaUrl,
            height: 360,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 360,
              color: Colors.grey[300],
              child: const Icon(Icons.image_not_supported, size: 50),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/arrow-left.svg', width: 24, height: 24),
                    onPressed: () => context.router.pop(),
                  ),
                ),
                Text(
                  "Property Detail",
                  style: getBoldStyle(fontSize: 16, color: Colors.white),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/arrow-right.svg', width: 24, height: 24),
                    onPressed: () => context.router.pop(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                property.title,
                style: getBoldStyle(fontSize: 26, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 16, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(property.location, style: const TextStyle(color: Colors.white, fontSize: 13)),
                  const SizedBox(width: 12),
                  const Text("|", style: TextStyle(color: Colors.white54)),
                  const SizedBox(width: 12),
                  const Icon(Icons.navigation_outlined, size: 16, color: Colors.white),
                  const SizedBox(width: 4),
                  Text("${property.distanceMiles} miles", style: const TextStyle(color: Colors.white, fontSize: 13)),
                  const SizedBox(width: 12),
                  const Text("|", style: TextStyle(color: Colors.white54)),
                  const SizedBox(width: 12),
                  const Icon(Icons.star, size: 16, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text('${property.rating}', style: getBoldStyle(fontSize: 13, color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}