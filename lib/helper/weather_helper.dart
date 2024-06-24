import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:sky_scrapper/models/weather_model.dart';

class WeatherHelper {
  WeatherHelper._();
  static final WeatherHelper wHelper = WeatherHelper._();

  Future<Weather?> getWeatherData({String cityName = 'Surat'}) async {
    Weather? weather;

    String weatherApi =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=eb42031611601a1401c1e7423f7ce112";

    http.Response response = await http.get(Uri.parse(weatherApi), headers: {});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Weather allData = Weather.fromJson(data: data);
      return allData;
    }

    log(response.statusCode as String);
    return null;
  }
}
