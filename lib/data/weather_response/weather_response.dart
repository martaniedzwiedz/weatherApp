import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/weather/weather.dart';

part 'weather_response.g.dart';

@JsonSerializable(nullable: false)
class WeatherResponse {
  @JsonKey(name: "consolidated_weather")
  final List<Weather> consolidatedWeather;

  WeatherResponse({this.consolidatedWeather});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
