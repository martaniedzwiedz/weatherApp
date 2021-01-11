import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(nullable: false)
class Weather {
  final int id;
  @JsonKey(name: "weather_state_name")
  final String weatherStateName;
  @JsonKey(name: "applicable_date")
  final String applicableDate;
  @JsonKey(name: "air_pressure")
  final double airPressure;
  final double humidity;
  @JsonKey(name: "wind_speed")
  final double windSpeed;
  @JsonKey(name: "the_temp")
  final double theTemp;
  @JsonKey(name: "max_temp")
  final double maxTemp;
  @JsonKey(name: "min_temp")
  final double minTemp;

  Weather(
      {this.id,
      this.airPressure,
      this.applicableDate,
      this.humidity,
      this.theTemp,
      this.weatherStateName,
      this.windSpeed,
      this.maxTemp,
      this.minTemp});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
