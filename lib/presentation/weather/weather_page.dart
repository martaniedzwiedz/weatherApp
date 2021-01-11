import 'package:auto_route/auto_route.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/injection/bloc_factory.dart';
import 'package:weather_app/presentation/weather/weather_bloc.dart';
import 'package:weather_app/presentation/weather/weather_event.dart';
import 'package:weather_app/presentation/weather/weather_state.dart';
import 'package:weather_app/presentation/weather/widgets/error_widget.dart';
import 'package:weather_app/presentation/weather/widgets/loading_widget.dart';
import 'package:weather_app/presentation/weather/widgets/weather_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class WeatherPage extends StatefulWidget implements AutoRouteWrapper {
  @override
  _WeatherPageState createState() => _WeatherPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    BlocFactory blocFactory = BlocFactory.of(context);
    return BlocProvider<WeatherBloc>(
        create: (context) => blocFactory.get<WeatherBloc>(), child: this);
  }
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    initializeDateFormatting('en', null);
    BlocProvider.of<WeatherBloc>(context).add(LoadWeather());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.weather_page_weather_app.tr()),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherLoaded) {
          return WeatherWidget(
            weathers: state.weatherList,
          );
        } else if (state is WeatherLoading) {
          return LoadingWidget();
        } else if (state is WeatherError) {
          return ErrorLoadWidget();
        } else {
          return Container();
        }
      }),
    );
  }
}
