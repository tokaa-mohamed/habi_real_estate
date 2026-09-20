import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:real_estate/core/di.dart';
import 'package:real_estate/core/routes/app_router.gr.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';
import 'package:real_estate/features/favs/presentation/cubit/fav_cubit.dart';
import 'package:real_estate/features/favs/presentation/cubit/fav_state.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoritesCubit>()..fetchFavorites(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          title: Text('Favorite Properties', style: getBoldStyle(fontSize: 18, color: AppColors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoritesError) {
              return Center(child: Text(state.message, style: getBoldStyle(fontSize: 14, color: Colors.red)));
            } else if (state is FavoritesLoaded) {
              if (state.favorites.isEmpty) {
                return Center(
                  child: Text('No favorite properties yet!', style: getRegularStyle(fontSize: 16, color: Colors.grey)),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  final property = state.favorites[index];
                  return InkWell(
                    onTap: () {
                      context.router.push(PropertyDetailsRoute(propertyId: property.id));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.withOpacity(0.15)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.network(
                              property.mediaUrl,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(property.title, style: getBoldStyle(fontSize: 16, color: AppColors.darkColor)),
                                const SizedBox(height: 8),
                                Text(property.location, style: getRegularStyle(fontSize: 12, color: Colors.grey)),
                                const SizedBox(height: 12),
                                Text('\$${property.price}', style: getBoldStyle(fontSize: 16, color: AppColors.primaryColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}