import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/controller/theme_providers.dart';
import 'package:sky_scrapper/utils/app_routes.dart';

import 'helper/theme_helper.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: Provider.of<ThemeProviders>(context).isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: 'splash_screen',
      routes: AppRoutes.instance.allRoutes,
    );
  }
}
