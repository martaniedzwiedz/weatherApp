import 'package:flutter/material.dart';
import 'package:weather_app/data/weather/weather.dart';

class SelectedWeatherDay with ChangeNotifier {
  SelectedWeatherDay(Weather initWeather) {
    _state = initWeather;
  }

  Weather _state;

  Weather get state => _state;

  void selectWeather(Weather weather) {
    _state = weather;
    notifyListeners();
  }
}
