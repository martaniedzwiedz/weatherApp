import 'package:bloc/bloc.dart';
import 'package:weather_app/presentation/weather/weather_event.dart';
import 'package:weather_app/presentation/weather/weather_state.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherLoading());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is LoadWeather) {
      yield* _mapLoadWeather();
    }
  }

  Stream<WeatherState> _mapLoadWeather() async* {
    try {
      var list = await _weatherRepository.getWeather();
      yield WeatherLoaded(weatherList: list);
    } catch (error) {
      yield WeatherError(message: error);
    }
  }
}
