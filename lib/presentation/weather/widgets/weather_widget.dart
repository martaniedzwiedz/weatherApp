import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/weather/weather.dart';
import 'package:weather_app/presentation/weather/selected_weather_day.dart';
import 'package:weather_app/presentation/weather/widgets/bottom_weather_list.dart';
import 'package:weather_app/presentation/weather/widgets/refresh_list.dart';

class WeatherWidget extends StatelessWidget {
  final List<Weather> weathers;

  WeatherWidget({this.weathers});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectedWeatherDay>(
      create: (context) => SelectedWeatherDay(weathers[0]),
      child: Stack(children: [_buildItem(), _buildList()]),
    );
  }

  Widget _buildList() {
    return Positioned.fill(
      left: 16.0,
      right: 16.0,
      bottom: 50.0,
      child: Align(
          alignment: Alignment.bottomCenter,
          child: BottomWeatherList(weathers: weathers)),
    );
  }

  Widget _buildItem() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topCenter,
        child: RefreshList(),
      ),
    );
  }
}
