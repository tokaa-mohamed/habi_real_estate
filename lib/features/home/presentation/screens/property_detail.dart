import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';
import 'package:real_estate/core/di.dart';
import 'package:real_estate/features/home/presentation/cubit/property_details_state.dart';
import 'package:real_estate/features/home/presentation/widgets/listing_agent.dart';
import 'package:real_estate/features/home/presentation/widgets/property_action.dart'; // تأكدي إن ده ملف البوتوم أكشن
import 'package:real_estate/features/home/presentation/widgets/property_description.dart';
import 'package:real_estate/features/home/presentation/widgets/property_details_header.dart';
import 'package:real_estate/features/home/presentation/widgets/property_feature_grid.dart';
import 'package:real_estate/features/home/presentation/widgets/property_location.dart';
import 'package:real_estate/features/home/presentation/widgets/property_price.dart';
import 'package:real_estate/features/home/presentation/widgets/property_reviews.dart';
import 'package:real_estate/features/home/presentation/widgets/suggested_properties.dart';
import '../cubit/property_details_cubit.dart';

@RoutePage()
class PropertyDetailsScreen extends StatelessWidget {
  final int propertyId;

  const PropertyDetailsScreen({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PropertyDetailsCubit>()..fetchPropertyDetails(propertyId),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
          builder: (context, state) {
            if (state is PropertyDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PropertyDetailsError) {
              return Center(
                child: Text(state.message, style: getBoldStyle(fontSize: 14, color: Colors.red)),
              );
            } else if (state is PropertyDetailsLoaded) {
              final property = state.property;
              final reviews = state.reviews;

              return Stack(
                children: [
                  // محتوى الصفحة القابل للتمرير
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PropertyHeaderWidget(property: property),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PropertyPriceSection(property: property),
                              const SizedBox(height: 16),
                              PropertyFeaturesGrid(property: property),
                              const SizedBox(height: 24),
                              PropertyDescriptionSection(property: property),
                              const SizedBox(height: 24),
                              const ListingAgentWidget(),
                              const SizedBox(height: 24),
                              PropertyLocationWidget(property: property),
                              const SizedBox(height: 24),
                              PropertyReviewsSection(property: property, reviews: reviews),
                              const SizedBox(height: 20),
                              Text('You Must Also Like', style: getBoldStyle(fontSize: 16, color: AppColors.black)),
                              const SizedBox(height: 20),
                              SuggestedPropertiesList(state: state),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // شريط الأزرار السفلي الثابت
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: PropertyBottomActionsWidget(property: property),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}