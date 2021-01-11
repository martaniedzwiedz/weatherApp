import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/presentation/weather/selected_weather_day.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SelectedWeatherItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedWeatherDay>(
      builder: (context, provider, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          Text(
            DateFormat('EEEE')
                .format(DateTime.parse(provider.state.applicableDate)),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            provider.state.weatherStateName,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 16),
          WebsafeSvg.network(
              Utils.mapWeatherTypeToUrl(provider.state.weatherStateName),
              height: 200,
              width: 200),
          SizedBox(height: 16),
          Text(
            "${provider.state.theTemp.toInt().toString()}°",
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          _buildInfoSection(provider)
        ],
      ),
    );
  }

  Widget _buildInfoSection(SelectedWeatherDay provider) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "${LocaleKeys.weather_page_humidity.tr()} ${provider.state.humidity.toString()}%",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 8),
        Text(
          "${LocaleKeys.weather_page_pressure.tr()} ${provider.state.airPressure.toString()}hPa",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 8),
        Text(
          "${LocaleKeys.weather_page_wind.tr()} ${provider.state.windSpeed.toStringAsFixed(2)}km/h",
          style: TextStyle(fontSize: 18),
        ),
      ]),
    );
  }
}
