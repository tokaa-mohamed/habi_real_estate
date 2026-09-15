import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/constant/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:real_estate/core/routing/routes.dart';
import 'core/di.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_texts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    publishableKey: AppConstants.supabaseAnonKey,
  );
  await initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ), // Standard Figma mobile design canvas size
      minTextAdapt: true,

      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: AppTexts.appName,
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(),
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.scaffoldBackground,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryColor,
              primary: AppColors.primaryColor,
              surface: AppColors.scaffoldBackground,
            ),
          ),
        );
      },
    );
  }
}
