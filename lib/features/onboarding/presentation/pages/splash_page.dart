import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/app_colors.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        context.router.replace(const OnboardingRoute());
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SvgPicture.asset(
          AppAssets.logo,
          width: 180,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
