import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/weather/weather.dart';
import 'package:weather_app/presentation/weather/selected_weather_day.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WeatherItem extends StatelessWidget {
  final Weather weather;

  WeatherItem({this.weather});

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedWeatherDay>(
      builder: (context, provider, child) => FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () => Provider.of<SelectedWeatherDay>(context, listen: false)
            .selectWeather(weather),
        child: Container(
          decoration: BoxDecoration(
            color: weather.id == provider.state.id
                ? Color(0xFFE8E8E8)
                : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(color: Color(0xFFE8E8E8)),
          ),
          width: 120.0,
          child: _buildInfoSection(),
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat('EEEE').format(DateTime.parse(weather.applicableDate)),
          ),
          Spacer(),
          WebsafeSvg.network(
              Utils.mapWeatherTypeToUrl(weather.weatherStateName),
              height: 30,
              width: 30),
          Spacer(),
          Text(
              "${weather.minTemp.toInt().toString()}°/${weather.maxTemp.toInt().toString()}°"),
        ],
      ),
    );
  }
}
