import 'package:flutter/material.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';
import 'package:real_estate/features/home/presentation/screens/property360view.dart';

class PropertyBottomActionsWidget extends StatelessWidget {
  final dynamic property; 
  
  const PropertyBottomActionsWidget({super.key, required this.property}); // استقبلناه في البناء

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightPrimaryColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
builder: (context) => Property360Screen(
                      propertyTitle: property.title ?? "Property 360 View",
                      frontImageUrl: property.front360Url ?? property.mediaUrl,
                      backImageUrl: property.back360Url ?? property.mediaUrl,
                      sideImageUrl: property.side360Url ?? property.mediaUrl,
                      livingRoomImageUrl: property.livingRoom360Url ?? property.mediaUrl,
                      kitchenImageUrl: property.kitchen360Url ?? property.mediaUrl,
                      bedroomImageUrl: property.bedroom360Url ?? property.mediaUrl,
                      bathroomImageUrl: property.bathroom360Url ?? property.mediaUrl,
                    ),                  ),
                );
              },
              child: Text("Explore 360 View", style: getBoldStyle(fontSize: 14, color: AppColors.primaryColor)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {},
              child: Text("Book a Call", style: getBoldStyle(fontSize: 14, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}