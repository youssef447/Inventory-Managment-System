// Date: 7/11/2024
// By: Youssef Ashraf,  Mohammed Ashraf
// Objectives: This file is responsible for providing the main widget of the application.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'inventory_management_module/core/extensions/extensions.dart';

import 'package:window_manager/window_manager.dart';
import 'inventory_management_module/core/di/injection.dart';
import 'inventory_management_module/core/constants/languages.dart';
import 'inventory_management_module/core/routes/app_routes.dart';
import 'inventory_management_module/core/routes/routes_generator.dart';
import 'inventory_management_module/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configurationDependencies();

  // init Dependencies
  await ScreenUtil.ensureScreenSize();

  // set min size for desktop window
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(375, 812));
  }
  // Run the app
  runApp(const InventoryManagement());
}

class InventoryManagement extends StatelessWidget {
  const InventoryManagement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: context.isTablett
          ? (context.isLandscape
              ? const Size(1024, 800)
              : const Size(768, 1024))
          : context.isLandscape
              ? const Size(812, 900)
              : const Size(375, 812),
      fontSizeResolver: (fontSize, instance) =>
          FontSizeResolvers.height(fontSize, instance),
      builder: (_, child) {
        return GetMaterialApp(
          // General
          debugShowCheckedModeBanner: false,
          title: 'Inventory Management',
          home: Column(
            children: [
              // Container(
              //   height: 100.h,
              //   color: Colors.red,
              // ),
              Expanded(
                child: Navigator(
                  key: inventoryNavKey,
                  onGenerateRoute: RouteGenerator.generateRoute,
                  initialRoute: Routes.home,
                ),
              ),
            ],
          ),

          // Routes
          onGenerateRoute: RouteGenerator.generateRoute,

          // Theme
          themeMode:
              AppTheme.isDark ?? false ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,

          // Localization
          translations: Languages(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
        );
      },
    );
  }
}
