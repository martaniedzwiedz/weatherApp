import 'package:flutter/cupertino.dart';
import 'package:weather_app/data/weather/weather.dart';
import 'package:weather_app/presentation/weather/widgets/weather_item.dart';

class BottomWeatherList extends StatelessWidget {
  final List<Weather> weathers;

  BottomWeatherList({this.weathers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          itemCount: weathers.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => WeatherItem(weather: weathers[index])),
    );
  }
}
