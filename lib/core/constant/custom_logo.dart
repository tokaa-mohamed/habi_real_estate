import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_assets.dart';
import '../utils/app_colors.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.textColor = AppColors.primaryColor,
    this.iconColor = AppColors.primaryColor,
  });

  final double? height;
  final double? width;
  final BoxFit fit;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.logo,
      height: height ?? 48,
      width: width,
      fit: fit,
    );
  }
}
