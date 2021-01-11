import 'package:flutter/material.dart';
import 'package:weather_app/data/weather/weather.dart';

@immutable
abstract class WeatherState {}

class WeatherError extends WeatherState {
  final String message;

  WeatherError({this.message});
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<Weather> weatherList;

  WeatherLoaded({this.weatherList});
}
