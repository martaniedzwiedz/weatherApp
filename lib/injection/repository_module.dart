import 'package:get_it/get_it.dart';
import 'package:weather_app/repositories/weather_repository.dart';

void registerRepositoryModule(GetIt injector) {
  injector.registerFactory<WeatherRepository>(
      () => WeatherRepositoryImpl(injector.get()));
}
