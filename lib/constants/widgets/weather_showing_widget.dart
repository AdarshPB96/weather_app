import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/widgets/extracted_widgets.dart';
import 'package:weather_app/constants/widgets/today_weather_container.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/view/home_screen.dart';

class WeatherShowingWidget extends StatelessWidget {
  const WeatherShowingWidget({
    super.key,
    required this.date,
    required this.weatherProvider
  });

  final String? date;
   final WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 8.0),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await weatherProvider.fetchCurrentLocation();
              },
              child: Icon(Icons.location_on),
            ),
          ),
          SizedBox(height: 16.0),
          TodayWeatherContainer(
            date: date,
            weatherProvider: weatherProvider,
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Next 4 Days',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount:
                  weatherProvider.weatherForecasts!.length -
                      1,
              itemBuilder: (context, index) {
                final forecast = weatherProvider
                    .weatherForecasts![index + 1];
                return WeatherCard(
                  day: DateFormat.EEEE()
                      .format(DateTime.parse(forecast.date)),
                  condition: forecast.day.iconPhrase,
                  temperature:
                      '${forecast.temperature.maximum.value.toString()}° ${forecast.temperature.maximum.unit}',
                );
              },
            ),
          ),
        ],
      );
  }
}
