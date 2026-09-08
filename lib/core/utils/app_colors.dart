import 'package:flutter/material.dart';

class AppColors {
  // HabiSpace Primary Brand Palette
  static const Color primaryColor = Color(0xFF139FA8); // HabiSpace Teal
  static const Color primaryColorDarkAccent = Color(0xFF0E7A82);
  static const Color secondaryColor = Color(0xFF1E1E1E); // Dark Slate / Apple Button
  static const Color scaffoldBackground = Color(0xFFFAF9F6); // Soft off-white background

  static const Color darkColor = Color(0xFF1A1A1A);
  static const Color lightGrayColor = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color bordergrey = Color(0xFFEAEAEA);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color grey2 = Color(0xFF757575);
  static const Color inputFieldFill = Color(0xFFFAFAFA);

  // Social Buttons
  static const Color googleBtnBackground = Color(0xFFECECEC);
  static const Color appleBtnBackground = Color(0xFF1E1E1E);

  // Legacy color references for compatibility
  static const Color blue = primaryColor;
  static const Color blue2 = primaryColorDarkAccent;
  static const Color pink = primaryColor;
  static const Color yello = primaryColorDarkAccent;

  static const Color errorColor = Color(0xFFDC3545);
  static const Color successColor = Color(0xFF28A745);
  static const Color warningColor = Color(0xFFFFC107);
  static const Color infoColor = Color(0xFF17A2B8);

  static const Color textPrimaryColor = darkColor;
  static const Color textSecondaryColor = Color(0xFF6C757D);
  static const Color textLightColor = Color(0xFF9E9E9E);
  static const Color textOnPrimaryColor = white;
  static const Color textOnSecondaryColor = darkColor;

  static const Color borderColor = lightGrayColor;
  static const Color dividerColor = lightGrayColor;
  static const Color cardBorderColor = lightGrayColor;

  static const Color shadowColor = Color(0x1A000000);
  static const Color primaryShadowColor = Color(0x4DC67C4E);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, Color(0xffFFFFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondaryColor, Color(0xFFE8C4A8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color onlineColor = successColor;
  static const Color offlineColor = Color(0xFF6C757D);
  static const Color pendingColor = warningColor;
  static const Color cancelledColor = errorColor;

  static Color get primaryColorLight => primaryColor.withValues(alpha: 0.1);
  static Color get primaryColorMedium => primaryColor.withValues(alpha: 0.3);
  static Color get primaryColorDark => primaryColor.withValues(alpha: 0.8);

  static Color get secondaryColorLight => secondaryColor.withValues(alpha: 0.1);
  static Color get secondaryColorMedium =>
      secondaryColor.withValues(alpha: 0.3);
  static Color get secondaryColorDark => secondaryColor.withValues(alpha: 0.8);

  static const Color darkwhite = Color(0xFF121212);
  static const Color darkCardColor = Color(0xFF2D2D2D);
  static const Color darkBorderColor = Color(0xFF404040);
  static const Color darkTextPrimaryColor = Color(0xFFFFFFFF);
  static const Color darkTextSecondaryColor = Color(0xFFB0B0B0);

  static const LinearGradient tealGradient = LinearGradient(
    colors: [primaryColor, primaryColorDarkAccent],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient blueGradient = tealGradient;

  static Color getAdaptiveBorderColor(BuildContext context) {
    return borderColor;
  }
}