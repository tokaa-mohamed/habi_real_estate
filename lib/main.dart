import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di.dart';
import 'core/routes/app_router.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_fonts.dart';
import 'core/utils/app_texts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp.router(
          title: AppTexts.appName,
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(),
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: AppFonts.fontFamily,
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
