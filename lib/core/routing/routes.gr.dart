// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    PropertyDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PropertyDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PropertyDetailsScreen(
          key: args.key,
          propertyId: args.propertyId,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PropertyDetailsScreen]
class PropertyDetailsRoute extends PageRouteInfo<PropertyDetailsRouteArgs> {
  PropertyDetailsRoute({
    Key? key,
    required int propertyId,
    List<PageRouteInfo>? children,
  }) : super(
          PropertyDetailsRoute.name,
          args: PropertyDetailsRouteArgs(
            key: key,
            propertyId: propertyId,
          ),
          initialChildren: children,
        );

  static const String name = 'PropertyDetailsRoute';

  static const PageInfo<PropertyDetailsRouteArgs> page =
      PageInfo<PropertyDetailsRouteArgs>(name);
}

class PropertyDetailsRouteArgs {
  const PropertyDetailsRouteArgs({
    this.key,
    required this.propertyId,
  });

  final Key? key;

  final int propertyId;

  @override
  String toString() {
    return 'PropertyDetailsRouteArgs{key: $key, propertyId: $propertyId}';
  }
}
