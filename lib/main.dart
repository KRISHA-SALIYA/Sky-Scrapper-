import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/app.dart';
import 'package:sky_scrapper/controller/serch_provider.dart';
import 'package:sky_scrapper/controller/theme_providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProviders(),
        ),
        ChangeNotifierProvider(
          create: (_) => SerchProvier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
