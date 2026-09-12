import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/property_location_entity.dart';
import '../cubit/map_cubit.dart';
import '../cubit/map_state.dart';
import '../widgets/property_map_widget.dart';

@RoutePage()
class PropertyMapPage extends StatelessWidget {
  final PropertyLocationEntity? initialProperty;
  final double? initialLat;
  final double? initialLong;
  final String? initialTitle;
  final String? initialLocation;

  const PropertyMapPage({
    super.key,
    this.initialProperty,
    this.initialLat,
    this.initialLong,
    this.initialTitle,
    this.initialLocation,
  });

  @override
  Widget build(BuildContext context) {
    PropertyLocationEntity? customInitial;
    if (initialProperty != null) {
      customInitial = initialProperty;
    } else if (initialLat != null && initialLong != null) {
      customInitial = PropertyLocationEntity(
        id: 0,
        title: initialTitle ?? 'Estate Location',
        location: initialLocation ?? 'Location on Map',
        price: 0,
        mainImageUrl: '',
        latitude: initialLat!,
        longitude: initialLong!,
      );
    }

    return BlocProvider(
      create: (context) {
        final cubit = getIt<MapCubit>();
        if (customInitial != null) {
          cubit.setSingleProperty(customInitial);
        } else {
          cubit.fetchPropertyLocations();
        }
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0.5,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.darkColor,
              size: 20,
            ),
            onPressed: () => context.router.maybePop(),
          ),
          title: Text(
            'Property Map',
            style: getBoldStyle(fontSize: 18, color: AppColors.darkColor),
          ),
          centerTitle: true,
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    context.read<MapCubit>().fetchPropertyLocations();
                  },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            if (state is MapLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            } else if (state is MapError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: AppColors.errorColor,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      state.message,
                      style: getMediumStyle(
                        fontSize: 14,
                        color: AppColors.textSecondaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        context.read<MapCubit>().fetchPropertyLocations();
                      },
                      child: Text(
                        'Retry',
                        style: getBoldStyle(
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is MapLoaded) {
              if (state.properties.isEmpty) {
                return Center(
                  child: Text(
                    'No property locations found',
                    style: getMediumStyle(
                      fontSize: 14,
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                );
              }

              return PropertyMapWidget(
                properties: state.properties,
                selectedProperty: state.selectedProperty,
                onPropertySelected: (property) {
                  context.read<MapCubit>().selectProperty(property);
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
