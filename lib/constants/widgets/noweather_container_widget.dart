import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/provider/weather_provider.dart';

class NoWeatherContainerWidget extends StatelessWidget {
  const NoWeatherContainerWidget({
    required this.weatherProvider,
    super.key,
  });
  final WeatherProvider weatherProvider;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await weatherProvider.fetchCurrentLocation();
      },
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black12),
              onPressed: () async {
                await weatherProvider.fetchCurrentLocation();
              },
              child: const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 4),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Lottie.asset(Assets.noLocation),
              ),
              const Text(
                'Tap the location icon to fetch weather',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ],
      ),
    );
  }
}
