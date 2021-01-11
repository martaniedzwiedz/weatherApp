import 'package:auto_route/auto_route_annotations.dart';
import 'package:weather_app/presentation/weather/weather_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: WeatherPage, initial: true),
  ],
)
class $Router {}
