import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/core/routing/routes.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/features/home/domain/entitties/property_entity.dart';

class PropertyCard extends StatelessWidget {
  final PropertyEntity property;
  final bool isLandscape; 
  
  const PropertyCard({
    super.key,
    required this.property,
    this.isLandscape = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

context.router.push(

PropertyDetailsRoute(propertyId: property.id), 

);

   },
      child: isLandscape
          ? Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      property.mediaUrl,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 140,
                        color: Colors.grey[200],
                        child: const Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            property.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/location-png-icon.png',
                                width: 12,
                                height: 12,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  property.location,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 11,
                                  ),
                                  maxLines: 1,
                                ),
                              ),

                              Text("  | ",
                              

                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                              ),
                              ),

                              const SizedBox(width: 4),

                                                            SvgPicture.asset(
                                'assets/icons/travel-icon.svg',
                                width: 12,
                                height: 12,
                              ),

                              Expanded(
                                child: Text(
                                  property.distanceMiles != null ? '${property.distanceMiles} miles' : 'Distance unknown',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 11,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                            ],
                          ),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
    children: [
    Text(
      '${property.price} ${property.priceUnit}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
        fontSize: 13,
      ),
    ),
    
    Row(
      mainAxisSize: MainAxisSize.min, 
            children: [

                Image.asset(
          'assets/icons/gold-icon.png',
          width: 12,
          height: 12,
        ),


                const SizedBox(width: 4),

        Text(
          property.rating != null ? '${property.rating}' : 'No rating', 
                    style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 11,
          ),
        ),
      ],
    ),
  ],
),





                          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
  width: double.infinity,
  height: 110,
  padding: const EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  child: Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          property.mediaUrl,
          width: 95,
          height: 94,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 95,
            height: 94,
            color: Colors.grey[200],
            child: const Icon(Icons.image_not_supported),
          ),
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              property.title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
Row(
  children: [
    // 1. أيقونة اللوكيشن
    Image.asset(
      'assets/icons/location-png-icon.png',
      width: 13,
      height: 13,
      color: Colors.black.withOpacity(0.44),
    ),
    const SizedBox(width: 4),

    Expanded(
      child: Text(
        property.location,
        style: TextStyle(
          color: Colors.black.withOpacity(0.6),
          fontSize: 12,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ),

    Text(
      "|",
      style: TextStyle(
        color: Colors.black.withOpacity(0.6),
        fontSize: 12,
      ),
    ),
    const SizedBox(width: 6), 
        SvgPicture.asset(
      'assets/icons/travel-icon.svg',
      width: 12,
      height: 12,
    ),
    const SizedBox(width: 4),

    Text(
      '${property.distanceMiles} miles',
      style: TextStyle(
        color: Colors.black.withOpacity(0.6),
        fontSize: 12,
      ),
    ),
  ],
),            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${property.price} ${property.priceUnit}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                    fontSize: 13,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/gold-icon.png',
                      width: 12,
                      height: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      property.rating != null ? '${property.rating}' : 'No rating',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
),
    );
  }


  }