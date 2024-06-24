import 'package:flutter/material.dart';

import '../views/screens/home_screnns/home_page.dart';
import '../views/screens/splesh_screens/splesh_page.dart';

class AppRoutes {
  String spleshPage = '/';
  String homePage = 'homePage';

  Map<String, WidgetBuilder> allRoutes = {
    '/': (context) => const SpleshPage(),
    'homePage': (context) => const HomePage(),
  };
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();
}

List days = [
  '',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];
List months = [
  '',
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'June',
  'July',
  'Aug',
  'Sup',
  'Oct',
  'Nov',
  'Dec',
];
