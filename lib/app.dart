import 'package:flutter/material.dart';
import 'package:flexpay_app/core/routes/app_router.dart';
import 'package:flexpay_app/core/theme/app_theme.dart';

class FlexPayApp extends StatelessWidget {
  const FlexPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FlexPay',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
