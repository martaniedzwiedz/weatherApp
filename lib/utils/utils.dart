class Utils {
  static const baseUrl = "https://www.metaweather.com/static/img/weather/";

  static String mapWeatherTypeToUrl(String weather) {
    switch (weather) {
      case "Snow":
        return "${baseUrl}sn.svg";
      case "Sleet":
        return "${baseUrl}sl.svg";
      case "Hail":
        return "${baseUrl}h.svg";
      case "Thunderstorm":
        return "${baseUrl}t.svg";
      case "Heavy Rain":
        return "${baseUrl}hr.svg";
      case "Light Rain":
        return "${baseUrl}lr.svg";
      case "Showers":
        return "${baseUrl}s.svg";
      case "Heavy Cloud":
        return "${baseUrl}hc.svg";
      case "Light Cloud":
        return "${baseUrl}lc.svg";
      case "Clear":
        return "${baseUrl}c.svg";
      default:
        return "${baseUrl}sn.svg";
    }
  }
}