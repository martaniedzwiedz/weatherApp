import 'package:get_it/get_it.dart';
import 'package:weather_app/presentation/weather/weather_bloc.dart';

void registerBlocModule(GetIt injector) {
  injector.registerFactory(() => WeatherBloc(injector.get()));
}
