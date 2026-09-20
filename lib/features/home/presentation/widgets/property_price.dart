import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';
import 'package:real_estate/core/di.dart';
import 'package:real_estate/features/favs/domain/usecases/remove_usecase.dart';
import 'package:real_estate/features/favs/presentation/cubit/fav_cubit.dart';

class PropertyPriceSection extends StatefulWidget {
  final dynamic property; 
  
  const PropertyPriceSection({super.key, required this.property});

  @override
  State<PropertyPriceSection> createState() => _PropertyPriceSectionState();
}

class _PropertyPriceSectionState extends State<PropertyPriceSection> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${widget.property.price}',
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
                      widget.property.status,
                      style: getBoldStyle(fontSize: 12, color: AppColors.black),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          isFavorite = !isFavorite; 
                                                  });

                        try {
                          final favoritesCubit = getIt<FavoritesCubit>();
                          
                          if (isFavorite) {
                            favoritesCubit.toggleFavorite(widget.property.id); 
                                                        ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added to favorites!'),
                                backgroundColor: Colors.green,
                                duration: Duration(milliseconds: 1000),
                              ),
                            );
                          } else {
                            final removeUseCase = getIt<RemoveFromFavoritesUseCase>();
                            await removeUseCase(widget.property.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Removed from favorites!'),
                                backgroundColor: Colors.grey,
                                duration: Duration(milliseconds: 1000),
                              ),
                            );
                          }
                        } catch (e) {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error: ${e.toString()}'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SvgPicture.asset(
                          'assets/icons/star-icon.svg',
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            isFavorite ? Colors.amber : Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
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