import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/data/weather_response/weather_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "")
abstract class ApiClient {
  static ApiClient create([Dio client]) => ApiClient(client);

  factory ApiClient(Dio dio, {String baseUrl}) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET("/location/44418/")
  Future<WeatherResponse> getWeather();

}
