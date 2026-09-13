import 'package:flutter/material.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class PropertyReviewsSection extends StatelessWidget {
  final dynamic property;
  final List reviews;
  const PropertyReviewsSection({super.key, required this.property, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("User Reviews", style: getBoldStyle(fontSize: 16, color: AppColors.black)),
            Text("See all", style: getRegularStyle(fontSize: 14, color: AppColors.primaryColor)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, size: 14, color: Colors.amber),
            const SizedBox(width: 4),
            Text('${property.rating} (${property.reviewsCount} Rating)', style: getBoldStyle(fontSize: 12, color: AppColors.secondaryColor.withOpacity(0.4))),
            const SizedBox(width: 12),
            Text("•", style: getBoldStyle(fontSize: 12, color: AppColors.secondaryColor.withOpacity(0.4))),
            const SizedBox(width: 12),
            Text('${property.reviewsCount} Reviews', style: getBoldStyle(fontSize: 12, color: AppColors.secondaryColor.withOpacity(0.4))),
          ],
        ),
        const SizedBox(height: 12),
        if (property.imagesGallery.isNotEmpty)
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: property.imagesGallery.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: 75,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(property.imagesGallery[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        const SizedBox(height: 12),
        reviews.isEmpty
            ? Text("No reviews yet.", style: TextStyle(color: AppColors.darkColor.withOpacity(0.4), fontSize: 12))
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage(review.userAvatar ?? 'https://i.imgur.com/8Km9tLL.jpg'),
                            ),
                            const SizedBox(width: 12),
                            Text(review.userName, style: getBoldStyle(fontSize: 14, color: AppColors.darkColor)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Row(
                              children: List.generate(
                                5,
                                (starIndex) => Icon(
                                  starIndex < review.rating ? Icons.star : Icons.star_border,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text('${review.rating}/5', style: getBoldStyle(fontSize: 12, color: AppColors.darkColor)),
                            const SizedBox(width: 8),
                            Text('•  ${_formatTimeAgo(review.createdAt)}', style: getRegularStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        if (review.commentTitle != null && review.commentTitle!.isNotEmpty) ...[
                          Text(review.commentTitle!, style: getBoldStyle(fontSize: 14, color: AppColors.darkColor)),
                          const SizedBox(height: 6),
                        ],
                        Text(
                          review.comment ?? '',
                          style: getRegularStyle(fontSize: 13, color: AppColors.darkColor.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ],
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final difference = DateTime.now().difference(dateTime);
    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }
}