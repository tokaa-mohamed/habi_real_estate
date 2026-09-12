// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:real_estate/features/auth/presentation/pages/forgot_password_page.dart'
    as _i1;
import 'package:real_estate/features/auth/presentation/pages/login_page.dart'
    as _i2;
import 'package:real_estate/features/auth/presentation/pages/signup_page.dart'
    as _i5;
import 'package:real_estate/features/map/domain/entities/property_location_entity.dart'
    as _i9;
import 'package:real_estate/features/map/presentation/pages/property_map_page.dart'
    as _i4;
import 'package:real_estate/features/onboarding/presentation/pages/onboarding_page.dart'
    as _i3;
import 'package:real_estate/features/onboarding/presentation/pages/splash_page.dart'
    as _i6;

/// generated route for
/// [_i1.ForgotPasswordPage]
class ForgotPasswordRoute extends _i7.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i7.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.OnboardingPage]
class OnboardingRoute extends _i7.PageRouteInfo<void> {
  const OnboardingRoute({List<_i7.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i4.PropertyMapPage]
class PropertyMapRoute extends _i7.PageRouteInfo<PropertyMapRouteArgs> {
  PropertyMapRoute({
    _i8.Key? key,
    _i9.PropertyLocationEntity? initialProperty,
    double? initialLat,
    double? initialLong,
    String? initialTitle,
    String? initialLocation,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         PropertyMapRoute.name,
         args: PropertyMapRouteArgs(
           key: key,
           initialProperty: initialProperty,
           initialLat: initialLat,
           initialLong: initialLong,
           initialTitle: initialTitle,
           initialLocation: initialLocation,
         ),
         initialChildren: children,
       );

  static const String name = 'PropertyMapRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PropertyMapRouteArgs>(
        orElse: () => const PropertyMapRouteArgs(),
      );
      return _i4.PropertyMapPage(
        key: args.key,
        initialProperty: args.initialProperty,
        initialLat: args.initialLat,
        initialLong: args.initialLong,
        initialTitle: args.initialTitle,
        initialLocation: args.initialLocation,
      );
    },
  );
}

class PropertyMapRouteArgs {
  const PropertyMapRouteArgs({
    this.key,
    this.initialProperty,
    this.initialLat,
    this.initialLong,
    this.initialTitle,
    this.initialLocation,
  });

  final _i8.Key? key;

  final _i9.PropertyLocationEntity? initialProperty;

  final double? initialLat;

  final double? initialLong;

  final String? initialTitle;

  final String? initialLocation;

  @override
  String toString() {
    return 'PropertyMapRouteArgs{key: $key, initialProperty: $initialProperty, initialLat: $initialLat, initialLong: $initialLong, initialTitle: $initialTitle, initialLocation: $initialLocation}';
  }
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute({List<_i7.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignUpPage();
    },
  );
}

/// generated route for
/// [_i6.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashPage();
    },
  );
}
