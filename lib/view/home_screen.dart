import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/constants/widgets/noweather_container_widget.dart';
import 'package:weather_app/constants/widgets/weather_showing_widget.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<WeatherProvider>(
            builder: (context, weatherProvider, child) {
              final String? date =
                  weatherProvider.weatherForecasts?[0].date?.toString();
              return weatherProvider.isLoading
                  ? Center(
                      child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Lottie.asset(Assets.loading),
                    ))
                  : weatherProvider.areadetails == null
                      ?  NoWeatherContainerWidget(weatherProvider: weatherProvider)
                      : WeatherShowingWidget(date: date,weatherProvider: weatherProvider,);
            },
          ),
        ),
      ),
    );
  }
}



