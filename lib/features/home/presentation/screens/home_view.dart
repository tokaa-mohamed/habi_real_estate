import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';
import 'package:real_estate/features/home/presentation/widgets/category-list.dart';
import 'package:real_estate/features/home/presentation/widgets/property_ccard.dart';
import '../../../../core/di.dart'; 
import '../cubit/home_cubit.dart';
import '../widgets/home_header.dart';
import '../widgets/home_search_bar.dart';

@RoutePage() 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..fetchProperties(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),
                  const SizedBox(height: 16),
                  const HomeSearchBar(),
                  const SizedBox(height: 16),
                  const CategoriesList(),
                  const SizedBox(height: 20),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Best Offers", style: getBoldStyle(fontSize: 20, color: AppColors.darkColor)),
                      Text("View All", style: getBoldStyle(fontSize: 14, color: AppColors.primaryColor)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is HomeLoaded) {
                        if (state.bestOffers.isEmpty) {
                          return const Center(child: Text("No properties found"));
                        }
                        return SizedBox(
                          height: 260,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.bestOffers.length,
                            separatorBuilder: (context, index) => const SizedBox(width: 16),
                            itemBuilder: (context, index) {
                              return PropertyCard(
                                property: state.bestOffers[index],
                                isLandscape: true, 
                                                              );
                            },
                          ),
                        );
                      } else if (state is HomeError) {
                        return Center(child: Text(state.message));
                      }
                      return const SizedBox.shrink();
                    },
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nearest You", style: getBoldStyle(fontSize: 20, color: AppColors.darkColor)),
                      Text("View All", style: getBoldStyle(fontSize: 14, color: AppColors.primaryColor)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoaded) {
                        if (state.nearestProperties.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(child: Text("No nearest properties found")),
                          );
                        }
                        return ListView.separated(
                          shrinkWrap: true, 
                                                    physics: const NeverScrollableScrollPhysics(), 
                                                      itemCount: state.nearestProperties.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return PropertyCard(
                              property: state.nearestProperties[index],
                              isLandscape: false, 
                                                          );
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}