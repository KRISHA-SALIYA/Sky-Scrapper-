import 'package:flutter/material.dart';
import '../helper/weather_helper.dart';

class SerchProvier extends ChangeNotifier {
  List cityData = [];

  String cityName = "Surat";

  SerchProvier() {
    searchCity();
    notifyListeners();
  }

  searchCity() async {
    cityData =
        await WeatherHelper.wHelper.getWeatherData(cityName: cityName) as List;
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }
}
