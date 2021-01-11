import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/presentation/weather/weather_bloc.dart';
import 'package:weather_app/presentation/weather/weather_event.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorLoadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          LocaleKeys.weather_page_error_occur.tr(),
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        RaisedButton(
            child: Text(LocaleKeys.weather_page_try_again.tr()),
            onPressed: () =>
                BlocProvider.of<WeatherBloc>(context).add(LoadWeather()))
      ]),
    );
  }
}
