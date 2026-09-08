import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../utils/app_texts.dart';

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
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.other_houses_rounded,
          color: iconColor,
          size: height ?? 36,
        ),
        const SizedBox(width: 8),
        Text(
          AppTexts.appName,
          style: TextStyle(
            fontSize: AppFonts.headlineMedium,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
