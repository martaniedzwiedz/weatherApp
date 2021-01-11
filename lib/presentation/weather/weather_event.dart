import 'package:flutter/material.dart';
import 'package:weather_app/data/weather/weather.dart';

@immutable
abstract class WeatherEvent {}

class LoadWeather extends WeatherEvent {}
