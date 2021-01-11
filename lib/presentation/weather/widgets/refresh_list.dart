import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/weather/weather_bloc.dart';
import 'package:weather_app/presentation/weather/weather_event.dart';
import 'package:weather_app/presentation/weather/widgets/selected_weather_item.dart';

class RefreshList extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async =>
          BlocProvider.of<WeatherBloc>(context).add(LoadWeather()),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
        child: ListView(children: [SelectedWeatherItem()]),
      ),
    );
  }
}
