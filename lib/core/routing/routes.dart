import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/features/home/presentation/screens/home_view.dart';
import 'package:real_estate/features/home/presentation/screens/property360view.dart';
import 'package:real_estate/features/home/presentation/screens/property_detail.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: PropertyDetailsRoute.page),
     //   AutoRoute(page: Property360ScreenRoute.page), 
              ];
}