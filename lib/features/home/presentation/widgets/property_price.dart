import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';
import 'package:real_estate/features/favs/presentation/cubit/fav_cubit.dart';
import 'package:real_estate/features/favs/presentation/cubit/fav_state.dart';
import 'package:real_estate/features/home/data/models/property_model.dart';

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
                    BlocBuilder<FavoritesCubit, FavoritesState>(
                      builder: (context, state) {
bool isFavorite = false;
if (state is FavoritesLoaded) {
  isFavorite = state.favorites.any((fav) => (fav as dynamic).id.toString() == property.id.toString());
}

                        return InkWell(
                          onTap: () {
final favoritesCubit = context.read<FavoritesCubit>();
  
  final propertyModel = property is PropertyModel 
      ? property 
      : PropertyModel.fromEntity(property);

  favoritesCubit.toggleFavorite(
    property: propertyModel,
    isFavorite: isFavorite,
  );
                              ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(isFavorite ? 'Removed from favorites!' : 'Added to favorites!'),
                                backgroundColor: isFavorite ? Colors.grey : Colors.green,
                                duration: const Duration(milliseconds: 1000),
                              ),
                            );
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
                        );
                      },
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