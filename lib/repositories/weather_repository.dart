import 'package:dio/dio.dart';
import 'package:weather_app/data/api_error/api_error.dart';
import 'package:weather_app/data/weather/weather.dart';
import 'package:weather_app/networking/api_client.dart';

abstract class WeatherRepository {
  Future<List<Weather>> getWeather();
}

class WeatherRepositoryImpl implements WeatherRepository {
  final ApiClient _apiClient;

  WeatherRepositoryImpl(this._apiClient);

  @override
  Future<List<Weather>> getWeather() async {
    try {
      final response = await _apiClient.getWeather();
      return response.consolidatedWeather;
    } on DioError catch (error) {
      throw ApiError.fromJson(error.response.data as Map<String, dynamic>);
    }
  }
}
