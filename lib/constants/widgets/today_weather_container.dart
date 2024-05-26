
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/widgets/extracted_widgets.dart';
import 'package:weather_app/provider/weather_provider.dart';

class TodayWeatherContainer extends StatelessWidget {
  const TodayWeatherContainer(
      {super.key, required this.date, required this.weatherProvider});

  final String? date;
  final WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weatherProvider.areadetails['locality'] ?? '',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      weatherProvider.areadetails['city'] ?? '',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      weatherProvider.areadetails['district'] ?? '',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Column(
                children: [
                  Text(
                    ' ${DateFormat.EEEE().format(DateTime.parse(date ?? ''))} (Today)',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Lottie.asset(
                      getAnimationPath(
                          weatherProvider.weatherForecasts?[0].day.iconPhrase ??
                              ''),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                weatherProvider.weatherForecasts?[0].day.iconPhrase ?? '',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${weatherProvider.weatherForecasts?[0].temperature.maximum.value.toString()}° ${weatherProvider.weatherForecasts?[0].temperature.maximum.unit}' ??
                    '',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
