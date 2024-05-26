import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants/api/api_urls.dart';
import 'package:weather_app/models/daily_forecast.dart';
import 'package:weather_app/models/location_details.dart';

class WeatherService {
  final String apiKey = ApiUrls.apiKey;

  Future<LocationDetails?> getGeoPosition(
      double latitude, double longitude) async {
    final url =
        'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=$apiKey&q=$latitude%2C$longitude';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return LocationDetails.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load location data');
    }
  }

  Future<List<DailyForecast>> getWeatherForecasts(String locationKey) async {
    final url =
        'http://dataservice.accuweather.com/forecasts/v1/daily/5day/$locationKey?apikey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List<dynamic> dailyForecastsJson = jsonBody['DailyForecasts'];
      return dailyForecastsJson
          .map((forecastJson) => DailyForecast.fromJson(forecastJson))
          .toList();
    } else {
 
      throw Exception('Failed to load weather forecasts');
    }
  }
}
